/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EmailServlet", urlPatterns = {"/EmailServlet"})
public class EmailServlet extends HttpServlet {

    private String forgetPassword(String email) throws Exception {
        DatabaseController.createConnection();
        String query = "select password from customer where email='" + email + "'";
        ResultSet rs = DatabaseController.executeQuery(query);
        String pass = "";
        while (rs.next()) {
            pass =  rs.getString("password");
        }
        rs.close();
        DatabaseController.closeConnection();
        return pass;
    }

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException, Exception {

        String email = request.getParameter("email");

        final String err = "/error.jsp";
        final String succ = "/success.jsp";
        String passwordforget = forgetPassword(email);
        String message = "SwimWearShop email: Your password is " + passwordforget;

        String from = "cuongvip1295@gmail.com";
//        String to = "kimlong19951995@gmail.com";
        String to = email;
        String subject = "SwimWearShop email";
        String login = "cuongvip1295@gmail.com";
        String password = "cuongvipro12101995";

        RequestDispatcher dispatcher = request.getRequestDispatcher(succ);

        try {
            Properties props = new Properties();
            props.setProperty("mail.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");

            Authenticator auth = new SMTPAuthenticator(login, password);

            Session session = Session.getInstance(props, auth);

            MimeMessage msg = new MimeMessage(session);
            msg.setText(message);
            msg.setSubject(subject);
            msg.setFrom(new InternetAddress(from));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            Transport.send(msg);

        } catch (AuthenticationFailedException ex) {

            request.setAttribute("ErrorMessage", "Authentication failed");

            dispatcher = request.getRequestDispatcher(err);

        } catch (AddressException ex) {
            request.setAttribute("ErrorMessage", "Wrong email address");

            dispatcher = request.getRequestDispatcher(err);

        } catch (MessagingException ex) {
            request.setAttribute("ErrorMessage", ex.getMessage());

            dispatcher = request.getRequestDispatcher(err);
        }

        dispatcher.forward(request, response);
    }

    private class SMTPAuthenticator extends Authenticator {

        private PasswordAuthentication authentication;

        public SMTPAuthenticator(String login, String password) {
            authentication = new PasswordAuthentication(login, password);
        }

        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return authentication;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EmailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EmailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
