/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orders.Cart;
import orders.ItemDTO;
import orders.OrderDAO;
import orders.OrderDTO;
import products.productsDAO;
import products.productsDTO;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class BuyController extends HttpServlet {

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
        processRequest(request, response);
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
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");

        if ("checkout".equals(action)) {
            processCheckout(request, response);
        }else if("delete".equals(action)){
            processRemoveCartItem(request, response);
        }
        else {
            processAddToCart(request, response);
            }
        }

        private void processAddToCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String quantity = request.getParameter("quantity");
        String productId = request.getParameter("productId");
        int q, id;
        try {
            q = Integer.parseInt(quantity);
            id = Integer.parseInt(productId);

            productsDAO dao = new productsDAO();
            productsDTO item = dao.getProductById(id);
            double price = item.getPrice() * 1.2;
            ItemDTO t = new ItemDTO(item, q, price, -1); // Khởi tạo với order_id tạm thời là -1
            cart.addItem(t);
        } catch (NumberFormatException e) {
            q = 1;
        }

        session.setAttribute("cart", cart);
        session.setAttribute("size", cart.getItems().size());

        response.sendRedirect("menu.jsp");
    }

private void processCheckout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null && !cart.getItems().isEmpty()) {
            try {
                Connection connection = DBUtils.getConnection();
                OrderDAO orderDAO = new OrderDAO(connection);

                for (ItemDTO item : cart.getItems()) {
                    orderDAO.insertOrderItem(item.getProduct().getId(), item.getQuantity(), item.getPrice());
                }

                session.removeAttribute("cart");
                session.removeAttribute("size");

                response.sendRedirect("main.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error processing checkout. Please try again.");
                request.getRequestDispatcher("order.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("order.jsp");
        }
    }

    private void processRemoveCartItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {
            String productId = request.getParameter("productId");
            int id;
            try {
                id = Integer.parseInt(productId);
                cart.removeItem(id);
                session.setAttribute("size", cart.getItems().size());
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("order.jsp");
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
    