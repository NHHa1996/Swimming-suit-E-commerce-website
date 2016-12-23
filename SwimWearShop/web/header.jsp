<%-- 
    Document   : header
    Created on : Sep 29, 2016, 2:16:27 PM
    Author     : Cuong
--%>

<jsp:useBean id="account"
             scope="application"
             class="model.MyStaticVariable"/>

<jsp:useBean id="customer"
             scope="session"
             class="model.user.Customer"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String email = "";
        String password = "";

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("email")) {
                    email = cookies[i].getValue();
                }
                if (cookies[i].getName().equals("password")) {
                    String cPassword = cookies[i].getValue();
                    if (cPassword == null || cPassword.equals("")) {
                        password = "";
                    } else {
                        try {
                            password = account.aes.decrypt(cPassword);
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {

                        }
                    }
                }
            }
        }
        if (email == null || password == null) {
            account.customer = null;
        } else if (customer.login(email, password)) {
            customer.accessSystem(email);
        } else {
            account.customer = null;
        }
    %>


    <head> </head>
    <body>

        <!--header-->
        <div class="header">
            <div class="header-top">
                <div class="container">
                    <div class="lang_list">
                        <select tabindex="4" class="dropdown1">
                            <option value="" class="label" value="">En</option>
                            <option value="1">English</option>
                        </select>
                    </div>
                    <div class="top-right">
                        <ul>
                            <%if (account.customer == null) {
                                    out.println("<li class=\"text\"><a href=\"login.jsp\">login</a></li>");
                                } else {
                                    out.println("<li class=\"text\"><a href=\"account.jsp\">" + account.customer.getName() + "</a></li>");
                                    out.println("<li class=\"text\"><a href=\"CustomerLogOut\">log out</a></li>");
                            %>
                            <li><div class="cart box_1">
                                    <a href="checkout.jsp">
                                        <span class="simpleCart_total"> $<%=account.cart.getCartCost()%>.00 </span> (<span id="simpleCart_quantity" class="simpleCart_quantity"> <%=account.cart.getNumProduct()%> </span>)
                                    </a>	
                                    <p><a href="EmptyCart" class="simpleCart_empty">Empty cart</a></p>
                                    <div class="clearfix"> </div>
                                </div>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="header-bottom">
                <div class="container">
                    <!--/.content-->
                    <div class="content white">
                        <nav class="navbar navbar-default" role="navigation">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <h1 class="navbar-brand"><a  href="index.jsp">swim wear</a></h1>
                            </div>
                            <!--/.navbar-header-->

                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Menu <b class="caret"></b></a>
                                        <ul class="dropdown-menu multi-column columns-3">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <ul class="multi-column-dropdown">
                                                        <%if (account.customer == null) {%>
                                                        <li><a class="list" href="login.jsp">ACCOUNT</a></li>
                                                        <li><a class="list1" href="login.jsp">Login</a></li>
                                                        <li><a class="list1" href="register.jsp">New Account</a></li>
                                                            <%} else {%>
                                                        <li><a class="list" href="account.jsp">ACCOUNT</a></li>
                                                        <li><a class="list1" href="account.jsp">User Account</a></li>
                                                        <li><a class="list1" href="CustomerLogOut">Log out</a></li>
                                                            <%}%>
                                                    </ul>
                                                </div>
                                                <div class="col-sm-4">
                                                    <ul class="multi-column-dropdown">
                                                        <li><a class="list" href="category.jsp">PURCHASE</a></li>
                                                        <li><a class="list1" href="category.jsp">Products</a></li>
                                                            <%if (account.customer == null) {%>
                                                        <li><a class="list1" href="#"  onclick="loginFirst()">Transactions</a></li>

                                                        <script>
                                                            function loginFirst() {
                                                                if (<%=account.customer%> === null || <%=account.customer%> === "") {
                                                                    alert("Please login first!");
                                                                }
                                                            }
                                                        </script>
                                                        
                                                        <%} else {%>
                                                        <li><a class="list1" href="transaction.jsp">Transactions</a></li>
                                                            <%}%>
                                                    </ul>
                                                </div>
                                                <div class="col-sm-4">
                                                    <ul class="multi-column-dropdown">
                                                        <li><a class="list" href="contact.jsp">SERVICE</a></li>
                                                        <li><a class="list1" href="contact.jsp">Contact</a></li>
                                                        <li><a class="list1" href="support.jsp">Support</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </ul>
                                    </li>

                                </ul>
                            </div>
                            <!--/.navbar-collapse-->
                        </nav>
                        <!--/.navbar-->
                    </div>
                    <div class="search-box">
                        <div id="sb-search" class="sb-search">
                            <form action="SearchByTool" method="get">
                                <input class="sb-search-input" placeholder="Enter your search term..." type="search" name="search" id="search">
                                <input class="sb-search-submit" type="submit" value="">
                                <span class="sb-icon-search"> </span>
                            </form>
                        </div>
                    </div>

                    <!-- search-scripts -->
                    <script src="js/classie.js"></script>
                    <script src="js/uisearch.js"></script>
                    <script>
                                                            new UISearch(document.getElementById('sb-search'));
                    </script>
                    <!-- //search-scripts -->
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--header-->
    </body>
</html>
