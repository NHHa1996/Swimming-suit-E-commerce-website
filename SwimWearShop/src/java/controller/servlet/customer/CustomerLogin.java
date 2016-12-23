/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.customer;

import static model.MyStaticVariable.aes;
import static model.MyStaticVariable.title404;
import static model.MyStaticVariable.problem;
import static model.MyStaticVariable.detail;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.user.Customer;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "CustomerLogin", urlPatterns = {"/CustomerLogin"})
public class CustomerLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Customer cus = new Customer();
        String emailInput = request.getParameter("EmailInput");
        String passwordInput = request.getParameter("PasswordInput");
        try {
            if (cus.login(emailInput, passwordInput)) {
                cus.accessSystem(emailInput);
                Cookie email = new Cookie("email", emailInput);
                String encryptpassword = aes.encrypt(passwordInput);
                Cookie password = new Cookie("password", encryptpassword);
                email.setMaxAge(60 * 60 * 24);
                password.setMaxAge(60 * 60 * 24);
                response.addCookie(email);
                response.addCookie(password);
                response.sendRedirect("account.jsp");
//                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                title404 = "Problem occurred when login system";
                problem = "Login unsuccessful!";
                detail = "Your email or password is incorrect!<br/><a href=\"login.jsp\" style=\"color:blue\" >Click here to login again!</a>";
                request.getRequestDispatcher("404.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(CustomerLogin.class.getName()).log(Level.SEVERE, null, ex);
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
