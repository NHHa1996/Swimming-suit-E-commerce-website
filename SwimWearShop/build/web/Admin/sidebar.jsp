<%-- 
    Document   : sidebar
    Created on : Oct 23, 2016, 5:15:39 PM
    Author     : Cuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <div class="sidebar" id="sidebar">
            <h2>Profile</h2>

            <ul>
                <li><a href="/SwimWearShop/Admin/index.jsp" class="selected">Home</a></li>
                <li><a href="/SwimWearShop/Admin/settings.jsp">Settings</a></li>
<!--                <li><a href="#">Clients</a></li>-->
            </ul>

            <h2>Management</h2>

            <ul>
                <li><a href="/SwimWearShop/Admin/customers.jsp">Customers</a></li>
<!--                <li><a href="/SwimWearShop/Admin/categories.jsp">Categories</a></li>-->
                <li><a href="/SwimWearShop/Admin/products.jsp">Products</a></li>
            </ul>

            <h2>Swim-Wear admin rule</h2> 
            <div class="sidebar_section_text">
                Administrators are not allowed to edit any information without the requirement of manager.
            </div>         
        </div> 
    </body>
</html>
