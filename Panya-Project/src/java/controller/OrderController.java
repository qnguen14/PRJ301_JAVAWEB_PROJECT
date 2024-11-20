/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import orders.OrderDAO;
import orders.OrderDTO;
import orders.OrderItemDTO;
import orders.ordersDAO;
import orders.ordersDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
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
        
        OrderDAO dao = new OrderDAO();
        ordersDAO dao1 = new ordersDAO();
        String keyword = request.getParameter("searchValue");
        String action = request.getParameter("action");
        String sortCol = request.getParameter("colSort");
        
        if (keyword == null) {
            keyword = "";
        }
        
        try {
            if (action == null || action.equals("Search")) {
                
                List<OrderItemDTO> orderlist = dao.search(keyword, sortCol);
                
                request.setAttribute("orderItems", orderlist);
                request.getRequestDispatcher("/adminOrders.jsp").forward(request, response);
                
            }
            
            else if (action.equals("delete")) {
                
                Integer id = null;
                try {
                    
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException nx) {

                }
                if (id != null) {
                    dao1.delete(id);
                }
                
                
                List<ordersDTO> orderlist = dao1.search(keyword, sortCol);
                
                request.setAttribute("orderlist", orderlist);
                request.getRequestDispatcher("/adminOrders.jsp").forward(request, response);
                
            }
            
            
        } catch (Exception e) {
            log("Error processing request: " + e.getMessage());
            e.printStackTrace();
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
