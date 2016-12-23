<%-- 
    Document   : customers
    Created on : Sep 28, 2016, 7:40:40 PM
    Author     : Cuong
--%>

<%@page import="model.user.Account"%>
<%@page import="model.user.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MyStaticVariable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Swim Wear a E-Commerce online Shopping - Admin</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
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
        <link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <div id="panelwrap">

            <jsp:include page = "header.jsp"></jsp:include>          

                <div class="center_content">  

                    <div id="right_wrap">
                        <div id="right_content">             
                            <h2>List of Customers</h2>
                            <form action="/SwimWearShop/DeleteCustomer?userID=all" method="post" id="customers">
                                <table id="rounded-corner">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>No.</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Password</th>
                                            <th>Address</th>
                                            <th>Phone Number</th>
                                            <th>Bank ID</th>
                                            <th>Bank Name</th>
                                            <th>Bank Number</th>
                                            <th>Bank Balance</th>
                                            <th>View Transaction</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <td colspan="12"">Adminstators are not allowed to edit Customer information without the requirement of manager.</td>
                                        </tr>
                                    </tfoot>
                                    <tbody>

                                    <%
                                        ArrayList<Customer> customers = MyStaticVariable.userDAO.getListCustomerFromDB();
                                        for (int i = 0; i < customers.size(); i++) {
                                            Customer c = customers.get(i);
                                            Account b = c.getBankAccount();
                                            if (i % 2 != 0) {
                                    %>
                                    <tr class="odd">
                                        <%} else {%>
                                    <tr class="even">
                                        <%}%>
                                        <td><input type="hidden" name="userIDs" value="<%=c.getUserID()%>"/></td>
                                        <td><%=i + 1%></td>
                                        <td><%=c.getName()%></td>
                                        <td><%=c.getEmail()%></td>
                                        <td><%=c.getPassword()%></td>
                                        <td><%=c.getAddress()%></td>
                                        <td><%=c.getPhoneNumber()%></td>
                                        <td><%=b.getBankID()%></td>
                                        <td><%=b.getBankName()%></td>
                                        <td><%=b.getBankNumber()%></td>
                                        <td>$<%=b.getAccountBalance()%></td>
                                        <td><a href="/SwimWearShop/Admin/transaction.jsp?email=<%=c.getEmail()%>"><img src="images/view.png" alt="" title="" border="0" /></a></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table> 
                        </form>

                    </div>
                </div>

                <jsp:include page = "sidebar.jsp"></jsp:include> 
                    <div class="clear"></div>
                </div> <!--end of center_content-->
                <br/><br/><br/><br/><br/><br/><br/><br/><br/>
            <jsp:include page = "footer.jsp"></jsp:include> 
        </div> 
    </body>
</html>
