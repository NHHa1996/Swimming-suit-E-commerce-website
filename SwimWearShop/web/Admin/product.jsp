<%-- 
    Document   : product
    Created on : Sep 28, 2016, 7:50:40 PM
    Author     : Cuong
--%>

<%@page import="model.shop.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.shop.Product"%>
<%@page import="model.user.Admin"%>
<%@page import="model.MyStaticVariable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    String productID = request.getParameter("proID");
    int proID = 0, originalPrice = 0, discount = 0, price = 0;
    String name = "", category = "", type = "", brand = "", detail = "", image = "Please select image";

    ArrayList<Category> categories = MyStaticVariable.categoryDAO.getListProductCategory();
    ArrayList<String> types = MyStaticVariable.productDAO.getListProductType();
    String action = "";

    if (!productID.equals("null")) {
        action = "edit";
        proID = Integer.parseInt(productID);
        Product product = MyStaticVariable.productDAO.getProductByID(proID);
        category = MyStaticVariable.categoryDAO.getProductCategory(proID);
        name = product.getProName();
        type = product.getType();
        brand = product.getBrand();
        detail = product.getDetail();
        if (detail == null) {
            detail = "No detail for this product";
        }
        image = product.getImage();
        originalPrice = product.getPrice();
        discount = product.getDiscount();
        price = product.getFinalPrice();
    } else {
        action = "add";
    }
%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Swim Wear a E-Commerce online Shopping - Admin</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>
        <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
        <script>
            function uploadside1(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#side1')
                                .attr('src', e.target.result)
                                .width(150)
                                .height(200);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }

            function uploadside2(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#side2')
                                .attr('src', e.target.result)
                                .width(150)
                                .height(200);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }

            function uploadside3(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#side3')
                                .attr('src', e.target.result)
                                .width(150)
                                .height(200);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>

    </head>
    <body>
        <div id="panelwrap">

            <jsp:include page = "header.jsp"></jsp:include>          

                <div class="center_content">  

                    <div id="right_wrap">
                        <div id="right_content">             
                            <h2>Product Settings</h2>
                            <form id="manageproduct" name="manageproduct" action="/SwimWearShop/UpdateProduct?option=<%=action%>" method="post" >
                            <table>
                                <tr><td>&nbsp</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td style="font-weight: bold">Product Information</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tr>
                                    <td>Product ID</td>
                                    <td>
                                        <input type="text" name="proID" placeholder="Product ID *" value="<%=proID%>" readonly="">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Product Name</td>
                                    <td>
                                        <input type="text" name="name" placeholder="Product Name *" value="<%=name%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Brand</td>
                                    <td>
                                        <input type="text" name="brand" placeholder="Brand *"  value="<%=brand%>" >
                                    </td>
                                </tr>
                                <tr>
                                    <td>Detail</td>
                                    <td>
                                        <input type="text" name="detail" placeholder="Detail *"  value="<%=detail%>" >
                                    </td>
                                </tr>
                                <tr>
                                    <td>Category</td>
                                    <td>
                                        <select name="category">
                                            <% for (int i = 0; i < categories.size(); i++) {
                                                    if (categories.get(i).getCateName().equalsIgnoreCase(category)) {%>
                                            <option value="<%=categories.get(i).getCateID()%>" selected="selected"><%=category%></option>
                                            <%} else {%>
                                            <option value="<%=categories.get(i).getCateID()%>"><%=categories.get(i)%></option>
                                            <%}
                                                }%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Type</td>
                                    <td>
                                        <select name="ptype">
                                            <% for (int i = 0; i < types.size(); i++) {
                                                    if (types.get(i).equalsIgnoreCase(type)) {%>
                                            <option selected="selected" value="<%=type%>"><%=type%></option>
                                            <%} else {%>
                                            <option value="<%=types.get(i)%>"><%=types.get(i)%></option>
                                            <%}
                                                }%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Original Price</td>
                                    <td>
                                        <input min="0" type="number" name="originalPrice"  onkeypress='return event.charCode >= 48 && event.charCode <= 57' placeholder="Original Price *" style="width: 50px" value="<%=originalPrice%>">&nbsp($)
                                    </td>
                                </tr>
                                <tr>
                                    <td>Discount</td>
                                    <td>
                                        <!--                                        <input type="number" name="discount" min="1" max="5">-->
                                        <input type="number" min=0 max=100 name="discount"  onkeypress='return event.charCode >= 48 && event.charCode <= 57' placeholder="Discount Price *"  style="width: 50px" value="<%=discount%>"/>&nbsp(%)
                                    </td>
                                </tr>

                                <%if (!productID.equals("null")) {%>
                                <tr>
                                    <td>Sell Price</td>
                                    <td>
                                        <input type="text" name="price" value="<%=price%>"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'  placeholder="Price *"   style="width: 50px" readonly>&nbsp($)
                                    </td>
                                </tr>
                                <%}%>

                                <tr>
                                    <td>Image</td>
                                    <td>
                                        <img id="side1" src="/SwimWearShop/images/product/side 1/<%=image%>" alt="<%=image%>" style="width: 200px ;height: 200px">
                                    </td>

                                </tr>

                                <tr>
                                    <td>Other side</td>
                                    <!--<td><input type="file" name="pic" accept="image/*"></td>-->
                                    <td>
                                        <img id="side2"  src="/SwimWearShop/images/product/side 2/<%=image%>" alt="<%=image%>" style="width: 98px ;height: 100px">
                                        <img id="side3"  src="/SwimWearShop/images/product/side 3/<%=image%>" alt="<%=image%>" style="width: 98px ;height: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Side 1
                                    </td>
                                    <td>
                                        <input type='file' name="file1"  accept=".png, .jpg, .jpeg" onchange="uploadside1(this);" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Side 2
                                    </td>
                                    <td>
                                        <input type='file' name="file2" accept=".png, .jpg, .jpeg"  onchange="uploadside2(this);" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Side 3
                                    </td>
                                    <td>
                                        <input type='file' name="file3"  accept=".png, .jpg, .jpeg" onchange="uploadside3(this);" />
                                    </td>
                                </tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tfoot>
                                    <tr>
                                        <td colspan="12">Please check your product carefully.</td>
                                    </tr>
                                </tfoot>

                            </table>                        
                            <div class="form_sub_buttons">
                                <%if (!productID.equals("null")) {%>
                                <a href="javascript: submitform()" class="button green">Save Product Settings</a>
                                <%} else {%>
                                <a href="javascript: submitform()" class="button green">Add New Product</a>
                                <%}%>
                                <a href="/SwimWearShop/Admin/products.jsp" class="button red" >Cancel</a>
                                <!--                                <a href="" class="button red" onclick="window.history.back()">Cancel</a>-->
                                <%
                                    out.println("<p style=\"color: red\">" + MyStaticVariable.productEdited + "</p>");
                                    MyStaticVariable.productEdited = "";
                                %>
                                <script type="text/javascript">
                                    function submitform() {
                                        var n = document.forms["manageproduct"]["name"].value;
                                        var b = document.forms["manageproduct"]["brand"].value;
                                        var f1 = document.forms["manageproduct"]["file1"].value;
                                        var f2 = document.forms["manageproduct"]["file2"].value;
                                        var f3 = document.forms["manageproduct"]["file3"].value;
                                        var p = document.forms["manageproduct"]["originalPrice"].value;
                                        var dis = document.forms["manageproduct"]["discount"].value;
                                        var d = parseInt(dis);
                                        if (n === null || n === "") {
                                            alert("Please input product's name!");
                                        } else if (b === null || b === "") {
                                            alert("Please input product's brand!");
                                        } else if (p === null || p === "") {
                                            alert("Please input product's original price!");
                                        } else if (dis === null || dis === "") {
                                            alert("Please input product's discount!");
                                        } else if (d < 0 || d > 100) {
                                            alert("discount much be 0-100%!");
                                        } else if (<%=action.equals("add")%>) {
                                            if (f1 === null || f1 === "") {
                                                alert("Please input product's image side 1!");
                                            } else if (f2 === null || f2 === "") {
                                                alert("Please input product's image side 2!");
                                            } else if (f3 === null || f3 === "") {
                                                alert("Please input product's image side 3!");
                                            } else
                                                document.manageproduct.submit();
                                        } else
                                            document.manageproduct.submit();
                                    }
                                </script>
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
