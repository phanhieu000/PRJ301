package com.mywebsite.controller.user;

import com.mywebsite.DAO.interfaces.IOrderDAO;
import com.mywebsite.DAO.product.OrderDAO;
import com.mywebsite.DAO.product.ProductDAO;
import com.mywebsite.model.Account;
import com.mywebsite.model.cart.Cart;
import com.mywebsite.model.cart.Item;
import com.mywebsite.model.order.OrderLine;
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


@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {

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
            out.println("<title>Servlet OrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderController at " + request.getContextPath() + "</h1>");
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

        IOrderDAO od = new OrderDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if (a != null) {
            List<OrderLine> listOD = od.getOrderLineByAccountID(a.getAccountID());
            int page, numberPerPage = 6;
            String xpage = request.getParameter("page");
            int size;
            if (listOD.isEmpty()) {
                size = 0;
            } else {
                size = listOD.size();
            }

            int numberOfPage = ((size % 6 == 0) ? (size / 6) : (size / 6 + 1));
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numberPerPage;
            end = Math.min(page * numberPerPage, size);
            
            List<OrderLine> listByPage = od.getListByPage(listOD, start, end);
            request.setAttribute("orderHistory", listByPage);
            request.setAttribute("page", page);
            request.setAttribute("numberPage", numberOfPage);
            request.setAttribute("start", start + 1);
            request.setAttribute("end", end);
        }

        request.getRequestDispatcher("views/user/order.jsp").forward(request, response);
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
