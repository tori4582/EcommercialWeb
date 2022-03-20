/*
 * Click nbfs:nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs:nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package edu.fpt.vlxd.controllers;

import edu.fpt.vlxd.dao.CartDAO;
import edu.fpt.vlxd.dao.ProductDAO;
import edu.fpt.vlxd.models.Account;
import edu.fpt.vlxd.models.Cart;
import edu.fpt.vlxd.models.Category;
import edu.fpt.vlxd.models.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author hungt
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

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

        HttpSession session = request.getSession();

        Account acc = (Account) session.getAttribute("acc");
        session.setAttribute("acc", acc);

        List<Category> categories = new ProductDAO().getAllCategories();

        request.setAttribute("listCC", categories);
        request.setAttribute("title", "bruh");
        request.setAttribute("cartLength", 0);
        request.setAttribute("listCC", categories);

        if (acc == null) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        }

        Cart c = new CartDAO().getCart(acc);

        if (c == null) {
            request.setAttribute("orders", null);
            request.getRequestDispatcher("cart.jsp").forward(request, response);

            return;
        }

        List<Order> orders = c.getOrders();

        int total = 0;
        
        for (Order o : orders) {
            total += o.getAmount() * o.getProduct().getPrice();
        }
        
        request.setAttribute("orders", orders);
        request.setAttribute("total", total);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
    }
    // </editor-fold>

}
