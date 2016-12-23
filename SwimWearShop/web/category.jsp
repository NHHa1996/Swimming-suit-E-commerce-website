<%-- 
    Document   : category
    Created on : Sep 29, 2016, 1:31:59 PM
    Author     : Cuong
--%>

<%@page import="model.shop.Product"%>
<%@page import="model.shop.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<jsp:useBean id="shop"
             scope="application"
             class="model.MyStaticVariable"/>

<html>
    <head>
        <title>Swim Wear a E-Commerce online Shopping</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/owl.carousel.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Swim Wear Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        
        <!-- the jScrollPane script -->
        <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
        <script type="text/javascript" id="sourcecode">
            $(function ()
            {
                $('.scroll-pane').jScrollPane();
            });
        </script>
        <!-- //the jScrollPane script -->
        <link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
        <!-- the mousewheel plugin -->
        <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
    </head>
    <body>
        <jsp:include page = "header.jsp"></jsp:include>

            <div class="content">
                <div class="product-model">	 
                    <div class="container">
                        <h2>Our Products Available</h2>	
                    <jsp:include page="product.jsp"></jsp:include>

                        <form action="${pageContext.request.contextPath}/SearchByCheckBox" method="get">
                        <div class="rsidebar span_1_of_left">
                            <section  class="sky-form">
                                <div class="product_right">

                                    <h4 class="m_2"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Categories</h4>



                                    <%
                                        for (int i = 0; i < shop.categories.size(); i++) {
                                            out.println("<div class=\"tab" + (i + 1) + "\">");
                                            out.println("<ul class=\"place\">");
                                            out.println("<li class=\"sort\">" + shop.categories.get(i) + "</li>");
                                            out.println("<li class=\"by\"><img src=\"images/do.png\" alt=\"\"></li>");
                                            out.println("<div class=\"clearfix\"> </div>");
                                            out.println("</ul>");
                                            out.println("<div class=\"single-bottom\">");

                                            ArrayList<Category> subCategories = shop.categoryDAO.getListSubCategory(shop.categories.get(i).getCateName());

                                            for (int j = 0; j < subCategories.size(); j++) {
                                                String subCateName = subCategories.get(j).getCateName();
                                                out.println("<a href=\"SearchByCategory?subcate=" + subCateName + "\"><p>" + subCateName + "</p></a>");
                                            }

                                            out.println("</div>");
                                            out.println("</div>");
                                        }
                                    %>
                                    <!--script-->
                                    <script>
            $(document).ready(function () {
                $(".tab1 .single-bottom").hide();
                $(".tab2 .single-bottom").hide();
                $(".tab3 .single-bottom").hide();
                $(".tab4 .single-bottom").hide();
                $(".tab5 .single-bottom").hide();

                $(".tab1 ul").click(function () {
                    $(".tab1 .single-bottom").slideToggle(300);
                    $(".tab2 .single-bottom").hide();
                    $(".tab3 .single-bottom").hide();
                    $(".tab4 .single-bottom").hide();
                    $(".tab5 .single-bottom").hide();
                })
                $(".tab2 ul").click(function () {
                    $(".tab2 .single-bottom").slideToggle(300);
                    $(".tab1 .single-bottom").hide();
                    $(".tab3 .single-bottom").hide();
                    $(".tab4 .single-bottom").hide();
                    $(".tab5 .single-bottom").hide();
                })
                $(".tab3 ul").click(function () {
                    $(".tab3 .single-bottom").slideToggle(300);
                    $(".tab4 .single-bottom").hide();
                    $(".tab5 .single-bottom").hide();
                    $(".tab2 .single-bottom").hide();
                    $(".tab1 .single-bottom").hide();
                })
                $(".tab4 ul").click(function () {
                    $(".tab4 .single-bottom").slideToggle(300);
                    $(".tab5 .single-bottom").hide();
                    $(".tab3 .single-bottom").hide();
                    $(".tab2 .single-bottom").hide();
                    $(".tab1 .single-bottom").hide();
                })
                $(".tab5 ul").click(function () {
                    $(".tab5 .single-bottom").slideToggle(300);
                    $(".tab4 .single-bottom").hide();
                    $(".tab3 .single-bottom").hide();
                    $(".tab2 .single-bottom").hide();
                    $(".tab1 .single-bottom").hide();
                })
            });
                                    </script>
                                    <!-- script -->					 
                            </section>

                            <section  class="sky-form">
                                <h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>DISCOUNTS</h4>
                                <div class="row row1 scroll-pane">
                                    <div class="col col-4">
                                        <label class="checkbox"><input type="radio" name="discount" checked="" value="all discount"><i></i>All (<%=shop.totalProduct%>)</label>
                                    </div>
                                    <div class="col col-4">
                                        <label class="checkbox"><input type="radio" name="discount" value="90% - 95%"><i></i>Upto 95% (<%=shop.numDiscounts.get(0)%>)</label>
                                        <label class="checkbox"><input type="radio" name="discount" value="80% - 90%"><i></i>80% - 90% (<%=shop.numDiscounts.get(1)%>)</label>
                                        <label class="checkbox"><input type="radio" name="discount" value="70% - 80%"><i></i>70% - 80% (<%=shop.numDiscounts.get(2)%>)</label>
                                        <label class="checkbox"><input type="radio" name="discount" value="60% - 70%"><i></i>60% - 70% (<%=shop.numDiscounts.get(3)%>)</label>
                                        <label class="checkbox"><input type="radio" name="discount" value="50% - 60%"><i></i>50% - 60% (<%=shop.numDiscounts.get(4)%>)</label>
                                        <label class="checkbox"><input type="radio" name="discount" value="40% - 50%"><i></i>40% - 50% (<%=shop.numDiscounts.get(5)%>)</label>
                                        <label class="checkbox"><input type="radio" name="discount" value="30% - 40%"><i></i>30% - 40% (<%=shop.numDiscounts.get(6)%>)</label>
                                        <label class="checkbox"><input type="radio" name="discount" value="20% - 30%"><i></i>20% - 30% (<%=shop.numDiscounts.get(7)%>)</label>
                                        <label class="checkbox"><input type="radio" name="discount" value="5% - 10%"><i></i>5% - 10% (<%=shop.numDiscounts.get(8)%>)</label>
                                        <label class="checkbox"><input type="radio" name="discount" value="Other"><i></i>Other(<%=shop.numDiscounts.get(9)%>)</label>
                                    </div>
                                </div>
                            </section>  				 

                            <section  class="sky-form">
                                <h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Price</h4>
                                <ul class="dropdown-menu1">
                                    <li><a href="">								               
                                            <div id="slider-range"></div>							
                                            <input type="text" id="amount" name="price" style="border: 0; font-weight: NORMAL;   font-family: 'Dosis-Regular';" />
                                        </a></li>			
                                </ul>
                            </section>
                            <!---->
                            <script type="text/javascript" src="js/jquery-ui.min.js"></script>
                            <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
                            <script type='text/javascript'>//<![CDATA[ 
            $(window).load(function () {
                $("#slider-range").slider({
                    range: true,
                    min: <%=shop.productDAO.getMinPriceOfProduct()%>,
                    max: <%=shop.productDAO.getMaxPriceOfProduct()%>,
                    values: [<%=shop.productDAO.getMinPriceOfProduct()%>, <%=shop.productDAO.getMaxPriceOfProduct()%>],
                    slide: function (event, ui) {
                        $("#amount").val("$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ]);
                    }
                });
                $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

            });//]]> 
                            </script>
                            <!---->


                            <section  class="sky-form">
                                <h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Type</h4>
                                <div class="row row1 scroll-pane">
                                    <div class="col col-4">
                                        <%
                                            out.println("<label class=\"checkbox\"><input type=\"radio\" name=\"type\" checked=\"\" value=\"All Type\"><i></i>" + "All Type" + "  (" + shop.totalProduct + ")" + "</label>");
                                            for (int i = 0; i < shop.listType.size(); i++) {
                                                String type = shop.listType.get(i);
                                                out.println("<label class=\"checkbox\"><input type=\"radio\" name=\"type\"  value=\"" + type + "\"><i></i>" + type + "  (" + shop.numTypes.get(i) + ")" + "</label>");
                                            }
                                        %>
                                    </div>
                                </div>
                            </section>
                            <section  class="sky-form">
                                <h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Brand</h4>
                                <div class="row row1 scroll-pane">
                                    <div class="col col-4">

                                        <%
                                            out.println("<label class=\"checkbox\"><input type=\"radio\" name=\"brand\" checked=\"\" value=\"All Brand\"><i></i>" + "All Brand" + "  (" + shop.totalProduct + ")" + "</label>");
                                            for (int i = 0; i < shop.listBrand.size(); i++) {
                                                String brand = shop.listBrand.get(i);
                                                out.println("<label class=\"checkbox\"><input type=\"radio\" name=\"brand\"  value=\"" + brand + "\"><i></i>" + brand + "  (" + shop.numBrands.get(i) + ")" + "</label>");
                                            }
                                        %>
                                    </div>

                                </div>
                            </section>	
                            <section  class="col-md-6 login-right">
                                <input type="submit" value ="Search Product">
                            </section>			   
                        </div>
                    </form>



                </div>
            </div>
        </div>
        <!---->
    </div>
    <jsp:include page = "footer.jsp"></jsp:include>

</body>
</html>