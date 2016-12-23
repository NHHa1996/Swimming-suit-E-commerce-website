/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.customer;

import static model.MyStaticVariable.title404;
import static model.MyStaticVariable.problem;
import static model.MyStaticVariable.detail;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.user.Account;
import model.user.Customer;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "CustomerRegister", urlPatterns = {"/CustomerRegister"})
public class CustomerRegister extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Customer customer = new Customer();
        String name = request.getParameter("Register Name");
        String bankNumber = request.getParameter("Register Bank Number");
        String email = request.getParameter("Register Email Address");
        String bankName = request.getParameter("Bank Name");
        String address = request.getParameter("Register Address");
        String phonenumber = request.getParameter("Register Phone Number");
        String password = request.getParameter("Register Password");
        String confirmPassword = request.getParameter("Confirm Password");
        try {
//            if (name.equals("") || bankNumber.equals("") || email.equals("") || bankName.equals("") || password.equals("") || confirmPassword.equals("")) {
//                throw new Exception("Please input all necessary information");
//            }
            customer.setName(name);
            customer.setEmail(email);
            customer.setAddress(address);
            customer.setPhoneNumber(phonenumber);
            Account b = new Account();
            b.setBankName(bankName);
//            try {
                b.setBankNumber(Integer.parseInt(bankNumber));
//            } catch (Exception ex) {
//                throw new Exception("Bank Number must be a natural number");
//            }
//            if (password.equals(confirmPassword)) {
                customer.setPassword(password);
//            } else {
//                throw new Exception("Confirm Password incorrect");
//            }
            customer.setBankAccount(b);
            customer.setAccountInBank();
            customer.register();
            title404 = "Account Created";
            problem = "You had registered successfully by email: " + email;
            customer.accessSystem(email);
            detail = "Congratulation!<br/><a href=\"login.jsp\" style=\"color:blue\" >Click here to login now!</a>";
        } catch (Exception ex) {
            Logger.getLogger(CustomerRegister.class.getName()).log(Level.SEVERE, null, ex);
            title404 = "Problem occurred when register system";
            problem = "Register unsuccessfull, Please check it again!";
            detail = ex.getMessage() + "<br/><a href=\"register.jsp\" style=\"color:blue\" >Click here to register again!</a>";
            return;
        } finally {

            request.getRequestDispatcher("404.jsp").forward(request, response);
        }
//        response.sendRedirect("404.jsp");
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
