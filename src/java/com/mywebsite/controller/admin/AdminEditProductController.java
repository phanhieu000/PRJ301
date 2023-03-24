/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mywebsite.controller.admin;

import com.mywebsite.DAO.dao.Common;
import com.mywebsite.DAO.interfaces.ICategoryDAO;
import com.mywebsite.DAO.interfaces.IProducerDAO;
import com.mywebsite.DAO.interfaces.IProductDAO;
import com.mywebsite.DAO.product.CategoryDAO;
import com.mywebsite.DAO.product.ProducerDAO;
import com.mywebsite.DAO.product.ProductDAO;
import com.mywebsite.model.product.Category;
import com.mywebsite.model.product.Producer;
import com.mywebsite.model.product.Product;
import com.mywebsite.model.product.ProductColor;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

/**
 *
 * @author phanh
 */
@MultipartConfig
@WebServlet(name = "AdminEditProductController", urlPatterns = {"/admin-edit-product"})
public class AdminEditProductController extends HttpServlet {

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
            out.println("<title>Servlet AdminEditProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminEditProductController at " + request.getContextPath() + "</h1>");
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
        IProductDAO d = new ProductDAO();

        String productID_raw = request.getParameter("id");
        int productID;
        try {
            productID = Integer.parseInt(productID_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
            productID = 0;
        }

        
        request.setAttribute("listCategory", new CategoryDAO().getAll());
        request.setAttribute("listProducer", new ProducerDAO().getAll());

        request.setAttribute("product", d.getProductByID(productID));

        request.getRequestDispatcher("views/admin/editProduct.jsp").forward(request, response);
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
        IProductDAO d = new ProductDAO();

        String productID_raw = request.getParameter("id");
        int productID;
        try {
            productID = Integer.parseInt(productID_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
            productID = 0;
        }

        String productName = request.getParameter("productName");
        String producerID_raw = request.getParameter("producerID");
        String price_raw = request.getParameter("price");
        price_raw = price_raw.replace(".", "");
        String discount_raw = request.getParameter("discount");
        discount_raw = discount_raw.replace(".", "");

        String categoryID_raw = request.getParameter("categoryID");
        String memory = request.getParameter("memory");
        String ram = request.getParameter("ram");
        String cpu = request.getParameter("cpu");
        String camera = request.getParameter("camera");
        String cameraSelfie = request.getParameter("cameraSelfie");
        String hardDrive = request.getParameter("hardDrive");
        String card = request.getParameter("card");
        String screen = request.getParameter("screen");
        String size = request.getParameter("size");
        String weight = request.getParameter("weight");
        String summary = request.getParameter("summary");
        String warranty_raw = request.getParameter("warranty");
        String quantity_raw = request.getParameter("quantity");
        String[] colors = request.getParameterValues("colorProduct");
        
        Part file = request.getPart("imageProduct");

        String imageFileName = file.getSubmittedFileName();

        System.out.println("Selected image file name: " + imageFileName);

        String uploadPath = "D:/he163385/MyProject/web/adminPugins/productImage/" + imageFileName;

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

        if (productName != null) {
            int producerID, categoryID, warranty, quantity;
            double price, discount;
            try {
                String[] producerID_split = producerID_raw.split(",");
                producerID = Integer.parseInt(producerID_split[0]);
                categoryID = Integer.parseInt(categoryID_raw);
                price = Double.parseDouble(price_raw);
                discount = Double.parseDouble(discount_raw);
                warranty = Integer.parseInt(warranty_raw);
                quantity = Integer.parseInt(quantity_raw);
                productID = Integer.parseInt(productID_raw);
            } catch (NumberFormatException e) {
                System.out.println(e);
                producerID = -1;
                categoryID = -1;
                price = 0;
                discount = 0;
                warranty = 0;
                quantity = 0;
                System.out.println(e + " " + producerID_raw + categoryID_raw + price_raw + quantity_raw + discount_raw + warranty_raw);

            }
            Producer producer = getProducerByID(producerID);
            Category category = getCategoryByID(categoryID);

            ProductColor color = new ProductColor();
            color.setProductID(productID);

            for (int i = 0; i < colors.length; i++) {
                if (i == 0) {
                    color.setColorFirst(colors[i]);
                }
                if (i == 1) {
                    color.setColorSecond(colors[i]);
                }
                if (i == 2) {
                    color.setColorThree(colors[i]);
                }
                if (i == 3) {
                    color.setColorFour(colors[i]);
                }
                if (i == 4) {
                    color.setColorFive(colors[i]);
                }
            }

            String sku = "";
            if (quantity < 1) {
                sku = "Hết Hàng";
            } else {
                sku = "Còn Hàng";
            }
            IProductDAO pd = new ProductDAO();

            Product p = pd.getProductByID(productID);
            p.getImage().setImageFirst("adminPugins/productImage/" + imageFileName);
            Product product = new Product(productID, productName, productName, summary, sku, price, discount, quantity, p.getCountBuy(), size,
                    screen, camera, cameraSelfie, cpu, memory, ram, hardDrive, card, weight, warranty, p.getProductCreateAt(),
                    Common.getCurrentDate(), Common.getCurrentDate(), Common.getCurrentDate(), p.getImage(), color, producer, category);

            pd.update(product);
        }
        String url = "admin-product-details" + "?id=" + productID;
        response.sendRedirect(url);
    }

    private static Producer getProducerByID(int producerID) {
        IProducerDAO d = new ProducerDAO();
        List<Producer> list = d.getAll();

        for (Producer item : list) {
            if (item.getProducerID() == producerID) {
                return item;
            }
        }
        return null;
    }

    private static Category getCategoryByID(int categoryID) {
        ICategoryDAO d = new CategoryDAO();
        List<Category> list = d.getAll();

        for (Category item : list) {
            if (item.getCategoryID() == categoryID) {
                return item;
            }
        }
        return null;
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
