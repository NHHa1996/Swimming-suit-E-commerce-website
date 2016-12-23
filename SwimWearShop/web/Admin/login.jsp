<%-- 
    Document   : login
    Created on : Oct 23, 2016, 1:07:36 PM
    Author     : Cuong
--%>

<%@page import="model.user.Admin"%>
<%@page import="model.MyStaticVariable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% try {%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Swim Wear a E-Commerce online Shopping - Admin</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>
        <script>
            function validateForm() {
                var e = document.forms["login"]["adEmail"].value;
                var p = document.forms["login"]["adPassword"].value;
                if (e == null || e == "" || p == null || p == "") {
                    alert("Please input your email and password!");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <%
            String adEmail = "";
            String adPassword = "";
            if (session.getAttribute("adEmail") != null) {
                adEmail = session.getAttribute("adEmail").toString();
                if (session.getAttribute("adPassword") != null) {
                    adPassword = session.getAttribute("adPassword").toString();
                }
                if (new Admin().login(adEmail, adPassword)) {
                    MyStaticVariable.admin = MyStaticVariable.userDAO.getAdminFromDB(adEmail);
                    MyStaticVariable.adminIsValid = true;

                } else {
                    MyStaticVariable.admin = null;
                }
            } else {
                MyStaticVariable.admin = null;
            }

        %>
        <div id="loginpanelwrap">

            <div class="loginheader">
                <div class="logintitle"><a href="#">SwimWear Admin</a></div>
            </div>
            <div class="loginform">
                <form action="/SwimWearShop/AdminLogin" method="post" name="login" onsubmit="return validateForm()" >
                    <div class="loginform_row">
                        <label>&nbsp&nbsp&nbsp&nbspEmail:</label>
                        <input type="text" class="loginform_input" placeholder="Please enter email*" value="<%=adEmail%>" name="adEmail" />
                    </div>
                    <div class="loginform_row">
                        <label>Password:</label>
                        <input type="password" class="loginform_input" placeholder="Please enter password*" value="<%=adPassword%>"  name="adPassword" />
                    </div><% String check = "";
                        if (MyStaticVariable.admin != null) {
                            response.sendRedirect("/SwimWearShop/Admin/index.jsp");
                        }
                        if (MyStaticVariable.adminIsValid == false) {
                            check = "Invalid email or password";
                            out.println("<p style=\"color:red\">" + check + "</p>");
                            MyStaticVariable.adminIsValid = true;
                        }%>
                    <div class="loginform_row">
                        <input type="submit" class="loginform_submit" value="Login" />
                    </div> 
                    <div class="clear"></div>
                </form>
            </div>
        </div>
    </body>
</html>
<%} catch(Exception e) {}%>
