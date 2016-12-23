package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.user.Admin;
import model.MyStaticVariable;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
 try {
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <title>Swim Wear a E-Commerce online Shopping - Admin</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\" />\n");
      out.write("        <link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>\n");
      out.write("        <script>\n");
      out.write("            function validateForm() {\n");
      out.write("                var e = document.forms[\"login\"][\"adEmail\"].value;\n");
      out.write("                var p = document.forms[\"login\"][\"adPassword\"].value;\n");
      out.write("                if (e == null || e == \"\" || p == null || p == \"\") {\n");
      out.write("                    alert(\"Please input your email and password!\");\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            String adEmail = "";
            String adPassword = "";
            if (session.getAttribute("adEmail") != null) {
                adEmail = session.getAttribute("adEmail").toString();
                if (session.getAttribute("adPassword") != null) {
                    adPassword = session.getAttribute("adPassword").toString();
                }
                if (new Admin().login(adEmail, adPassword)) {
                    MyStaticVariable.admin = MyStaticVariable.userDAO.getAdminFromDB(adEmail);
                    MyStaticVariable.adminIsValid = true;

                } else {
                    MyStaticVariable.admin = null;
                }
            } else {
                MyStaticVariable.admin = null;
            }

        
      out.write("\n");
      out.write("        <div id=\"loginpanelwrap\">\n");
      out.write("\n");
      out.write("            <div class=\"loginheader\">\n");
      out.write("                <div class=\"logintitle\"><a href=\"#\">SwimWear Admin</a></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"loginform\">\n");
      out.write("                <form action=\"/SwimWearShop/AdminLogin\" method=\"post\" name=\"login\" onsubmit=\"return validateForm()\" >\n");
      out.write("                    <div class=\"loginform_row\">\n");
      out.write("                        <label>&nbsp&nbsp&nbsp&nbspEmail:</label>\n");
      out.write("                        <input type=\"text\" class=\"loginform_input\" placeholder=\"Please enter email*\" value=\"");
      out.print(adEmail);
      out.write("\" name=\"adEmail\" />\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"loginform_row\">\n");
      out.write("                        <label>Password:</label>\n");
      out.write("                        <input type=\"password\" class=\"loginform_input\" placeholder=\"Please enter password*\" value=\"");
      out.print(adPassword);
      out.write("\"  name=\"adPassword\" />\n");
      out.write("                    </div>");
 String check = "";
                        if (MyStaticVariable.admin != null) {
                            response.sendRedirect("/SwimWearShop/Admin/index.jsp");
                        }
                        if (MyStaticVariable.adminIsValid == false) {
                            check = "Invalid email or password";
                            out.println("<p style=\"color:red\">" + check + "</p>");
                            MyStaticVariable.adminIsValid = true;
                        }
      out.write("\n");
      out.write("                    <div class=\"loginform_row\">\n");
      out.write("                        <input type=\"submit\" class=\"loginform_submit\" value=\"Login\" />\n");
      out.write("                    </div> \n");
      out.write("                    <div class=\"clear\"></div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
} catch(Exception e) {}
      out.write('\n');
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
