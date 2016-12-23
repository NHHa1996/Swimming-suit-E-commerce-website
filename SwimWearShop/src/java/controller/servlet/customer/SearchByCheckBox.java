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
@WebServlet(name = "SearchByCheckBox", urlPatterns = {"/SearchByCheckBox"})
public class SearchByCheckBox extends HttpServlet {

    private String convertType(String type) {
        if (type.equalsIgnoreCase("all type")) {
            return " type is not null ";
        }
        return " type = '" + type + "' ";
    }

    private String convertBrand(String brand) {
        if (brand.equalsIgnoreCase("all brand")) {
            return " brand is not null ";
        }
        return " brand = '" + brand + "' ";
    }

    private String convertDiscount(String discount) {
        if (discount.equalsIgnoreCase("all discount")) {
            return " discount is not null ";
        } else if (discount.equalsIgnoreCase("Other")) {
            return " discount > -1 and discount <= 10 ";
        } else if (discount.equalsIgnoreCase("5% - 10%")) {
            return " discount > 5 and discount <= 10 ";
        }
        return " discount > " + discount.charAt(0) + discount.charAt(1) + " and discount <= " + discount.charAt(discount.length() - 3) + discount.charAt(discount.length() - 2) + " ";
    }

    private String convertPrice(String price) {
        String temp[] = price.trim().replace("$", "").replace("- ", "").split(" ");
        return " price >= " + temp[0] + " and price <= " + temp[1];
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String discount = request.getParameter("discount");
            String type = request.getParameter("type");
            String brand = request.getParameter("brand");
            String price = request.getParameter("price");

            String query = "Select * from product where " + convertDiscount(discount) + " and " + convertType(type) + " and " + convertBrand(brand) + " and " + convertPrice(price);
            String countQuery = "Select COUNT(*) from product where " + convertDiscount(discount) + " and " + convertType(type) + " and " + convertBrand(brand) + " and " + convertPrice(price);
            listProduct = productDAO.getListProductByQuery(query);
            numProduct = productDAO.getNumProductbyQuery(countQuery);
            warning = "No product has discount (" + discount + ") and type: " + type + " and brand: " + brand + " and price: (" + price + ")</br>";
            if (numProduct == 1) {
                searchResult = "Found only one product has discount (" + discount + ") and type: " + type + " and brand: " + brand + " and price: (" + price + ")</br>";
            } else {
                searchResult = "Found " + numProduct + " products has discount (" + discount + ") and type: " + type + " and brand: " + brand + " and price: (" + price + ")</br>";
            }
            request.getRequestDispatcher("category.jsp?act=search").forward(request, response);
        }
        catch(Exception e) {
            return;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific problem occurs
     * @throws IOException if an I/O problem occurs
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
     * @throws ServletException if a servlet-specific problem occurs
     * @throws IOException if an I/O problem occurs
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
