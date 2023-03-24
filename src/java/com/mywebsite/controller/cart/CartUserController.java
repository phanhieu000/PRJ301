/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mywebsite.controller.cart;

import com.mywebsite.DAO.product.CategoryDAO;
import com.mywebsite.DAO.product.ProducerDAO;
import com.mywebsite.DAO.product.ProductDAO;
import com.mywebsite.model.cart.Cart;
import com.mywebsite.model.product.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author phanh
 */
@WebServlet(name = "CartUserController", urlPatterns = {"/cart"})
public class CartUserController extends HttpServlet {

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
            out.println("<title>Servlet CartUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartUserController at " + request.getContextPath() + "</h1>");
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
        List<Product> prods = pd.getAll();
        Cookie arr[] = request.getCookies();
        String txt = "";

        for (Cookie item : arr) {
            if (item.getName().equals("cart")) {
                txt = txt + item.getValue();
            }
        }
        Cart cart = new Cart(txt, prods);
        request.setAttribute("cart", cart);
        request.setAttribute("size", cart.getItems().size());
        request.setAttribute("totalMoneyFormat", cart.getTotalMoneyFormat());
        request.setAttribute("totalMoney", cart.getTotalMoney());
        request.setAttribute("totalMoneyTax", cart.getTotalMoneyHaveTaxFormat());
        request.setAttribute("tax", cart.getTaxFormat());

        request.getRequestDispatcher("views/user/cart.jsp").forward(request, response);
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
