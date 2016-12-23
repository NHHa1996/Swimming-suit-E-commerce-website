/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.customer;

import static model.MyStaticVariable.productDAO;
import static model.MyStaticVariable.listProduct;
import static model.MyStaticVariable.numProduct;
import static model.MyStaticVariable.searchResult;
import static model.MyStaticVariable.warning;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "SearchByTool", urlPatterns = {"/SearchByTool"})
public class SearchByTool extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String searchInput = request.getParameter("search");
            if (searchInput.equalsIgnoreCase("all") || searchInput.equalsIgnoreCase("all clothing") || searchInput.equalsIgnoreCase("all item") || searchInput.equalsIgnoreCase("all product")) {
                listProduct = productDAO.getFullListProduct();
            } else {
                listProduct = productDAO.searchProduct(searchInput);
            }
            numProduct = listProduct.size();
            warning = "No product found for result \"" + searchInput + "\"</br>";
            if (numProduct == 1) {
                searchResult = "Found only one product for result \"" + searchInput + "\"</br>";
            } else {
                searchResult = "Found " + numProduct + " products for result \"" + searchInput + "\"</br>";
            }
            request.getRequestDispatcher("category.jsp?act=search").forward(request, response);
        } catch (Exception e) {
            return;
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
