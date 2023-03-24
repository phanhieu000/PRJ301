/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mywebsite.controller.admin;

import com.mywebsite.DAO.interfaces.IAccountAdminDAO;
import com.mywebsite.DAO.account.AccountAdminDAO;
import com.mywebsite.DAO.account.CountryDAO;
import com.mywebsite.model.Country;
import com.mywebsite.model.admin.AccountAdmin;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;

/**
 *
 * @author phanh
 */
@MultipartConfig
@WebServlet(name = "AdminSettingsController", urlPatterns = {"/admin-settings"})
public class AdminSettingsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminSettingsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminSettingsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("listCountry", new CountryDAO().getAll());
        request.getRequestDispatcher("views/admin/settings.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender_raw = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String birthday_raw = request.getParameter("birthday");
        String address = request.getParameter("address");
        String countryID_raw = request.getParameter("countryID");
        int gender;
        int countryID;
        try {
            gender = Integer.parseInt(gender_raw);
            countryID = Integer.parseInt(countryID_raw);

        } catch (NumberFormatException e) {
            gender = -1;
            countryID = 0;
        }

        HttpSession session = request.getSession();
        
        //upload ảnh
        Part file = request.getPart("avatar");

        String imageFileName = file.getSubmittedFileName(); // lấy ra file ảnh đã chọn

        System.out.println("selected image file name : " + imageFileName);

        String uploadPath = "D:/he163385/MyProject/web/adminPugins/images/avatar-user/" + imageFileName;

        System.out.println("UploadPath: " + uploadPath);
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

        } catch (IOException e) {
            System.out.println(e);
        }
        
        // thay database avatar
        AccountAdmin a = (AccountAdmin) session.getAttribute("accountAdmin");
        if(a != null){
            IAccountAdminDAO d = new AccountAdminDAO();
            String avatar = "adminPugins/images/avatar-user/" + imageFileName;
            d.updateAvatar(a.getAccountID(), avatar);
            a.getInformation().setAvatar(avatar);
        }

        AccountAdmin aNew = a;
        if (!email.equals(a.getEmail()) && email != null) {
            aNew.setEmail(email);
        }

        if (!firstName.equals(a.getInformation().getFirstName()) && firstName != null) {
            aNew.getInformation().setFirstName(firstName);
        }

        if (!lastName.equals(a.getInformation().getLastName()) && lastName != null) {
            aNew.getInformation().setLastName(lastName);
        }

        if (gender != a.getInformation().getGender() && gender_raw != null) {
            aNew.getInformation().setGender(gender);
        }

        if (!phone.equals(a.getInformation().getPhone()) && phone != null) {
            aNew.getInformation().setPhone(phone);
        }

        Date birthday = convertToSQLDATE(birthday_raw);
        if (!birthday.equals(a.getInformation().getBirthDay()) && birthday_raw != null) {
            aNew.getInformation().setBirthDay(birthday);
        }

        if (!address.equals(a.getInformation().getAddress()) && address != null) {
            aNew.getInformation().setAddress(address);
        }

        if (countryID != a.getInformation().getCountry().getCountryID() && countryID_raw != null) {
            aNew.getInformation().getCountry().setCountryID(countryID);
        }
        IAccountAdminDAO d = new AccountAdminDAO();
        if (d.update(aNew)) {
            request.setAttribute("message", "Đổi Thông Tin Thành Công !");
            session.removeAttribute("accountAdmin");

            HttpSession sessionNew = request.getSession();
            sessionNew.setAttribute("accountAdmin", aNew);
            
        } else {
            request.setAttribute("message", "Đổi Thông Tin Thất Bại !");
            
        }
        response.sendRedirect("admin-settings");

    }

    private Date convertToSQLDATE(String stringDate) {
        return Date.valueOf(stringDate);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
