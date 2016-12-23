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
            <%
                account.customer.refresh();
                String name = account.customer.getName();
                String email = account.customer.getEmail();
                String password = account.customer.getPassword();
                String address = account.customer.getAddress();
                String phone = account.customer.getPhoneNumber();
            %>


            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
            });

            function validateForm() {
                var n = document.forms["edit"]["Name"].value;
                var p = document.forms["edit"]["Password"].value;
                var a = document.forms["edit"]["Address"].value;
                var pn = document.forms["edit"]["Phone Number"].value;
                if (n == "<%=name%>" && p == "<%=password%>" && a == "<%=address%>" && pn == "<%=phone%>") {
                    alert("Nothing to edit! Please edit something if you want to change your infor!");
                    return false;
                } else if (n === null || n === "") {
                    alert("Please input Full Name");
                    return false;
                } else if (p === null || p === "") {
                    alert("Please input Password");
                    return false;
                } else if (a === null || a === "") {
                    alert("Please input Address");
                    return false;
                } else if (pn === null || pn === "") {
                    alert("Please input Phone Number");
                    return false;
                }
            }
        </script>



    </head>
    <body>
        <jsp:include page = "header.jsp"></jsp:include>
            <div class="content">
                <!-- registration -->
                <div class="main-1">
                    <div class="container">
                        <div class="register">
                            <form name="edit" id="formEdit" method="post" action="CustomerEdit"  onsubmit="return validateForm()" >
                                <div class="register-top-grid">
                                    <h3>Your Account</h3>
                                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                                        <span>Email Address<label>*</label></span>
                                        <input type="email" name="Email" value="<%=email%>" placeholder="Enter your email*" readonly> 
                                </div>
                                <div class="wow fadeInRight" data-wow-delay="0.4s">
                                    <span>Bank Account Number<label>*</label></span>
                                    <input type="text" name="Bank Number" value="<%=account.customer.getBankAccount().getBankNumber()%>" readonly> 
                                </div>
                                <div class="wow fadeInLeft" data-wow-delay="0.4s">
                                    <span>Full Name<label>*</label></span>
                                    <input type="text" name="Name" value="<%=account.customer.getName()%>" placeholder="Enter your full name*"> 
                                </div>
                                <div class="wow fadeInRight" data-wow-delay="0.4s">
                                    <span>Bank Name<label>*<label></span>
                                                <input type="text" name="Bank Name" value="<%=account.customer.getBankAccount().getBankName()%>" readonly> 
                                                </div>
                                                <div class="wow fadeInLeft" data-wow-delay="0.4s">
                                                    <span>Password<label>*</label></span>
                                                    <input type="text" name="Password" value="<%=account.customer.getPassword()%>"  placeholder="Enter your password*">
                                                </div>
                                                <div class="wow fadeInRight" data-wow-delay="0.4s">
                                                    <span>Account Balance<label>*</label></span>
                                                    <input type="text" name="Balance" value="$<%=account.customer.getBankAccount().getAccountBalance()%>.00"  readonly>
                                                </div>
                                                <div class="wow fadeInRight" data-wow-delay="0.4s">
                                                    <span>Address<label>*</label></span>
                                                    <input type="text" name="Address" value="<%=account.customer.getAddress()%>" placeholder="Enter your address*"> 
                                                </div>
                                                <div class="wow fadeInRight" data-wow-delay="0.4s">
                                                    <span>Phone Number<label>*</label></span>
                                                    <input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57'  name="Phone Number" value="<%=account.customer.getPhoneNumber()%>" placeholder="Enter your phone number*"> 
                                                </div>
                                                </div>
                                                </form>
                                                <div class="clearfix"> </div>
                                                <div class="register-but">
                                                    <form>
                                                        <input type="submit" value="edit information" form="formEdit">
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