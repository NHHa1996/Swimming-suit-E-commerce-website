<%-- 
    Document   : index
    Created on : Sep 29, 2016, 1:31:59 PM
    Author     : Cuong
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
    </head>
    <body>
        <jsp:include page = "header.jsp"></jsp:include>

            <div class="banner-section">
                <div class="container">
                    <div class="banner-grids">
                        <div class="col-md-6 banner-grid">
                            <h2>the latest collections</h2>
                            <p>Swimwear trends for 2016 that is! The ladies are looking for a new bikini or one piece at the moment so it was time to share some trends in new swimwear collections, on the beach and of course Swim Wear Shopping.</p>
                            <a href="category.jsp" class="button"> shop now </a>
                        </div>
                        <div class="col-md-6 banner-grid1">
                            <img src="images/p2.png" class="img-responsive" alt=""/>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="banner-bottom">
                <div class="gallery-cursual">
                    <!--requried-jsfiles-for owl-->
                    <script src="js/owl.carousel.js"></script>
                    <script>
                        $(document).ready(function () {
                            $("#owl-demo").owlCarousel({
                                items: 3,
                                lazyLoad: true,
                                autoPlay: true,
                                pagination: false,
                            });
                        });
                    </script>
                    <!--requried-jsfiles-for owl -->
                    <!--start content-slider-->
                    <div id="owl-demo" class="owl-carousel text-center">
                    <%for (int i = 0; i < 8; i++) {%>
                    <div class="item">
                        <img class="lazyOwl" data-src="images/b<%=i+1%>.jpg" alt="name">
                        <div class="item-info">
                            <h5>Having a good summer!</h5>
                        </div>
                    </div>
                    <%}%>
                </div>
                <!--sreen-gallery-cursual-->
            </div>
        </div>
        <div class="gallery">
            <div class="container">
                <h3>Featured products</h3>
                <div class="gallery-grids">

                    <%
                        for (int i = 0; i < 8; i++) {%>
                    <div class="col-md-3 gallery-grid ">
                        <a href="single.jsp?proID=<%=shop.fullproducts.get(i).getProID()%>"><img src="images/product/side 1/<%=shop.fullproducts.get(i).getImage()%>" class="img-responsive" alt="" style="width: 267px ;height: 340px"/>
                            <div class="gallery-info">
                                <div class="quick">
                                    <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                                </div>
                            </div></a>
                        <div class="galy-info">
                            <p><%=shop.fullproducts.get(i).getProName()%></p>
                            <div class="galry">
                                <div class="prices">
                                    <h5 class="item_price">$<%=shop.fullproducts.get(i).getFinalPrice()%>.00</h5>
                                </div>
                                <div class="rating">
                                    <span>☆</span>
                                    <span>☆</span>
                                    <span>☆</span>
                                    <span>☆</span>
                                    <span>☆</span>
                                </div>

                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
</div>
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

<jsp:include page = "footer.jsp"></jsp:include>
</body>
</html>
