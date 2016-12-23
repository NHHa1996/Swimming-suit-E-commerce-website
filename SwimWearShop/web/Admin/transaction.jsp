<%-- 
    Document   : transaction
    Created on : Dec 17, 2016, 9:34:43 PM
    Author     : Cuong
--%>

<%@page import="model.shop.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.user.Account"%>
<%@page import="model.user.Customer"%>
<%@page import="model.user.Admin"%>
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

            <jsp:include page = "header.jsp"></jsp:include>          

                <div class="center_content">  

                    <div id="right_wrap">
                        <div id="right_content">  
                        <%
                            ArrayList<Account> a = MyStaticVariable.userDAO.getListBankAccount();

                            String email = request.getParameter("email");
                            Customer c = MyStaticVariable.userDAO.getCustomerFromDB(email);
                            Account b = c.getBankAccount();
                            String name = c.getName();
                            String password = c.getPassword();
                            int bankNumber = b.getBankNumber();
                            String bankName = b.getBankName();
                            int accountBalance = b.getAccountBalance();
                        %>

                        <h2>Customer Transaction - "<%=c.getName()%>"</h2> 


                        <table id="rounded-corner">
                            <thead>
                                <tr>
                                    <th>Transaction No.</th>
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th>Total Payment</th>
                                    <th>Date Time</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="12" style="text-align: center">List transaction of customer "<%=c.getName()%>" with the email <%=email%> </td>
                                </tr>
                            </tfoot>
                            <%
                                ArrayList<Bill> transactions = MyStaticVariable.billDAO.getListTransaction(c.getUserID());
                                for (int i = 0; i < transactions.size(); i++) {
                                    if (i % 2 != 0) {%>
                            <tr class="odd">
                                <%} else {%>
                            <tr class="even">
                                <%}%>
                                <td><%=i + 1%></td>
                                <td><%=transactions.get(i).getProName()%></td>
                                <td><%=transactions.get(i).getQuantity()%></td>
                                <td>$<%=transactions.get(i).getPayment()%>.00</td>
                                <td><%=transactions.get(i).getDate()%></td>
                            </tr><%}%>

                        </table>
                        <!--                        <center>
                                                    <div class="form_sub_buttons">
                                                        <a href="/SwimWearShop/Admin/customers.jsp" class="button red">Cancel</a>
                                                    </div>
                                                </center>-->

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