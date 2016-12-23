<%-- 
    Document   : products
    Created on : Sep 28, 2016, 7:40:40 PM
    Author     : Cuong
--%>

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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#check-all').click(function () {
                    $("input:checkbox").attr('checked', true);
                });
                $('#uncheck-all').click(function () {
                    $("input:checkbox").attr('checked', false);
                });
            });
        </script>
    </head>
    <body> 
        <div id="panelwrap">

            <jsp:include page = "header.jsp"></jsp:include>          

                <div class="center_content">  

                    <div id="right_wrap">
                        <div id="right_content">             
                            <h2>List of Products</h2> 
                            <form action="/SwimWearShop/DeleteProduct?proID=all" method="post" id="products">
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
                                        ArrayList<Product> products = MyStaticVariable.productDAO.getFullListProduct();
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
                                        <td><input type="checkbox" name="proIDs"  value="<%=p.getProID()%>"/></td>
                                        <td><%=p.getProName()%></td>
                                        <td><%=p.getCategory().getCateName()%></td>
                                        <td><%=detail%></td>
                                        <td>$<%=p.getPrice()%></td>
                                        <td><%=p.getDiscount()%>%</td>
                                        <td>$<%=p.getFinalPrice()%></td>
                                        <td><%=p.getImage()%></td>
                                        <td><%=p.getType()%></td>
                                        <td><%=p.getBrand()%></td>
                                        <td><a href="/SwimWearShop/Admin/product.jsp?proID=<%=p.getProID()%>"><img src="images/edit.png" alt="" title="" border="0" /></a></td>
                                        <td><a href="/SwimWearShop/DeleteProduct?proID=<%=p.getProID()%>"><img src="images/trash.gif" alt="" title="" border="0" /></a></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                            <div class="form_sub_buttons">
                                <a class="button green" id="check-all" href="javascript:void(0);">Select all</a>
                                <a class="button green" id="uncheck-all" href="javascript:void(0);">DeSelect</a>
                                <a onclick="document.getElementById('products').submit();" class="button red">Delete selected</a>
                                <a href="/SwimWearShop/Admin/product.jsp?proID=null" class="button blue">Add new product</a>
                            </div>
                        </form>
                    </div>
                </div>

                <jsp:include page = "sidebar.jsp"></jsp:include> 
                    <div class="clear"></div>
                </div> <!--end of center_content-->

            <jsp:include page = "footer.jsp"></jsp:include> 
        </div> 
    </body>
</html>
