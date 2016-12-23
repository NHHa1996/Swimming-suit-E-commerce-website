<%-- 
    Document   : settings
    Created on : Sep 28, 2016, 7:50:40 PM
    Author     : Cuong
--%>

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
                            <h2>Settings</h2> 

                        <%
                            Admin ad = MyStaticVariable.admin;
                            int userID = ad.getUserID();
                            String name = ad.getName();
                            String email = ad.getEmail();
                            String password = ad.getPassword();
                        %>

                        <form id="settings" name="settings" action="/SwimWearShop/Settings" method="post">
                            <table>
                                <tr><td>&nbsp</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tr>
                                    <td style="font-weight: bold">Language</td>
                                    <td>&nbsp&nbsp&nbsp
                                        <select name="category">
                                            <option selected="selected">English</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td style="font-weight: bold">Account</td></tr>
                                <tr><td>&nbsp</td></tr>

                                <tr>
                                    <td>Email</td>
                                    <td>
                                        <input type="text" name="email" value="<%=email%>" readonly >
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
                                        <input type="password" id="txtPassword" name="pass" value="<%=password%>" >
                                    </td>
                                </tr>
                                <tr>
                                    <td>Confirm</td>
                                    <td>
                                        <input type="password" id="txtConfirmPassword" name="conf" value="<%=password%>" >
                                    </td>
                                </tr>
                                <tr><td>&nbsp</td></tr>
                                <tr><td>&nbsp</td></tr>
                                <tfoot>
                                    <tr>
                                        <td colspan="12">Please check your settings carefully.</td>
                                    </tr>
                                </tfoot>

                            </table>
                            <div class="form_sub_buttons">

                                <!--                                <input type="submit" class="button green" value="Save settings">-->
                                <!--                                <a class="button green" onclick="document.getElementById('settings').submit();">Save settings</a>-->
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
