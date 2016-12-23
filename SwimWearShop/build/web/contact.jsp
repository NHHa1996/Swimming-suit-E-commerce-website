<%-- 
    Document   : contact
    Created on : Sep 29, 2016, 1:31:59 PM
    Author     : Cuong
--%>

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
                var n = document.forms["message"]["name"].value;
                var e = document.forms["message"]["emailaddress"].value;
                var m = document.forms["message"]["message"].value;
                if (n == null || n == "" || e == null || e == "" || m == null || m == "") {
                    alert("Please input enough information toyour form!");
                    return false;
                } else
                    alert("Thank you for your report!");
            }
        </script>



    </head>
    <body>
        <jsp:include page = "header.jsp"></jsp:include>
            <div class="content">
                <!--start-contact-->
                <!--contact-->
                <div class="content">
                    <div class="contact">
                        <div class="container">
                            <h2>work here - contact us</h2>
                            <div class="google-map">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d424396.3176723366!2d150.92243255000002!3d-33.7969235!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b129838f39a743f%3A0x3017d681632a850!2sSydney+NSW%2C+Australia!5e0!3m2!1sen!2sin!4v1431587453420"></iframe>
                            </div>
                            <div class="contact-grids">
                                <div class="col-md-6 contact-left">
                                    <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below 
                                        for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum
                                        et Malorum" by Cicero are also reproduced in their exact original form, 
                                        accompanied by English versions from the 1914 translation by H. Rackham.</p>
                                    <address>
                                        <p>The Company Name 404</p>
                                        <p>7899 St Vincent Place,</p>
                                        <p>Glasgow,Le 99 Pr 45.</p>
                                        <p>Telephone : +1 800 603 6035</p>
                                        <p>FAX : +1 800 889 9898</p>
                                        <p>E-mail : <a href="mailto:example@mail.com">swimwearshop@gmail.com</a></p>
                                    </address>
                                    
                                    <address>
                                        <p>Team Member</p>
                                        <p>Đỗ Hùng Cường - ITITIU13170</p>
                                        <p>Telephone : 0908998923</p>
                                        <p>E-mail : <a href="mailto:cuongvip1295@gmail.com">cuongvip1295@gmail.com</a></p>
                                    </address>
                                </div>
                                <div class="col-md-6 contact-right" id="support" >
                                    <form  method="get" name="message" onsubmit="return validateForm()">
                                        <h5>name</h5>
                                        <input type="text" name="name">
                                        <h5>emailaddress</h5>
                                        <input type="text" name="emailaddress">
                                        <h5>message</h5>
                                        <textarea name="message"></textarea>
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