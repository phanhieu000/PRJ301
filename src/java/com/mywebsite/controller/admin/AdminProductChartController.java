/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mywebsite.controller.admin;

import com.mywebsite.DAO.dao.Common;
import com.mywebsite.DAO.interfaces.IProductDAO;
import com.mywebsite.DAO.product.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;

/**
 *
 * @author phanh
 */
@WebServlet(name = "AdminProductChartController", urlPatterns = {"/admin-product-chart"})
public class AdminProductChartController extends HttpServlet {

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
            out.println("<title>Servlet AdminProductChartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminProductChartController at " + request.getContextPath() + "</h1>");
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
        String year_raw = request.getParameter("year");
        int year = 1900 + Common.getCurrentDate().getYear();
        if (year_raw != null) {
            year = Integer.parseInt(year_raw);
        }
        

        IProductDAO pd = new ProductDAO();
        HashMap<Integer, Integer> laptop = pd.getSellerProductForChart(1, year);
        HashMap<Integer, Integer> smartPhone = pd.getSellerProductForChart(2, year);
        HashMap<Integer, Integer> tablet = pd.getSellerProductForChart(3, year);
        request.setAttribute("year", year);

        request.setAttribute("smartPhone", smartPhone);
        request.setAttribute("laptop", laptop);
        request.setAttribute("tablet", tablet);

        request.getRequestDispatcher("views/admin/productChart.jsp").forward(request, response);
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
