/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mywebsite.controller.cart;


import com.mywebsite.DAO.cart.OrderCartDAO;
import com.mywebsite.DAO.product.ProductDAO;
import com.mywebsite.model.Account;
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
import jakarta.servlet.http.HttpSession;
import java.util.List;
import com.mywebsite.DAO.interfaces.IOrderCartDAO;
import com.mywebsite.DAO.interfaces.IProductDAO;
import com.mywebsite.model.cart.Item;

/**
 *
 * @author phanh
 */
@WebServlet(name = "CheckController", urlPatterns = {"/checkout"})
public class CheckOutController extends HttpServlet {

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
            out.println("<title>Servlet CheckController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckController at " + request.getContextPath() + "</h1>");
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

        IProductDAO pd = new ProductDAO();
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
        request.setAttribute("finalMoney", cart.getTotalMoneyHaveTaxFormat());

        request.setAttribute("tax", cart.getTaxFormat());
        request.setAttribute("cart", cart);
        request.setAttribute("size", n);


        request.getRequestDispatcher("views/user/checkout.jsp").forward(request, response);
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
        ProductDAO pd = new ProductDAO();
        List<Product> prods = pd.getAll();
        Cookie arr[] = request.getCookies();
        String txt = "";

        if (arr != null) {
            for (Cookie item : arr) {
                if (item.getName().equals("cart")) {
                    txt += item.getValue();

                }
            }
        }

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");

        String payment_raw = request.getParameter("payment");
        String note = request.getParameter("note");
        String phone = request.getParameter("phone");
        String companyShipID_raw = request.getParameter("companyShipID");
        if (phone != null) {
            if (session.getAttribute("account") != null) {
                a.getInformation().setPhone(phone);
            }
        }
        int paymentID;
        int companyShipID;
        try {
            paymentID = Integer.parseInt(payment_raw);
            companyShipID = Integer.parseInt(companyShipID_raw);
        } catch (NumberFormatException e) {
            paymentID = 0;
            companyShipID = 0;
        }
        Cart cart = new Cart(txt, prods);

        if (a == null) {
            response.sendRedirect("login");
        } else {
            IOrderCartDAO od = new OrderCartDAO();

            od.addOrder(a, cart, paymentID, companyShipID, note);
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(0);
            response.addCookie(c);
            if (paymentID == 1) {
                a.setAmount(a.getAmount() - cart.getTotalMoney());
                session.removeAttribute("account");
                session.setAttribute("account", a);
            }
            
            response.sendRedirect("checkout");
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
