/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mywebsite.controller.user;

import com.mywebsite.DAO.product.CategoryDAO;
import com.mywebsite.DAO.product.ProducerDAO;
import com.mywebsite.DAO.product.ProductDAO;
import com.mywebsite.DAO.product.ProductReviewDAO;
import com.mywebsite.model.cart.Cart;
import com.mywebsite.model.cart.Item;
import com.mywebsite.model.product.Product;
import com.mywebsite.model.product.ProductReview;
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
@WebServlet(name = "ViewController", urlPatterns = {"/productview"})
public class ViewController extends HttpServlet {

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
            out.println("<title>Servlet ViewController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewController at " + request.getContextPath() + "</h1>");
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
        ProductReviewDAO prd = new ProductReviewDAO();
        
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
        
        String id_raw = request.getParameter("id");
        int id;
        try {
            id = Integer.parseInt(id_raw);

        } catch (NumberFormatException e) {
            System.out.println(e);
            id = 0;
        }
        
        List<ProductReview> listR = prd.getReviewByProductID(id);
        
        int page, numberPerPage = 5;
        String xpage = request.getParameter("page");
        int size;
        if(listR.isEmpty()){
            size = 0;
        }else {
            size = listR.size();
        }
         
        int numberOfPage = ((size % numberPerPage == 0) ? (size / numberPerPage) : (size / numberPerPage + 1));
        if (xpage == null) {
            page = 1;
            request.setAttribute("status", 0);
        } else {
            page = Integer.parseInt(xpage);
            request.setAttribute("status", 1);
        }
        int start, end;
        start = (page - 1) * numberPerPage;
        end = Math.min(page * numberPerPage, size);
        
        List<ProductReview> listByPage = prd.getListByPage(listR, start, end);
        request.setAttribute("listByPage", listByPage);
        request.setAttribute("page", page);
        request.setAttribute("numberPage", numberOfPage);
        request.setAttribute("start", start + 1);
        request.setAttribute("end", end);
        

        
        request.setAttribute("listCategory", new CategoryDAO().getAll());
        request.setAttribute("listProductSmartphone", new ProductDAO().getProductByCategoryID(2));
        request.setAttribute("listProducerLaptop", new ProducerDAO().getProducerByACategoryID(1));
        request.setAttribute("listProducerSmartphone", new ProducerDAO().getProducerByACategoryID(2));
        request.setAttribute("listProducerTablet", new ProducerDAO().getProducerByACategoryID(3));
        request.setAttribute("listSubcategoryApple", new CategoryDAO().getSubcategoryApple("Apple"));

        request.setAttribute("product", new ProductDAO().getProductByID(id));
        request.setAttribute("review", listR);
        request.setAttribute("sizeReview", new ProductReviewDAO().getReviewByProductID(id).size());
        request.setAttribute("listProductSameCategory", new ProductDAO().get15ProductSameCategoryByProductID(id));

        request.getRequestDispatcher("views/user/productview.jsp").forward(request, response);
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
                    item.setMaxAge(0);
                    response.addCookie(item);
                }
            }
        }

        String quantity_raw = request.getParameter("quantity");
        String productID = request.getParameter("id");
        int id = 0, quantity = 1;
        try {
            id = Integer.parseInt(productID);
            quantity = Integer.parseInt(quantity_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        String color = request.getParameter("color");
        if(color == null || color.equals("")){
            color = "Default";
        }
        ProductDAO pd1 = new ProductDAO();
        Cart cartCheck = new Cart(txt, prods);
        Product pcheckQuan = pd1.getProductByID(id);
        
        if (txt.isEmpty()) {
            if( quantity < pcheckQuan.getQuantity()){
                txt = productID + "_" + quantity +  "/" + color;
            }
            
        } else if(cartCheck.getItemByProductID(id) == null){
            if( quantity < pcheckQuan.getQuantity()){
                txt +=  "-" + productID + "_" + quantity +  "/" + color;
            }
           
        } else if( (cartCheck.getQuantityByProductID(id) + quantity) >= pcheckQuan.getQuantity() ){
            
        }else {
            txt +=  "-" + productID + "_" + quantity +  "/" + color;
        }

        Cart cart = new Cart(txt, prods);

        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(24 * 60 * 60);
        response.addCookie(c);
        List<Item> listI = cart.getItems();
        request.setAttribute("cart", cart);
        request.setAttribute("size", listI.size());
        String url = request.getRequestURL() + "?" + request.getQueryString();
        response.sendRedirect(url);
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
