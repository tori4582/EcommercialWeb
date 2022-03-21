/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package edu.fpt.vlxd.controllers;

import edu.fpt.vlxd.dao.ProductDAO;
import edu.fpt.vlxd.models.Account;
import edu.fpt.vlxd.models.Category;
import edu.fpt.vlxd.models.Product;
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
@WebServlet(name = "ProductsManager", urlPatterns = {"/prodmgr"})
public class ProductsManager extends HttpServlet {

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
        Account a = (Account) session.getAttribute("acc");
        int id = a.getId();

        String action = request.getParameter("action");
        ProductDAO dao = new ProductDAO();
        
        List<Category> listCC = dao.getAllCategory();

        if (action == null) {

            List<Product> list = dao.getAllProduct();
            

            request.setAttribute("listCC", listCC);
            request.setAttribute("products", list);
            request.getRequestDispatcher("productsmgr.jsp").forward(request, response);
        } else if (action.equals("remove")) {
            String pid = request.getParameter("id");
            dao.deleteProduct(pid);
            response.sendRedirect("prodmgr");
        } else if (action.equals("edit")) {
            String pid = request.getParameter("id");
            int pcid = dao.getCategoryIdOfProduct(Integer.parseInt(pid));
            
            Product p = dao.getProduct(Integer.parseInt(pid));
            
            request.setAttribute("listCC", listCC);
            request.setAttribute("pcid", pcid);
            request.setAttribute("p", p);
            
            System.out.println(pcid);
            
            request.getRequestDispatcher("edit-product.jsp").forward(request, response);
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
