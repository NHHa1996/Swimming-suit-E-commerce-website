<%-- 
    Document   : transaction
    Created on : Sep 29, 2016, 1:31:59 PM
    Author     : Cuong
--%>
<%@page import="model.shop.Bill"%>
<%@page import="model.MyStaticVariable"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
            });
        </script>



    </head>
    <body>
        <jsp:include page = "header.jsp"></jsp:include>
            <!-- collapse -->
            <div class="collpse">
                <div class="container">

                    <h2 style="font-weight: bold">Transactions</h2>
                    <div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        List of Your Transactions
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">
                                    <table>
                                        <tr>
                                            <th>Transaction No.</th>
                                            <th>Product Name</th>
                                            <th>Quantity</th>
                                            <th>Total Payment</th>
                                            <th>Date Time</th>
                                        </tr>
                                    <%
                                        ArrayList<Bill> transactions = MyStaticVariable.billDAO.getListTransaction(MyStaticVariable.customer.getUserID());
                                        for (int i = 0; i < transactions.size(); i++) {%>
                                    <tr>
                                        <td><%=i + 1%></td>
                                        <td><%=transactions.get(i).getProName()%></td>
                                        <td><%=transactions.get(i).getQuantity()%></td>
                                        <td>$<%=transactions.get(i).getPayment()%>.00</td>
                                        <td><%=transactions.get(i).getDate()%></td>
                                    </tr><%}%>
                                </table> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- collapse -->
        <jsp:include page = "footer.jsp"></jsp:include>
    </body>
</html>
