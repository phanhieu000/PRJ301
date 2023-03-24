/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mywebsite.controller.cart;

import com.mywebsite.DAO.product.ProductDAO;
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
import java.util.List;

/**
 *
 * @author phanh
 */
@WebServlet(name = "ProcessController", urlPatterns = {"/process"})
public class ProcessController extends HttpServlet {

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
            out.println("<title>Servlet ProcessController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessController at " + request.getContextPath() + "</h1>");
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
        List<Product> list = pd.getAll();
        Cookie arr[] = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie item : arr) {
                if (item.getName().equals("cart")) {
                    txt += item.getValue();
                    item.setMaxAge(0);
                    response.addCookie(item);
                }
            }
        }

        Cart cart = new Cart(txt, list);

        String action = request.getParameter("action");

        if (action != null && action.equalsIgnoreCase("delete")) {
            String productID_raw = request.getParameter("id");
            int id;
            try {
                id = Integer.parseInt(productID_raw);
                cart.removeItem(id);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        } else if (action == null) {
            String quantity_raw = request.getParameter("quantity");
            String productID_raw = request.getParameter("id");
            String color_raw = request.getParameter("color");
            int quantity, productID = 0;
            ProductDAO d = new ProductDAO();
            int color;
            try {
                quantity = Integer.parseInt(quantity_raw);
                productID = Integer.parseInt(productID_raw);
                Product p = d.getProductByID(productID);
                color = Integer.parseInt(color_raw);
                if ((quantity == -1) && (cart.getQuantityByProductID(productID) <= 1)) {
                    cart.removeItem(productID);
                } else if (quantity == -1) {
                    cart.getItemByProductID(productID).setQuantity(cart.getItemByProductID(productID).getQuantity() - 1);

                } else if (quantity == 1 && cart.getQuantityByProductID(productID) < p.getQuantity()) {
                    cart.getItemByProductID(productID).setQuantity(cart.getItemByProductID(productID).getQuantity() + 1);

                } else if (color != cart.getItemByProductID(productID).getColor()) {
                    cart.getItemByProductID(productID).setColor(color);

                }

            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }

        List<Item> items = cart.getItems();
        txt = "";

        if (items.size() > 0) {
            txt = items.get(0).getProduct().getProductID() + "_"
                    + items.get(0).getQuantity() + "/" + items.get(0).getColor();
            for (int i = 1; i < items.size(); i++) {
                txt += "-" + items.get(i).getProduct().getProductID() + "_"
                        + items.get(i).getQuantity() + "/" + items.get(i).getColor();
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(c);
        request.setAttribute("cart", cart);
        response.sendRedirect("cart");
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
        List<Product> list = pd.getAll();
        Cookie arr[] = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie item : arr) {
                if (item.getName().equals("cart")) {
                    txt += item.getValue();
                }
            }
        }

        String id = request.getParameter("id");
        String[] ids = txt.split("-");
        String out = "";
        for (int i = 0; i < ids.length; i++) {
            String[] is = ids[i].split("_");
            if (!is[0].equals(id)) {
                if (out.isEmpty()) {
                    out = ids[i];
                } else {
                    out += "-" + ids[i];
                }
            }
        }

        if (!out.isEmpty()) {
            Cookie c = new Cookie("cart", out);
            c.setMaxAge(2 * 24 * 60 * 60);
            response.addCookie(c);
        }

        Cart cart = new Cart(out, list);
        request.setAttribute("cart", cart);
//        request.getRequestDispatcher("views/user/cart.jsp").forward(request, response);
        response.sendRedirect("cart");

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
