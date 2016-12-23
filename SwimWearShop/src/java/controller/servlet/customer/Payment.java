/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.customer;


import static model.MyStaticVariable.customer;
import static model.MyStaticVariable.cart;
import static model.MyStaticVariable.title404;
import static model.MyStaticVariable.problem;
import static model.MyStaticVariable.detail;
import static model.MyStaticVariable.billDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.shop.Ordered;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "Payment", urlPatterns = {"/Payment"})
public class Payment extends HttpServlet {

    public String getToday() {
        Calendar cal = Calendar.getInstance();
        return cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE) + " " + cal.get(Calendar.HOUR_OF_DAY) + ":" + cal.get(Calendar.MINUTE) + ":" + cal.get(Calendar.SECOND);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (cart.getNumProduct() == 0) {
                title404 = "No Payment Required";
                problem = "You didn't order any product in your cart";
                detail = "Please add product that you wish to buy into your cart!<br/><a href=\"category.jsp\" style=\"color:blue\" >Click here to shopping now!</a>";
            } else if (customer.payMoney(cart)) {
                int customerID = customer.getUserID();
                String date = getToday();
                for (int i = 0; i < cart.getListOrdered().size(); i++) {
                    Ordered po = cart.getListOrdered().get(i);
                    int payment = po.getPayment();
                    billDAO.saveBill(customerID, payment, date, po.getProduct().getProID(), po.getQuantity());
                }
                int payment = cart.getCartCost();
                customer.emptyCart(cart);
                title404 = "Payment successful";
                problem = "Your product will be ship in 1-1:30 hours";
                detail = "You had pay $" + payment + ".00 ,Now your bank account balance is $" + customer.getBankAccount().getAccountBalance() + ".00<br/><a href=\"transaction.jsp\"  style=\"color:blue\" >Click here to check your transactions!</a>";
            } else {
                title404 = "Payment unsuccessful";
                problem = "You cannot buy all of the product in ypur cart";
                detail = "Not enough money in your bank account balance";
                detail = "<a href=\"checkout.jsp\"  style=\"color:blue\" >Click here to remove some item from your cart!</a>";
            }
            request.getRequestDispatcher("404.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Payment.class.getName()).log(Level.SEVERE, null, ex);
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
