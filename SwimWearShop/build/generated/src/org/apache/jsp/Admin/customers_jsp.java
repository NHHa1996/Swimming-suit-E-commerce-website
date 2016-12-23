package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.user.Account;
import model.user.Customer;
import java.util.ArrayList;
import model.MyStaticVariable;

public final class customers_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <title>Swim Wear a E-Commerce online Shopping - Admin</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\" />\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $('#check-all').click(function () {\n");
      out.write("                    $(\"input:checkbox\").attr('checked', true);\n");
      out.write("                });\n");
      out.write("                $('#uncheck-all').click(function () {\n");
      out.write("                    $(\"input:checkbox\").attr('checked', false);\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        <link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"panelwrap\">\n");
      out.write("\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("          \n");
      out.write("\n");
      out.write("                <div class=\"center_content\">  \n");
      out.write("\n");
      out.write("                    <div id=\"right_wrap\">\n");
      out.write("                        <div id=\"right_content\">             \n");
      out.write("                            <h2>List of Customers</h2>\n");
      out.write("                            <form action=\"/SwimWearShop/DeleteCustomer?userID=all\" method=\"post\" id=\"customers\">\n");
      out.write("                                <table id=\"rounded-corner\">\n");
      out.write("                                    <thead>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th></th>\n");
      out.write("                                            <th>No.</th>\n");
      out.write("                                            <th>Name</th>\n");
      out.write("                                            <th>Email</th>\n");
      out.write("                                            <th>Password</th>\n");
      out.write("                                            <th>Bank ID</th>\n");
      out.write("                                            <th>Bank Name</th>\n");
      out.write("                                            <th>Bank Number</th>\n");
      out.write("                                            <th>Bank Balance</th>\n");
      out.write("                                            <th>View Transaction</th>\n");
      out.write("                                        </tr>\n");
      out.write("                                    </thead>\n");
      out.write("                                    <tfoot>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <td colspan=\"12\">Adminstators are not allowed to edit Customer information without the requirement of manager.</td>\n");
      out.write("                                        </tr>\n");
      out.write("                                    </tfoot>\n");
      out.write("                                    <tbody>\n");
      out.write("\n");
      out.write("                                    ");

                                        ArrayList<Customer> customers = MyStaticVariable.userDAO.getListCustomerFromDB();
                                        for (int i = 0; i < customers.size(); i++) {
                                            Customer c = customers.get(i);
                                            Account b = c.getBankAccount();
                                            if (i % 2 != 0) {
                                    
      out.write("\n");
      out.write("                                    <tr class=\"odd\">\n");
      out.write("                                        ");
} else {
      out.write("\n");
      out.write("                                    <tr class=\"even\">\n");
      out.write("                                        ");
}
      out.write("\n");
      out.write("                                        <td><input type=\"checkbox\" name=\"userIDs\" value=\"");
      out.print(c.getUserID());
      out.write("\"/></td>\n");
      out.write("                                        <td>");
      out.print(i + 1);
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(c.getName());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(c.getEmail());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(c.getPassword());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(b.getBankID());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(b.getBankName());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(b.getBankNumber());
      out.write("</td>\n");
      out.write("                                        <td>$");
      out.print(b.getAccountBalance());
      out.write("</td>\n");
      out.write("                                        <td><a href=\"/SwimWearShop/Admin/transaction.jsp?email=");
      out.print(c.getEmail());
      out.write("\"><img src=\"images/view.png\" alt=\"\" title=\"\" border=\"0\" /></a></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    ");
}
      out.write("\n");
      out.write("                                </tbody>\n");
      out.write("                            </table> \n");
      out.write("                        </form>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "sidebar.jsp", out, false);
      out.write(" \n");
      out.write("                    <div class=\"clear\"></div>\n");
      out.write("                </div> <!--end of center_content-->\n");
      out.write("\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write(" \n");
      out.write("        </div> \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
