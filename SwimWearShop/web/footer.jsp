<%-- 
    Document   : footer
    Created on : Sep 29, 2016, 2:16:54 PM
    Author     : Cuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="account"
             scope="application"
             class="model.MyStaticVariable"/>

<!DOCTYPE html>
<html>
    <head>  </head>
    <body>
        <!--footer-->
        <div class="footer-section">
            <div class="container">
                <div class="footer-grids" id="foot">
                    <div class="col-md-2 footer-grid">
                        <h4>account</h4>
                        <ul>
                            <%
                                if (account.customer == null) {
                                    out.println("<li><a href=\"login.jsp\">Login</a></li>");
                                    out.println("<li><a href=\"register.jsp\">New Account</a></li>");
                                } else {
                                    out.println("<li><a href=\"account.jsp\">Your Account</a></li>");
                                    out.println("<li><a href=\"checkout.jsp\">Your Cart</a></li>");
                                    out.println("<li><a href=\"transaction.jsp\">Transactions</a></li>");
                                    out.println("<li><a href=\"CustomerLogOut\">Log out</a></li>");
                                }
                            %>
                        </ul>
                    </div>
                    <div class="col-md-2 footer-grid">
                        <h4>company</h4>
                        <ul>
                            <li><a href="index.jsp">Home Page</a></li>
                            <li><a href="category.jsp">Products</a></li>
                            <li><a href="contact.jsp">Work Here</a></li>
                            <li><a href="contact.jsp">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="col-md-2 footer-grid">
                        <h4>service</h4>
                        <ul>
                            <li><a href="support.jsp">Support</a></li>
                            <li><a href="support.jsp">FAQ</a></li>
                            <li><a href="support.jsp">Team</a></li>
                            <li><a href="support.jsp">Help</a></li>
                        </ul>
                    </div>
                    <div class="col-md-2 footer-grid">
                        <h4>order & returns</h4>
                        <%if (account.customer == null) {%>
                        <ul>
                            <li><a href="#foot" onclick="loginFirst()">Order Now</a></li>
                            <li><a href="#foot" onclick="loginFirst()">Order Status</a></li>
                            <li><a href="#foot" onclick="loginFirst()">Return Order</a></li>
                            <li><a href="#foot" onclick="loginFirst()">Pay Now</a></li>
                            <script>
                                function loginFirst() {
                                    if (<%=account.customer%> === null || <%=account.customer%> === "") {
                                        alert("Please login first!");
                                    }
                                }
                            </script>
                        </ul>
                        <%} else {%>
                        <ul>
                            <li><a href="category.jsp">Order Now</a></li>
                            <li><a href="checkout.jsp">Order Status</a></li>
                            <li><a href="EmptyCart">Return Order</a></li>
                            <li><a href="Payment">Pay Now</a></li>
                        </ul>
                        <%}%>
                    </div>

                    <div class="col-md-4 footer-grid1">
                        <p>FOLLOW US</p>
                        <div class="social-icons">
                            <a href="https://www.instagram.com"><i class="icon"></i></a>
                            <a href="https://www.facebook.com/cuongvipvd"><i class="icon1"></i></a>
                            <a href="https://twitter.com"><i class="icon2"></i></a>
                            <a href="https://vimeo.com"><i class="icon3"></i></a>
                            <a href="https://www.icloud.com"><i class="icon4"></i></a>
                        </div>
                        <p>Copyright &copy; 2016 Swim Wear. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--footer-->
    </body>
</html>
