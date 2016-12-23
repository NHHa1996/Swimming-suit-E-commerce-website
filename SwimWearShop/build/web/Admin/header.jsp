<%-- 
    Document   : header
    Created on : Oct 23, 2016, 5:03:23 PM
    Author     : Cuong
--%>

<%@page import="model.user.Admin"%>
<%@page import="model.MyStaticVariable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style> .header_right a.settings{ background:url(images/settings.png) no-repeat left; padding:0 0 0 22px;}
            .header_right a.logout{background:url(images/logout.png) no-repeat left; padding:0 0 0 22px;} </style>
    </head>
    <body>
        <%
            String adEmail = session.getAttribute("adEmail").toString();
            String adPassword = session.getAttribute("adPassword").toString();
            
            if (new Admin().login(adEmail, adPassword)) {
                MyStaticVariable.admin = MyStaticVariable.userDAO.getAdminFromDB(adEmail);
                MyStaticVariable.adminIsValid = true;
            } else MyStaticVariable.admin = null;
        %>
        
        
        
        <div class="header">
            <div class="title"><a href="#">SwimWear Admin</a></div>
            <div class="header_right">Welcome <%=MyStaticVariable.admin.getName()%>, <a href="/SwimWearShop/Admin/settings.jsp" class="settings">Settings</a> <a href="/SwimWearShop/AdminLogout" class="logout">Logout</a> </div>
            <div class="menu">
                <ul>
                    <li><a href="#" class="selected">Profile</a></li>
                    <li><a href="#">Management</a></li>
                </ul>
            </div>

        </div>

        <div class="submenu">
            <ul>
                <li><a href="/SwimWearShop/Admin/index.jsp" class="selected">home</a></li>
                <li><a href="/SwimWearShop/Admin/settings.jsp">settings</a></li>
            </ul>
        </div>   
    </body>
</html>
