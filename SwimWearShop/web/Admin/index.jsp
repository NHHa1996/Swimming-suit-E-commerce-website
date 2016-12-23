<%-- 
    Document   : index
    Created on : Sep 28, 2016, 7:28:40 PM
    Author     : Cuong
--%>

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
                            <h2>SwimWear Admin Page</h2> 
                            <img src="images/admin page.jpg" width="100%" height="65%" alt="admin page" />
<!--                            <img src="images/admin page.jpg" width="1095" height="387" alt="admin page" />-->

                        </div>
                    </div>

                <jsp:include page = "sidebar.jsp"></jsp:include> 
                    <div class="clear"></div>
                </div> <!--end of center_content-->

            <jsp:include page = "footer.jsp"></jsp:include> 
        </div> 
    </body>
</html>
