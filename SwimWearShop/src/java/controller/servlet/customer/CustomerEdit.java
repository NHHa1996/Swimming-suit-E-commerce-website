/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.customer;

import static model.MyStaticVariable.customer;
import static model.MyStaticVariable.title404;
import static model.MyStaticVariable.problem;
import static model.MyStaticVariable.detail;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "CustomerEdit", urlPatterns = {"/CustomerEdit"})
public class CustomerEdit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("Name");
            String email = request.getParameter("Email");
            String password = request.getParameter("Password");
            String address = request.getParameter("Address");
            String phonenumber = request.getParameter("Phone Number");
//            if (name.equalsIgnoreCase("") || email.equalsIgnoreCase("") || password.equalsIgnoreCase("")) {
//                title404 = "Problem occurred when edit the information";
//                problem = "Edit unsuccessfull, Please check it again!";
//                detail = "Please input enough information.<br/><a href=\"account.jsp\" style=\"color:blue\" >Click here to edit again!</a>";
//            } else if (!email.equalsIgnoreCase(customer.getEmail()) && customer.checkExistEmail(email)) {
//                title404 = "Problem occurred when edit the information";
//                problem = "Edit unsuccessfull, Please check it again!";
//                detail = "This email \"" + email + "\" was registered.<br/><a href=\"account.jsp\" style=\"color:blue\" >Click here to edit again!</a>";
//            } else {
                customer.editInformation("name", name);
                customer.editInformation("password", password);
                customer.editInformation("email", email);
                customer.editInformation("address", address);
                customer.editInformation("phonenumber", phonenumber);
                customer.setName(name);
                customer.setPassword(password);
                customer.setEmail(email);
                customer.setAddress(address);
                customer.setPhoneNumber(phonenumber);
                
                title404 = "Account Edited.";
                problem = "You had edit successfully your information.";
                detail = "Congratulation!<br/><a href=\"account.jsp\" style=\"color:blue\" >Click here check your account!</a>";
//            }
//            request.getRequestDispatcher("404.jsp").forward(request, response);
            response.sendRedirect("CustomerLogin?EmailInput=" + email+ "&PasswordInput=" + password);
        } catch (Exception ex) {
            Logger.getLogger(CustomerEdit.class.getName()).log(Level.SEVERE, null, ex);
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
