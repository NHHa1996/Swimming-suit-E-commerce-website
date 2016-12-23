<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Error</title>
      <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body>
      <center>
        <div class="error">
          <h2>Error</h2>
            <p>
               Message: <%= request.getAttribute("ErrorMessage") %>
               
            </p>
            <p><a href="/SwimWearShop/login.jsp">Please check again</a></p>
        </div>
      </center>
    </body>
</html>