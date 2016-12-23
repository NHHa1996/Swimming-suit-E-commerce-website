<%-- 
    Document   : login
    Created on : Sep 29, 2016, 2:37:32 PM
    Author     : Cuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="account"
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
        <script src="js/imagezoom.js"></script>

        <!-- FlexSlider -->
        <script defer src="js/jquery.flexslider.js"></script>
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

        <script>
// Can also be used with $(document).ready()

            function validateForm() {
                var e = document.forms["login"]["EmailInput"].value;
                var p = document.forms["login"]["PasswordInput"].value;
                if (e == null || e == "" || p == null || p == "") {
                    alert("Please input your email and password!");
                    return false;
                }
            }

            function forgetPassword() {
//                var e = document.forms["login"]["EmailInput"].value;
//                if (e == null || e == "") {
//                    alert("Please input your email!");
//                } else {
//                    alert('If email "' + e + '" is registered. The password will be sent to your email in about 2 minutes');
//                }
                do{
                    var e = prompt("Please enter your email", "");
                    var atpos = e.indexOf("@");
                    var dotpos = e.lastIndexOf(".");
                    if(atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= e.length)
                        alert("Please input valid email, ex: email@xxx.xx");
                } while (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= e.length);
                alert('If email "' + e + '" is registered. The password will be sent to your email in about 2 minutes');
                window.location.href = 'EmailServlet?email='+e;

            }

            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
            });
        </script>



    </head>
    <body>
        <%if (account.customer != null) {
                response.sendRedirect("index.jsp");
            }%>
        <jsp:include page = "header.jsp"></jsp:include>

            <!--contact-->
            <div class="content">
                <div class="main-1">
                    <div class="container">
                        <div class="login-page">
                            <div class="account_grid">
                                <div class="col-md-6 login-left">
                                    <h3>NEW CUSTOMERS</h3>
                                    <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                                    <a class="acount-btn" href="register.jsp">Create an Account</a>
                                </div>
                                <div class="col-md-6 login-right">
                                    <h3>REGISTERED CUSTOMERS</h3>
                                    <p>If you have an account with us, please log in.</p>
                                    <form action="CustomerLogin" method="post" name="login" onsubmit="return validateForm()" >
                                        <div>
                                            <span>Email Address<label>*</label></span>
                                            <input type="email" name="EmailInput" placeholder="Enter your email*"> 
                                        </div>
                                        <div>
                                            <span>Password<label>*</label></span>
                                            <input type="password" name="PasswordInput" placeholder="Enter your password*"> 
                                        </div>
                                        <a class="forgot"  onclick="forgetPassword()">Forgot Your Password?</a>
                                        <input type="submit" value="Login">
                                    </form>
                                </div>	
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- login -->
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
