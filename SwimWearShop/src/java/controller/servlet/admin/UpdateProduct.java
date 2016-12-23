/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static model.MyStaticVariable.admin;
import static model.MyStaticVariable.refresh;

/**
 *
 * @author USER
 */
@WebServlet(name = "UpdateProduct", urlPatterns = {"/UpdateProduct"})
public class UpdateProduct extends HttpServlet {

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
            out.println("<title>Servlet UpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath() + "</h1>");
            String option = request.getParameter("option");
            int categoryID = Integer.parseInt(request.getParameter("category"));
            String proID = request.getParameter("proID");
            String name = request.getParameter("name");
            String brand = request.getParameter("brand");
            String detail = request.getParameter("detail");
            String type = request.getParameter("ptype");
            int originalPrice = Integer.parseInt(request.getParameter("originalPrice"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            String fileName1 = (request.getParameter("file1")).toString();
            String fileName2 = (request.getParameter("file2")).toString();
            String fileName3 = (request.getParameter("file3")).toString();
            if (option.equals("edit")) {
                try {
                    admin.deleteProduct(proID);
                    admin.addProduct(categoryID, toImage(name), detail, originalPrice, name, discount, type, brand);
                    admin.editProID(Integer.parseInt(proID));
                    out.println(proID);
                    if (!fileName1.equals("")) {
                        uploadFile(fileName1, 1, name);
                    } 
                    if (!fileName2.equals("")) {
                        uploadFile(fileName2, 2, name);
                    }
                    if (!fileName3.equals("")) {
                        uploadFile(fileName3, 3, name);
                    }
                    out.println("edited");
                } catch (Exception ex) {
                    Logger.getLogger(UpdateProduct.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    admin.addProduct(categoryID, name + ".jpg", detail, originalPrice, name, discount, type, brand);
                    uploadFiles(fileName1, fileName2, fileName3, name);
                    out.println("added");
                } catch (Exception ex) {
                    Logger.getLogger(UpdateProduct.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            refresh();
            out.println("</body>");
            out.println("</html>");
        }
    }

    private void uploadFiles(String fileName1, String fileName2, String fileName3, String productName) throws Exception {
//        String filepath = "E:\\NetBeansProjects\\SwimWearShop\\web\\images\\product\\";
//
//        File source1 = new File(filepath + "source\\" + fileName1);
//        File source2 = new File(filepath + "source\\" + fileName2);
//        File source3 = new File(filepath + "source\\" + fileName3);
//
//        File dest1 = new File(filepath + "side 1\\" + productName + ".jpg");
//        File dest2 = new File(filepath + "side 2\\" + productName + ".jpg");
//        File dest3 = new File(filepath + "side 3\\" + productName + ".jpg");
//
//        uploadside(source1, dest1);
//        uploadside(source2, dest2);
//        uploadside(source3, dest3);
        uploadFile(fileName1, 1, productName);
        uploadFile(fileName2, 2, productName);
        uploadFile(fileName3, 3, productName);

    }

    private void uploadFile(String fileName, int side, String productName) throws Exception {
        String filepath = "E:\\NetBeansProjects\\SwimWearShop\\web\\images\\product\\";

        File source = new File(filepath + "source\\" + fileName);

        File dest = new File(filepath + "side " + side + "\\" + productName + ".jpg");

        uploadside(source, dest);
    }

    private void uploadside(File source, File dest) throws FileNotFoundException, IOException {
        InputStream is = null;
        OutputStream os = null;
        try {
            is = new FileInputStream(source);
            os = new FileOutputStream(dest);
            byte[] buffer = new byte[1024];
            int length;
            while ((length = is.read(buffer)) > 0) {
                os.write(buffer, 0, length);
            }
        } finally {
            is.close();
            os.close();
        }
    }
    
    private String toImage(String proName) {
        return proName.toLowerCase() + ".jpg";
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
