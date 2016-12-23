package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      model.MyStaticVariable shop = null;
      synchronized (application) {
        shop = (model.MyStaticVariable) _jspx_page_context.getAttribute("shop", PageContext.APPLICATION_SCOPE);
        if (shop == null){
          shop = new model.MyStaticVariable();
          _jspx_page_context.setAttribute("shop", shop, PageContext.APPLICATION_SCOPE);
        }
      }
      out.write("\n");
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
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"banner-section\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"banner-grids\">\n");
      out.write("                        <div class=\"col-md-6 banner-grid\">\n");
      out.write("                            <h2>the latest collections</h2>\n");
      out.write("                            <p>Swimwear trends for 2016 that is! The ladies are looking for a new bikini or one piece at the moment so it was time to share some trends in new swimwear collections, on the beach and of course Swim Wear Shopping.</p>\n");
      out.write("                            <a href=\"category.jsp\" class=\"button\"> shop now </a>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-md-6 banner-grid1\">\n");
      out.write("                            <img src=\"images/p2.png\" class=\"img-responsive\" alt=\"\"/>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"clearfix\"></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"banner-bottom\">\n");
      out.write("                <div class=\"gallery-cursual\">\n");
      out.write("                    <!--requried-jsfiles-for owl-->\n");
      out.write("                    <script src=\"js/owl.carousel.js\"></script>\n");
      out.write("                    <script>\n");
      out.write("                        $(document).ready(function () {\n");
      out.write("                            $(\"#owl-demo\").owlCarousel({\n");
      out.write("                                items: 3,\n");
      out.write("                                lazyLoad: true,\n");
      out.write("                                autoPlay: true,\n");
      out.write("                                pagination: false,\n");
      out.write("                            });\n");
      out.write("                        });\n");
      out.write("                    </script>\n");
      out.write("                    <!--requried-jsfiles-for owl -->\n");
      out.write("                    <!--start content-slider-->\n");
      out.write("                    <div id=\"owl-demo\" class=\"owl-carousel text-center\">\n");
      out.write("                    ");
for (int i = 0; i < 8; i++) {
      out.write("\n");
      out.write("                    <div class=\"item\">\n");
      out.write("                        <img class=\"lazyOwl\" data-src=\"images/b");
      out.print(i+1);
      out.write(".jpg\" alt=\"name\">\n");
      out.write("                        <div class=\"item-info\">\n");
      out.write("                            <h5>Having a good summer!</h5>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <!--sreen-gallery-cursual-->\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"gallery\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <h3>Featured products</h3>\n");
      out.write("                <div class=\"gallery-grids\">\n");
      out.write("\n");
      out.write("                    ");

                        for (int i = 0; i < 8; i++) {
      out.write("\n");
      out.write("                    <div class=\"col-md-3 gallery-grid \">\n");
      out.write("                        <a href=\"single.jsp?proID=");
      out.print(shop.fullproducts.get(i).getProID());
      out.write("\"><img src=\"images/product/side 1/");
      out.print(shop.fullproducts.get(i).getImage());
      out.write("\" class=\"img-responsive\" alt=\"\" style=\"width: 267px ;height: 340px\"/>\n");
      out.write("                            <div class=\"gallery-info\">\n");
      out.write("                                <div class=\"quick\">\n");
      out.write("                                    <p><span class=\"glyphicon glyphicon-eye-open\" aria-hidden=\"true\"></span> view</p>\n");
      out.write("                                </div>\n");
      out.write("                            </div></a>\n");
      out.write("                        <div class=\"galy-info\">\n");
      out.write("                            <p>");
      out.print(shop.fullproducts.get(i).getProName());
      out.write("</p>\n");
      out.write("                            <div class=\"galry\">\n");
      out.write("                                <div class=\"prices\">\n");
      out.write("                                    <h5 class=\"item_price\">$");
      out.print(shop.fullproducts.get(i).getFinalPrice());
      out.write(".00</h5>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"rating\">\n");
      out.write("                                    <span>☆</span>\n");
      out.write("                                    <span>☆</span>\n");
      out.write("                                    <span>☆</span>\n");
      out.write("                                    <span>☆</span>\n");
      out.write("                                    <span>☆</span>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"clearfix\"></div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"clearfix\"></div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"subscribe\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"subscribe1\">\n");
      out.write("            <h4>the latest from swim wear</h4>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"subscribe2\">\n");
      out.write("            <form action=\"https://mail.google.com/mail/u/0/#inbox\">\n");
      out.write("                <input type=\"text\" class=\"text\" value=\"Email\" onfocus=\"this.value = '';\" onblur=\"if (this.value == '') {\n");
      out.write("                            this.value = 'Email';\n");
      out.write("                        }\">\n");
      out.write("                <input type=\"submit\" value=\"JOIN\">\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"clearfix\"></div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
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
