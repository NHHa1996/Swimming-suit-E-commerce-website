<%-- 
    Document   : categories
    Created on : Sep 28, 2016, 7:40:40 PM
    Author     : Cuong
--%>

<%@page import="model.shop.Category"%>
<%@page import="model.shop.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MyStaticVariable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Swim Wear a E-Commerce online Shopping - Admin</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>
    </head>
    <body> 
        <div id="panelwrap">

            <jsp:include page ="header.jsp"></jsp:include>          

                <div class="center_content">  

                    <div id="right_wrap">
                        <div id="right_content">
                        <%
                            ArrayList<Category> dadCategories = MyStaticVariable.categoryDAO.getListDadCategory();
                            ArrayList<Category> categories = MyStaticVariable.categoryDAO.getListProductCategory();
                            for (int j = 0; j < categories.size(); j++) {%>
                        <h2>Category <%=j + 1%>: <%=categories.get(j).getCateName()%></h2> 
                        <table id="rounded-corner">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Product</th>
                                    <th>Category</th>
                                    <th>Details</th>
                                    <th>Original Price</th>
                                    <th>Discount</th>
                                    <th>Sale Price</th>
                                    <th>Image</th>
                                    <th>Type</th>
                                    <th>Brand</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="12">Please check it carefully.</td>
                                </tr>
                            </tfoot>
                            <tbody>

                                <%
                                    ArrayList<Product> products = MyStaticVariable.productDAO.getListProductByCategory(categories.get(j).getCateID());
                                    for (int i = 0; i < products.size(); i++) {
                                        Product p = products.get(i);
                                        String detail = p.getDetail();
                                        if (detail == null || detail.equals("")) {
                                            detail = "No details";
                                        }
                                        if (i % 2 != 0) {
                                %>
                                <tr class="odd">
                                    <%} else {%>
                                <tr class="even">
                                    <%}%>
                                    <td><input type="checkbox" name="" /></td>
                                    <td><%=p.getProName()%></td>
                                    <td><%=p.getCategory()%></td>
                                    <td><%=detail%></td>
                                    <td>$<%=p.getPrice()%></td>
                                    <td><%=p.getDiscount()%>%</td>
                                    <td>$<%=p.getFinalPrice()%></td>
                                    <td><%=p.getImage()%></td>
                                    <td><%=p.getType()%></td>
                                    <td><%=p.getBrand()%></td>
                                    <td><a href="/SwimWearShop/Admin/manage.jsp?proID=<%=p.getProID()%>"><img src="images/edit.png" alt="" title="" border="0" /></a></td>
                                    <td><a href="#"><img src="images/trash.gif" alt="" title="" border="0" /></a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>                        
                        <div class="form_sub_buttons">
                            <a href="#" class="button green">Select all</a>
                            <a href="#" class="button red">Delete selected</a>
                        </div>
                        <%}%>

                    </div>
                </div>

                <jsp:include page = "sidebar.jsp"></jsp:include> 
                    <div class="clear"></div>
                </div> <!--end of center_content-->

            <jsp:include page = "footer.jsp"></jsp:include> 
        </div> 
    </body>
</html>
