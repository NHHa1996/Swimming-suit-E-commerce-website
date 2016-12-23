<%-- 
    Document   : single
    Created on : Sep 29, 2016, 1:31:59 PM
    Author     : Cuong
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.shop.Product"%>
<%@page import="model.MyStaticVariable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <style>
            h3 {
                text-transform: uppercase;
            }
        </style>

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
            <div class="content">
                <div class="single">
                    <div class="container">
                        <div class="single-grids">
                            <div class="col-md-4 single-grid1">
                                <h2>Product Information</h2>
                                <ul>
                                <%
                                    int proID = Integer.parseInt(request.getParameter("proID"));
                                    Product product = MyStaticVariable.productDAO.getProductByID(proID);
                                    String name = product.getProName();
                                    String category = product.getCategory().getCateName();
                                    String type = product.getType();
                                    String brand = product.getBrand();
                                    String detail = product.getDetail();
                                    if (detail == null || detail.equals(""))
                                        detail = "No detail for this product";
                                    String image = product.getImage();
                                    int originalPrice = product.getPrice();
                                    int discount = product.getDiscount();
                                    int price = product.getFinalPrice();
                                %>
                                <li><a>Product ID: <%=proID%></a></li>
                                <li><a>Name: <%=name%></a></li>
                                <li><a>Category: <%=category%></a></li>
                                <li><a>Type: <%=type%></a></li>
                                <li><a>Brand: <%=brand%></a></li>
                                <li><a>Original Price: $<%=originalPrice%>.00</a></li>
                                <li><a>Discount: <%=discount%>%</a></li>
                                <li><a>Sale Price: $<%=price%>.00</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4 single-grid">		
                            <div class="flexslider">
                                <ul class="slides">
                                    <li data-thumb="images/product/side 1/<%=image%>">
                                        <div class="thumb-image"> <img src="images/product/side 1/<%=image%>" data-imagezoom="true" class="img-responsive"> </div>
                                    </li>
                                    <li data-thumb="images/product/side 2/<%=image%>">
                                        <div class="thumb-image"> <img src="images/product/side 2/<%=image%>" data-imagezoom="true" class="img-responsive"> </div>
                                    </li>
                                    <li data-thumb="images/product/side 3/<%=image%>">
                                        <div class="thumb-image"> <img src="images/product/side 3/<%=image%>" data-imagezoom="true" class="img-responsive"> </div>
                                    </li> 
                                </ul>
                            </div>
                        </div>	
                        <div class="col-md-4 single-grid simpleCart_shelfItem">		
                            <h3>SwimWear presents: <%=name%></h3>
                            <p>Type: <%=type%></p>
                            <p>Brand: <%=brand%></p>
                            <p><%=detail%>.</p>
                            <ul class="size">
                                <h3>Size</h3>
                                <li><a>25</a></li>
                                <li><a>26</a></li>
                                <li><a>27</a></li>
                                <li><a>28</a></li>
                                <li><a>29</a></li>
                                <li><a>30</a></li>
                            </ul>
                            <div class="galry">
                                <div class="prices">
                                    <h5 class="item_price">$<%=price%>.00</h5>
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
                            <%if (MyStaticVariable.customer != null) {%>
                            <form id="formAdd" method="get" action="AddToCart">
                                <input type="hidden" name="proID" value="<%=proID%>"/>
                                <p class="qty"> Quantity :  </p><input min="1" type="number" onkeypress='return event.charCode >= 48 && event.charCode <= 57' id="quantity" name="quantity" value="1" class="form-control input-small">
                                <div class="btn_form">
                                    <a href="#" class="add-cart item_add"  onclick="document.getElementById('formAdd').submit();">ADD TO CART</a>	
                                </div>
                            </form>
                            <%}%>
                            <div class="tag">
                                <p>Category : <a href="CategoryController?subcate=<%=type%>"> <%=type%> </a></p>
                                <p>Tag : <a href="index.jsp"> Swim Wear </a></p>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>

            <div class="related-products">
                <div class="container">
                    <h3>Related Products</h3>
                    <div class="product-model-sec single-product-grids">
                        <%ArrayList<Product> listproduct = MyStaticVariable.productDAO.getFullListProduct();
                            for (int i = 0; i < 4; i++) {
                                Product pro = listproduct.get(i);%>
                        <div class="product-grid single-product">
                            <a href="single.jsp?proID=<%=pro.getProID()%>">
                                <div class="more-product"><span> </span></div>						
                                <div class="product-img b-link-stripe b-animate-go  thickbox">
                                    <img src="images/product/side 1/<%=pro.getImage()%>" class="img-responsive" alt="" style="width: 300px ;height: 250px">
                                    <div class="b-wrapper">
                                        <h4 class="b-animate b-from-left  b-delay03">							
                                            <button> + </button>
                                        </h4>
                                    </div>
                                </div>
                            </a>					
                            <div class="product-info simpleCart_shelfItem">
                                <div class="product-info-cust prt_name">
                                    <h4><%=pro.getProName()%></h4>								
                                    <span class="item_price">$<%=pro.getFinalPrice()%>.00</span>
                                    <div class="ofr">
                                        <p class="pric1"><del>Rs $<%=pro.getPrice()%>.00</del></p>
                                        <p class="disc">[<%=pro.getDiscount()%>% Off]</p>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>												
                            </div>
                        </div>
                        <%}%>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page = "footer.jsp"></jsp:include>

    </body>
</html>