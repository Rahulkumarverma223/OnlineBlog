<%-- 
    Document   : adminnav
    Created on : 16-Sep-2022, 12:37:16 pm
    Author     : rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <!--navbar start-->
        
        <nav class="navbar navbar-expand-lg navbar-light primary-background">
         <a class="navbar-brand" href="admin.jsp"><h2>Gurukul Admin Page</h2></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
     
      
    </ul>
      <ul class="navbar-nav mr-right">
           
       <li class="nav-item active">
          <a class="nav-link" href="AdminLogoutServlet"><span class="fa fa-power-off"></span>Logout</a>
      </li>
      </ul>
         
  </div>
</nav> 
      
      <!--navbar end-->
    </body>
</html>
