package com.mywebsite.controller.admin;

import com.mywebsite.DAO.account.AccountDAO;
import com.mywebsite.DAO.dao.Common;
import com.mywebsite.DAO.product.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "AdminHomeController", urlPatterns = {"/admin-home"})
public class AdminHomeController extends HttpServlet {

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
            out.println("<title>Servlet AdminHomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminHomeController at " + request.getContextPath() + "</h1>");
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
        ProductDAO pd = new ProductDAO();

        request.setAttribute("totalRevenue", pd.getRevenueInMonthFormat());
        request.setAttribute("test", pd.getRevenueInMonth());
        request.setAttribute("totalUsers", new AccountDAO().getTotalUser());
        request.setAttribute("totalProducts", pd.getTotalProduct());
        request.setAttribute("totalProductSeller", pd.getTotalProductSeller());
        request.setAttribute("paids", pd.getTotalRevenueForChart(1));
        request.setAttribute("pendings", pd.getTotalRevenueForChart(0));

        request.setAttribute("laptop", pd.getCountSellerByCategoryID(1));
        request.setAttribute("smartphone", pd.getCountSellerByCategoryID(2));
        request.setAttribute("tablet", pd.getCountSellerByCategoryID(3));
        
        request.setAttribute("month", Common.getCurrentDate().getMonth() + 1);
        request.getRequestDispatcher("views/admin/home.jsp").forward(request, response);
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
        processRequest(request, response);
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
