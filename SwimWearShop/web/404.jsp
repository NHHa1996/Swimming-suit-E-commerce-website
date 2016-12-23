<%-- 
    Document   : 404
    Created on : Sep 29, 2016, 1:31:59 PM
    Author     : Cuong
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="webcontent"
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
<!--        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();
            });</script>-->
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
            
            function validateForm() {
                var p = document.forms["problem"]["problem"].value;
                var e = document.forms["problem"]["email"].value;
                var t = document.forms["problem"]["text"].value;
                if (e == null || e == "" || p == null || p == "" || t == null || t == "") {
                    alert("Please input enough information about your problem!");
                    return false;
                } else
                    alert("Thank you for your report, we will try to solve your problem!");
            }
        </script>



    </head>
    <body>
        <%
            String title = webcontent.title404;
            String problem = webcontent.problem;
            String detail = webcontent.detail; 
            if (problem == null) {
                title = "404 error - Page not found";
                problem = "404 error";
                detail = "page not pound";
            }
        %>
        <jsp:include page = "header.jsp"></jsp:include>
            <div class="content">
                <!--start-contact-->
                <!--contact-->
                <div class="content">
                    <div class="contact">
                        <div class="container">
                            <h2><%=title%></h2>
                            <div class="google-map">
                            <%=problem%>
                        </div>
                        <div class="contact-grids">
                            <div class="col-md-6 contact-left">
                                <p><%=detail%></p>
                            </div>
                            <div class="col-md-6 contact-right">
                                <form  method="get" name="problem" onsubmit="return validateForm()">
                                    <h5>Your problem</h5>
                                    <input type="text" name="problem">
                                    <h5>email address</h5>
                                    <input type="text" name="email">
                                    <h5>Write an email for us</h5>
                                    <textarea name="text"></textarea>
                                    <input type="submit" value="send">
                                </form>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page = "footer.jsp"></jsp:include>

    </body>
</html>