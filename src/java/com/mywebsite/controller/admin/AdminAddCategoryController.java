/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mywebsite.controller.admin;

import com.mywebsite.DAO.dao.Common;
import com.mywebsite.DAO.interfaces.ICategoryDAO;
import com.mywebsite.DAO.product.CategoryDAO;
import com.mywebsite.model.product.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author phanh
 */
@WebServlet(name = "Blank", urlPatterns = {"/admin-add-category"})
public class AdminAddCategoryController extends HttpServlet {

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
            out.println("<title>Servlet Blank</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Blank at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("views/admin/addCategory.jsp").forward(request, response);
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
        String categoryName = request.getParameter("categoryName");
        String categoryMetatitle = request.getParameter("categoryMetaTitle");
        String isSubcategory = request.getParameter("isSubcate");
        ICategoryDAO cd = new CategoryDAO();
        if (isSubcategory != null && isSubcategory.equalsIgnoreCase("yes")) {
            String cid_raw = request.getParameter("cid");
            try {
                int cid = Integer.parseInt(cid_raw);
                Category c = new Category(0, categoryName, cid, categoryMetatitle, Common.getCurrentDate(), Common.getCurrentDate());
                cd.insertSubCategory(c);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        } else if (isSubcategory == null) {
            Category c = new Category(0, categoryName, 0, categoryMetatitle, Common.getCurrentDate(), Common.getCurrentDate());
            cd.insert(c);
        }
        response.sendRedirect("admin-category");
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
