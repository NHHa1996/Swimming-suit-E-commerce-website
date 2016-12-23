<%-- 
    Document   : account
    Created on : Sep 29, 2016, 1:31:59 PM
    Author     : Cuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="account"
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

            function validateForm() {
                var n = document.forms["reg"]["Register Name"].value;
                var bnum = document.forms["reg"]["Register Bank Number"].value;
                var e = document.forms["reg"]["Register Email Address"].value;
                var bname = document.forms["reg"]["Bank Name"].value;
                var a = document.forms["reg"]["Register Address"].value;
                var pn = document.forms["reg"]["Register Phone Number"].value;
                var p = document.forms["reg"]["Register Password"].value;
                var c = document.forms["reg"]["Confirm Password"].value;
                if (e === null || e === "") {
                    alert("Please input your email!");
                    return false;
                } else if (bnum === null || bnum === "") {
                    alert("Please input your your Bank Number!");
                    return false;
                } else if (n === null || n === "") {
                    alert("Please input your full name!");
                    return false;
                } else if (bname === null || bname === "") {
                    alert("Please input your Bank name!");
                    return false;
                } else if (pn === null || pn === "") {
                    alert("Please input your phone number!");
                    return false;
                } else if (a === null || a === "") {
                    alert("Please input your address!");
                    return false;
                } else if (p === null || p === "") {
                    alert("Please input your password!");
                    return false;
                } else if (p !== c) {
                    alert("Password do not match!");
                    return false;
                }
            }
        </script>



    </head>
    <body>
        <%if (account.customer != null) {
                throw new Exception("You had login to the system");
            }%>
        <jsp:include page = "header.jsp"></jsp:include>
            <div class="content">
                <!-- registration -->
                <div class="main-1">
                    <div class="container">
                        <div class="register">
                            <form name="reg" id="formReg" method="post" action="CustomerRegister"  onsubmit="return validateForm()">
                                <div class="register-top-grid">
                                    <h3>PERSONAL INFORMATION</h3>
                                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                                        <span>Your Name<label>*</label></span>
                                        <input type="text" name="Register Name" placeholder="Enter your full name*">
                                    </div>
                                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                                        <span>Your Bank Number<label>*</label></span>
                                        <input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="Register Bank Number" placeholder="Enter your bank number*"> 
                                    </div>
                                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                                        <span>Email Address<label>*</label></span>
                                        <input type="email" name="Register Email Address" placeholder="Enter your email*"> 
                                    </div>
                                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                                        <span>Bank Name<label>*<label></span>
                                                    <input type="text" name="Bank Name" placeholder="Enter your bank name*"> 
                                                    </div>
                                                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                                                        <span>Your Address<label>*</label></span>
                                                        <input type="text" name="Register Address" placeholder="Enter your address*"> 
                                                    </div>
                                                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                                                        <span>Phone Number<label>*</label></span>
                                                        <input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="Register Phone Number" placeholder="Enter your phone number*"> 
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                    <a class="news-letter" href="#">
                                                        <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Sign Up for Newsletter</label>
                                                    </a>
                                                    </div>
                                                    <div class="register-bottom-grid">
                                                        <h3>LOGIN INFORMATION</h3>
                                                        <div class="wow fadeInLeft" data-wow-delay="0.4s">
                                                            <span>Password<label>*</label></span>
                                                            <input type="password" name="Register Password"  placeholder="Enter your password*">
                                                        </div>
                                                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                                                            <span>Confirm Password<label>*</label></span>
                                                            <input type="password" name="Confirm Password" placeholder="Confirm your password*">
                                                        </div>
                                                    </div>
                                                    </form>
                                                    <div class="clearfix"> </div>
                                                    <div class="register-but">
                                                        <form>
                                                            <input type="submit" value="submit" form="formReg">
                                                            <div class="clearfix"> </div>
                                                        </form>
                                                    </div>
                                                    </div>
                                                    </div>
                                                    </div>
                                                    <!-- registration -->

                                                    <div class="subscribe">
                                                        <div class="container">
                                                            <div class="subscribe1">
                                                                <h4>the latest from swim wear</h4>
                                                            </div>
                                                            <div class="subscribe2">
                                                                <form action="https://mail.google.com/mail/u/0/#inbox" method="post">
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