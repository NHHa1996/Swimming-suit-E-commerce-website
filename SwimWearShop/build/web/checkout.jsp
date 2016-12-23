<%-- 
    Document   : checkout
    Created on : Sep 29, 2016, 1:31:59 PM
    Author     : Cuong
--%>

<%@page import="model.shop.Product"%>
<%@page import="model.shop.Ordered"%>
<%@page import="model.shop.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="shopping"
             scope="application"
             class="model.MyStaticVariable"/>

<!DOCTYPE HTML>
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
        <script src="js/imagezoom.js"></script>

        <!-- FlexSlider -->
        <script defer src="js/jquery.flexslider.js"></script>
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

        <script>
// Can also be used with $(document).ready()
            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
            });
        </script>



    </head>
    <body>
        <jsp:include page = "header.jsp"></jsp:include>
            <!-- checkout -->
            <div class="content">
                <div class="cart-items">
                    <div class="container">
                    <% 
                        ArrayList<Ordered> list = shopping.cart.getListOrdered();
                    %>
                    <h2>Your Shopping Bag <br/>(Number of product: <%=shopping.cart.getNumProduct()%>)</h2>
                        <%for (int i = 0; i < list.size(); i++) {
                                Product product = list.get(i).getProduct();%>
                    <div class="cart-header">
                        <div class="close1" onclick="location.href = 'RemoveFromCart?proID=<%=product.getProID()%>'">  </div>
                        <div class="cart-sec simpleCart_shelfItem">
                            <div class="cart-item cyc">
                                <a href="single.jsp?proID=<%=product.getProID()%>"><img src="images/product/side 1/<%=product.getImage()%>" class="img-responsive" alt=""></a>
                            </div>
                            <div class="cart-item-info">
                                <h3><a href="single.jsp?proID=<%=product.getProID()%>"> <%=list.get(i).getProduct().getProName()%> </a>
                                    <span>Brand: <%=product.getBrand()%></span>
                                    <span>Type: <%=product.getType()%></span>
                                    <span>Quantity: <%=list.get(i).getQuantity()%></span>
                                </h3>
                                <ul class="qty">
                                    <li><p>FREE delivery</p></li>
                                </ul>
                                <div class="delivery">
                                    <p>Service Charges : $<%=product.getFinalPrice() * list.get(i).getQuantity()%>.00</p>
                                    <span>Delivered in 1-1:30 hours</span>
                                    <div class="clearfix"></div>
                                </div>	
                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </div>
                    <%}%>
                    <section  class="col-md-6 login-right">
                        <form action="Payment"  method="get">
                            <div class="delivery">
                                <p>Payment on account, your bank account balance will be deducted!</p>
                                <p><input type="submit" value ="Pay by bank account balance"></p>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </section>	
                </div>
            </div>
            <!-- checkout -->	
            <div class="subscribe">
                <div class="container">
                    <div class="subscribe1">
                        <h4>the latest from swim wear</h4>
                    </div>
                    <div class="subscribe2">
                        <form action="https://mail.google.com/mail/u/0/#inbox">
                            <input type="text" class="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Email';
                                    }">
                            <input type="submit" value="JOIN">
                        </form>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <jsp:include page = "footer.jsp"></jsp:include>

    </body>
</html>