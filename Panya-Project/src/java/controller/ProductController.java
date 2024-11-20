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
import javax.servlet.http.HttpSession;
import products.productsDAO;
import products.productsDTO;
import user.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
public class ProductController extends HttpServlet {

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

        productsDAO dao = new productsDAO();
        String keyword = request.getParameter("searchValue");
        String action = request.getParameter("action");
        String sortCol = request.getParameter("colSort");

        if (keyword == null) {
            keyword = "";
        }

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("acc") == null) {
            response.sendRedirect("login.jsp");
        } else

        try {

            if (action == null || action.equals("Search")) {

                List<productsDTO> productList = dao.search(keyword, sortCol);
                request.setAttribute("productlist", productList);
                request.getRequestDispatcher("/adminProduct.jsp").forward(request, response);
            
            
            } else if (action.equals("details")) {
                
                
//                Integer id = null;
//                try {
//                    id = Integer.parseInt(request.getParameter("id"));
//                } catch (NumberFormatException ex) {
//                    log("Parameter id has wrong format");
//                }
//                
//                productsDTO product = dao.getProductById(id); // Implement getProductById in DAO
//                // Set product as request attribute and forward to adminProduct.jsp
//                request.setAttribute("product", product);
//                request.getRequestDispatcher("adminProduct.jsp").forward(request, response);
            
            
            } else if (action.equals("listProduct")){
                List<productsDTO> productList = dao.list(keyword, sortCol);
                request.setAttribute("productlist", productList);
                request.getRequestDispatcher("menu.jsp").forward(request, response);
            } if (action.equals("SearchProduct")) {
                String search = request.getParameter("search");
                List<productsDTO> productList = dao.listProductSearch(search);
                request.setAttribute("productlist", productList);
                request.getRequestDispatcher("/menu.jsp").forward(request, response);
            
            
            }else if (action.equals("delete")) {
                
                
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException nx) {

                }
                if (id != null) {
                    dao.delete(id);
                }
                List<productsDTO> productList = dao.search(keyword, sortCol);
                request.setAttribute("productlist", productList);
                request.getRequestDispatcher("/adminProduct.jsp").forward(request, response);
                
                
            } else if (action.equals("create")) {

                productsDTO product = new productsDTO();
                request.setAttribute("p", product);
                request.setAttribute("nextaction", "insert");

                request.getRequestDispatcher("ProductController").forward(request, response);

            
            
            } else if (action.equals("insert")) {
                
                String name = request.getParameter("name");
                String category_name = request.getParameter("category_name");
                String description = request.getParameter("description");
                
                double price = 0;
                try {
                    price = Double.parseDouble(request.getParameter("price"));
                } catch (NumberFormatException ex) {
                    log("Parameter price has wrong format");
                }
                
                String image = request.getParameter("image");

                boolean status = true;
                status = Boolean.parseBoolean(request.getParameter("status"));

                productsDTO p = new productsDTO();
                p.setName(name);
                p.setCategory_name(category_name);
                p.setDescription(description);
                p.setImage(image);
                p.setPrice(price);
                p.setIs_in_stock(status);
                

                dao.insert(p);
                response.sendRedirect("ProductController");
                
            }
            
            else if(action.equals("edit")) {
                
                Integer id = null;
                
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format");
                }
                
                productsDTO p = null;
                if (id != null) {
                    p = dao.load(id);
                }
                
                request.setAttribute("p", p);
                request.setAttribute("nextaction", "update");
                
                request.getRequestDispatcher("/adminEdit.jsp").forward(request, response);

                
            }
            
            else if (action.equals("update")) {
                
                Integer id = null;

                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                
                String name = request.getParameter("name");
                String category_name = request.getParameter("category_name");
                String description = request.getParameter("description");
                String image = request.getParameter("image");
                double price = 0;
                try {
                    price = Double.parseDouble(request.getParameter("price"));
                } catch (NumberFormatException ex) {
                    log("Parameter price has wrong format");
                }

                boolean status = true;
                status = Boolean.parseBoolean(request.getParameter("status"));
                
                productsDTO p = new productsDTO();
                    p.setId(id);
                    p.setName(name);
                    p.setCategory_name(category_name);
                    p.setDescription(description);
                    p.setImage(image);
                    p.setPrice(price);
                    p.setIs_in_stock(status);
                
                dao.update(p);
                
                 response.sendRedirect("ProductController");
                
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

