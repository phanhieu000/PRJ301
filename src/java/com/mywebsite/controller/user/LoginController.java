/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mywebsite.controller.user;

import com.mywebsite.DAO.interfaces.IAccountDAO;
import com.mywebsite.DAO.account.AccountDAO;
import com.mywebsite.DAO.product.CategoryDAO;
import com.mywebsite.DAO.product.ProducerDAO;
import com.mywebsite.DAO.product.ProductDAO;
import com.mywebsite.model.Account;
import com.mywebsite.model.cart.Cart;
import com.mywebsite.model.cart.Item;
import com.mywebsite.model.product.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author phanh
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
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
        List<Product> listp = pd.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";

        if (arr != null) {
            for (Cookie i : arr) {
                if (i.getName().equals("cart")) {
                    txt += i.getValue();
                }
            }
        }

        Cart cart = new Cart(txt, listp);
        List<Item> listItem = cart.getItems();
        int n;
        if (listItem != null) {
            n = listItem.size();
        } else {
            n = 0;
        }

        request.setAttribute("totalMoneyFormat", cart.getTotalMoneyFormat());
        request.setAttribute("cart", cart);
        request.setAttribute("size", n);

        request.getRequestDispatcher("views/user/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        IAccountDAO d = new AccountDAO();
        Account a = d.checkLogin(userName, password);
        if (a == null) {
            request.setAttribute("errorLogin", "Tài Khoản Hoặc Mật Khẩu Không Đúng !");
            request.getRequestDispatcher("views/user/login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
            response.sendRedirect("home");
        }
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
