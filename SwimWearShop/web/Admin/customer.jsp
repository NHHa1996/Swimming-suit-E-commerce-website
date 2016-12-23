<%-- 
    Document   : customer
    Created on : Sep 28, 2016, 9:50:40 PM
    Author     : Cuong
--%>

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
                            <h2>Customer Settings</h2> 

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
                        <form id="settings" name="settings" action="/SwimWearShop/UpdateCustomer" method="post"  >
                            <table>
                                <tr><td>&nbsp</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td style="font-weight: bold">Account</td></tr>
                                <tr><td>&nbsp</td></tr>

                                <tr>
                                    <td>Email</td>
                                    <td>
                                        <input type="text" name="email" value="<%=email%>" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Name</td>
                                    <td>
                                        <input type="text" name="name" value="<%=name%>" >
                                    </td>
                                </tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td style="font-weight: bold">Security</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tr>
                                    <td>Password</td>
                                    <td>
                                        <input type="password" name="pass" value="<%=password%>" >
                                    </td>
                                </tr>
                                <tr>
                                    <td>Confirm</td>
                                    <td>
                                        <input type="password" name="conf" value="<%=password%>" >
                                    </td>
                                </tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td style="font-weight: bold">Bank Account</td></tr>
                                <tr><td>&nbsp</td></tr>

                                <tr>
                                    <td>Bank Name</td>
                                    <td>
                                        <input type="text" name="bankName" value="<%=bankNumber%>" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Bank Number</td>
                                    <td>
                                        <input type="text" name="bankNumber" value="<%=bankNumber%>" readonly>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Account Balance</td>
                                    <td>
                                        <input type="text" name="accountBalance" value="<%=accountBalance%>.00" readonly>&nbsp($)
                                    </td>
                                </tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tfoot>
                                    <tr>
                                        <td colspan="12">Please check the account of customer carefully</td>
                                    </tr>
                                </tfoot>

                            </table>                        
                            <div class="form_sub_buttons">
                                <a class="button green" href="javascript: submitform()">Save settings</a>
                                <a href="/SwimWearShop/Admin/index.jsp" class="button red">Cancel</a>
                                <%
                                    out.println("<p style=\"color: red\">" + MyStaticVariable.settingEdited + "</p>");
                                    MyStaticVariable.settingEdited = "";
                                %>
                                <script type="text/javascript">
                                    function submitform() {
                                        var n = document.forms["settings"]["name"].value;
                                        var e = document.forms["settings"]["email"].value;
                                        var p = document.getElementById("txtPassword").value;
                                        var c = document.getElementById("txtConfirmPassword").value;
                                        if (n === null || n === "" || e === null || e === "" || p === null || p === "" || c === null || c === "") {
                                            alert("Please input enough information!");
                                        } else if (p !== c) {
                                            alert("Passwords do not match!");
                                        } else
                                            document.settings.submit();
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
