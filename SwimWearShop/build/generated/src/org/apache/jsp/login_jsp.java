package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

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
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      model.MyStaticVariable account = null;
      synchronized (application) {
        account = (model.MyStaticVariable) _jspx_page_context.getAttribute("account", PageContext.APPLICATION_SCOPE);
        if (account == null){
          account = new model.MyStaticVariable();
          _jspx_page_context.setAttribute("account", account, PageContext.APPLICATION_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Swim Wear a E-Commerce online Shopping</title>\n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\"/>\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\n");
      out.write("        <link href=\"css/owl.carousel.css\" rel=\"stylesheet\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <meta name=\"keywords\" content=\"Swim Wear Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, \n");
      out.write("              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design\" />\n");
      out.write("        <script type=\"application/x-javascript\"> addEventListener(\"load\", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>\n");
      out.write("        <script src=\"js/jquery.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/bootstrap-3.1.1.min.js\"></script>\n");
      out.write("        <script src=\"js/imagezoom.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- FlexSlider -->\n");
      out.write("        <script defer src=\"js/jquery.flexslider.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/flexslider.css\" type=\"text/css\" media=\"screen\" />\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("// Can also be used with $(document).ready()\n");
      out.write("\n");
      out.write("            function validateForm() {\n");
      out.write("                var e = document.forms[\"login\"][\"EmailInput\"].value;\n");
      out.write("                var p = document.forms[\"login\"][\"PasswordInput\"].value;\n");
      out.write("                if (e == null || e == \"\" || p == null || p == \"\") {\n");
      out.write("                    alert(\"Please input your email and password!\");\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function forgetPassword() {\n");
      out.write("//                var e = document.forms[\"login\"][\"EmailInput\"].value;\n");
      out.write("//                if (e == null || e == \"\") {\n");
      out.write("//                    alert(\"Please input your email!\");\n");
      out.write("//                } else {\n");
      out.write("//                    alert('If email \"' + e + '\" is registered. The password will be sent to your email in about 2 minutes');\n");
      out.write("//                }\n");
      out.write("\n");
      out.write("                var e = prompt(\"Please enter your email\", \"\");\n");
      out.write("\n");
      out.write("                if (e != null) {\n");
      out.write("                    alert('If email \"' + e + '\" is registered. The password will be sent to your email in about 2 minutes');\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            $(window).load(function () {\n");
      out.write("                $('.flexslider').flexslider({\n");
      out.write("                    animation: \"slide\",\n");
      out.write("                    controlNav: \"thumbnails\"\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
if(account.customer != null) {
            response.sendRedirect("index.jsp");
        }
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("            <!--contact-->\n");
      out.write("            <div class=\"content\">\n");
      out.write("                <div class=\"main-1\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <div class=\"login-page\">\n");
      out.write("                            <div class=\"account_grid\">\n");
      out.write("                                <div class=\"col-md-6 login-left\">\n");
      out.write("                                    <h3>NEW CUSTOMERS</h3>\n");
      out.write("                                    <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>\n");
      out.write("                                    <a class=\"acount-btn\" href=\"register.jsp\">Create an Account</a>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-md-6 login-right\">\n");
      out.write("                                    <h3>REGISTERED CUSTOMERS</h3>\n");
      out.write("                                    <p>If you have an account with us, please log in.</p>\n");
      out.write("                                    <form action=\"CustomerLogin\" method=\"post\" name=\"login\" onsubmit=\"return validateForm()\" >\n");
      out.write("                                        <div>\n");
      out.write("                                            <span>Email Address<label>*</label></span>\n");
      out.write("                                            <input type=\"email\" name=\"EmailInput\" placeholder=\"Enter your email*\"> \n");
      out.write("                                        </div>\n");
      out.write("                                        <div>\n");
      out.write("                                            <span>Password<label>*</label></span>\n");
      out.write("                                            <input type=\"password\" name=\"PasswordInput\" placeholder=\"Enter your password*\"> \n");
      out.write("                                        </div>\n");
      out.write("                                        <a class=\"forgot\" href=\"EmailServlet\"  onclick=\"forgetPassword()\">Forgot Your Password?</a>\n");
      out.write("                                        <input type=\"submit\" value=\"Login\">\n");
      out.write("                                    </form>\n");
      out.write("                                    <form action=\"EmailServlet\" method=\"post\">\n");
      out.write("                                    </form>\n");
      out.write("                                </div>\t\n");
      out.write("                                <div class=\"clearfix\"> </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <!-- login -->\n");
      out.write("            <div class=\"subscribe\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"subscribe1\">\n");
      out.write("                        <h4>the latest from swim wear</h4>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"subscribe2\">\n");
      out.write("                        <form action=\"https://mail.google.com/mail/u/0/#inbox\">\n");
      out.write("                            <input type=\"text\" class=\"text\" value=\"Email\" onfocus=\"this.value = '';\" onblur=\"if (this.value == '') {\n");
      out.write("                                        this.value = 'Email';\n");
      out.write("                                    }\">\n");
      out.write("                            <input type=\"submit\" value=\"JOIN\">\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"clearfix\"></div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
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
