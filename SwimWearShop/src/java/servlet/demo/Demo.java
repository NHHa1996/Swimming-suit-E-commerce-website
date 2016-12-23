/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.demo;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cuong
 */
@WebServlet(name = "Demo", urlPatterns = {"/Demo"})
public class Demo extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Demo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h2>Welcome to SwimWearShop demo page</h2>");
            
            out.println("<h3>Customer Demo Mode</h3>");
            out.println("<form method=\"get\" action=\"DemoCustomer\">\n");
            out.println("            <table>\n");
            out.println("                <tr>\n");
            out.println("                    <td>Select a page to demo</td>\n");
            out.println("                    <td>\n");
            out.println("                        <select name=\"page\">\n");
            out.println("                            <option>index.jsp</option>\n");
            out.println("                            <option>account.jsp</option>\n");
            out.println("                            <option>category.jsp</option>\n");
            out.println("                            <option>transaction.jsp</option>\n");
            out.println("                            <option>contact.jsp</option>\n");
            out.println("                            <option>support.jsp</option>\n");
            out.println("                            <option>checkout.jsp</option>\n");
            out.println("                            <option value=\"single.jsp?proID=1\">single.jsp</option>\n");
            out.println("                        </select>\n");
            out.println("                    </td>\n");
            out.println("                </tr>\n");
            out.println("                    <td><input type=\"submit\" value=\"Demo\"></td>\n");
            out.println("                    <td>\n");
            out.println("                    </td>\n");
            out.println("                </tr>\n");
            out.println("            </table>\n");
            out.println("        </form>");
            
            out.println("<h3>Admin Demo Mode</h3>");
            out.println("<form method=\"get\" action=\"DemoAdmin\">\n");
            out.println("            <table>\n");
            out.println("                <tr>\n");
            out.println("                    <td>Select a page to demo</td>\n");
            out.println("                    <td>\n");
            out.println("                        <select name=\"page\">\n");
            out.println("                            <option>index.jsp</option>\n");
            out.println("                            <option>products.jsp</option>\n");
            out.println("                            <option>categories.jsp</option>\n");
            out.println("                            <option>customers.jsp</option>\n");
            out.println("                            <option>settings.jsp</option>\n");
            out.println("                        </select>\n");
            out.println("                    </td>\n");
            out.println("                </tr>\n");
            out.println("                    <td><input type=\"submit\" value=\"Demo\"></td>\n");
            out.println("                    <td>\n");
            out.println("                    </td>\n");
            out.println("                </tr>\n");
            out.println("            </table>\n");
            out.println("        </form>");
            out.println("</body>");
            out.println("</html>");
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
