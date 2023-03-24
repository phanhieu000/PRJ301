/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mywebsite.controller.user;

import com.mywebsite.DAO.interfaces.ICategoryDAO;
import com.mywebsite.DAO.interfaces.IProducerDAO;
import com.mywebsite.DAO.interfaces.IProductDAO;
import com.mywebsite.DAO.product.CategoryDAO;
import com.mywebsite.DAO.product.ProducerDAO;
import com.mywebsite.DAO.product.ProductDAO;
import com.mywebsite.model.cart.Cart;
import com.mywebsite.model.cart.Item;
import com.mywebsite.model.product.Category;
import com.mywebsite.model.product.Producer;
import com.mywebsite.model.product.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author phanh
 */
@WebServlet(name = "ShopController", urlPatterns = {"/shop"})
public class ShopController extends HttpServlet {

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
            out.println("<title>Servlet ShopController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopController at " + request.getContextPath() + "</h1>");
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
        ICategoryDAO cd = new CategoryDAO();
        IProducerDAO prd = new ProducerDAO();
        List<Product> listP = pd.getAll();
        
        Cookie[] arr = request.getCookies();
        String txt = "";

        if (arr != null) {
            for (Cookie i : arr) {
                if (i.getName().equals("cart")) {
                    txt += i.getValue();
                }
            }
        }

        Cart cart = new Cart(txt, listP);
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
        
        
        String[] categoryID_raw = request.getParameterValues("cid");
        int[] categoryID = null;
        if (categoryID_raw != null && Integer.parseInt(categoryID_raw[0]) != 0) {
            categoryID = new int[categoryID_raw.length];
            for (int i = 0; i < categoryID.length; i++) {
                categoryID[i] = Integer.parseInt(categoryID_raw[i]);
            }

            List<Category> listC = cd.getAll();
            boolean[] categoryCheck = new boolean[listC.size()];
            for (int i = 0; i < categoryCheck.length; i++) {
                if (ischeckCategory(listC.get(i).getCategoryID(), categoryID)) {
                    categoryCheck[i] = true;
                } else {
                    categoryCheck[i] = false;
                }
            }
            request.setAttribute("categoryCheck", categoryCheck);

            String categoryS = "";
            for (int i = 0; i < categoryID.length; i++) {
                if (i == categoryID.length - 1) {
                    categoryS += categoryID[i];
                } else {
                    categoryS += categoryID[i] + "&cid=";
                }
            }
            request.setAttribute("categoryS", categoryS);
        }

        String[] producerID_raw = request.getParameterValues("pid");
        int[] producerID = null;

        List<Producer> listProducer = prd.getProducerByCategoryID(categoryID);
        request.setAttribute("listProducer", listProducer);
        if (producerID_raw != null) {
            producerID = new int[producerID_raw.length];
            for (int i = 0; i < producerID.length; i++) {
                producerID[i] = Integer.parseInt(producerID_raw[i]);
            }

            boolean[] producerCheck = new boolean[listProducer.size()];

            for (int i = 0; i < producerCheck.length; i++) {
                if (ischeckProducer(listProducer.get(i).getProducerID(), producerID)) {
                    producerCheck[i] = true;
                } else {
                    producerCheck[i] = false;
                }
            }
            request.setAttribute("producerCheck", producerCheck);

            String producerS = "";
            for (int i = 0; i < producerID.length; i++) {
                if (i == producerID.length - 1) {
                    producerS += producerID[i];
                } else {
                    producerS += producerID[i] + "&pid=";
                }

            }
            request.setAttribute("producerS", producerS);
        }
        
       

        listP = pd.getProductByProducerCheckBoxAndCategoryID(producerID, categoryID);

        String search = request.getParameter("search");
        int id = 0;
        if (search != null) {
            String id_raw = request.getParameter("cid");
            
            try {
                id = Integer.parseInt(id_raw);

            } catch (NumberFormatException e) {
                System.out.println(e);
                id = 0;
            }
            request.setAttribute("search", search);
            listP = pd.getProductBySearch(id, search);
        }
        
        String price_raw = request.getParameter("price");
        if(price_raw != null){
            double price = Double.parseDouble(price_raw);
            listP = pd.getProductByPrice(0, price);
            request.setAttribute("price", price);
        }

        int page, numberPerPage = 6;
        String xpage = request.getParameter("page");
        int size;
        if(listP.isEmpty()){
            size = 0;
        }else {
            size = listP.size();
        }
         
        int numberOfPage = ((size % numberPerPage == 0) ? (size / numberPerPage) : (size / numberPerPage + 1));
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numberPerPage;
        end = Math.min(page * numberPerPage, size);
        
        
        
        String sortBy = request.getParameter("sortBy");
        if(sortBy != null){
            if(sortBy.equalsIgnoreCase("Default")){
                
            }else if(sortBy.equalsIgnoreCase("name")){
                Collections.sort(listP, (Product o1, Product o2) -> {
                    if(o1.getProductName().compareTo(o2.getProductName()) > 0){
                        return -1;
                    }
                    return 1;
                });
            }else if(sortBy.equalsIgnoreCase("price")){
                Collections.sort(listP, (Product o1, Product o2) -> {
                    if(o1.getLastPrice() > o2.getLastPrice()){
                        return 1;
                    }
                    return -1;
                });
            }else if(sortBy.equalsIgnoreCase("rate")){
                Collections.sort(listP, (Product o1, Product o2) -> {
                    if(o1.getRate() > o2.getRate()){
                        return -1;
                    }
                    return 1;
                });
            }
            request.setAttribute("sortBy", sortBy);
        }

        List<Product> listByPage = pd.getListByPage(listP, start, end);
        request.setAttribute("listByPage", listByPage);
        request.setAttribute("page", page);
        request.setAttribute("numberPage", numberOfPage);
        request.setAttribute("start", start + 1);
        request.setAttribute("end", end);
        request.setAttribute("totalItem", listP.size());

        request.setAttribute("id", id);
        request.setAttribute("category", cd.getCategoryByID(id));
        
        request.getRequestDispatcher("views/user/shop.jsp").forward(request, response);
    }

    private boolean ischeckProducer(int producerID, int[] list) {
        if (list == null) {
            return false;
        } else {
            for (int i = 0; i < list.length; i++) {
                if (list[i] == producerID) {
                    return true;
                }
            }
        }
        return false;
    }

    private boolean ischeckCategory(int categoryID, int[] list) {
        if (list == null) {
            return false;
        } else {
            for (int i = 0; i < list.length; i++) {
                if (list[i] == categoryID) {
                    return true;
                }
            }
        }
        return false;
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
            id=0;
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
