package com.mywebsite.controller.user;

import com.mywebsite.DAO.account.AccountDAO;
import com.mywebsite.DAO.dao.Common;
import com.mywebsite.DAO.product.ProductDAO;
import com.mywebsite.model.Account;
import com.mywebsite.model.Country;
import com.mywebsite.model.Information;
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

@WebServlet(urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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

       
        request.getRequestDispatcher("views/user/register.jsp").forward(request, response);
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
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String message = "";
        boolean flag = false;
        AccountDAO ad = new AccountDAO();
        List<Account> listA = ad.getAll();
        if (email != null) {
            for (Account a : listA) {
                if (a.getEmail().equalsIgnoreCase(email)) {
                    request.setAttribute("errorEmail", "Email Đã Tồn Tại");
                    flag = true;
                }
            }
        }

        if (userName != null) {
            for (Account a : listA) {
                if (a.getUserName().equalsIgnoreCase(userName)) {
                    request.setAttribute("errorUser", "UserName Đã Tồn Tại");
                    flag = true;
                }
            }
        }

        if (!flag) {
            Country c = new Country(1, "Việt Nam", "VN");
            Information i = new Information(ad.getLastAccountID() + 1, firstName, lastName, "", "", Common.getCurrentDate(), "", -0, "", c);
            Account a = new Account(ad.getLastAccountID() + 1, userName, password, 0, email, Common.getCurrentDate(), Common.getCurrentDate(), i);
            ad.insert(a);
            request.setAttribute("message", "Đăng Ký Thành Công");
        }

        request.getRequestDispatcher("views/user/register.jsp").forward(request, response);

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
