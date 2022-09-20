<%-- 
    Document   : admin
    Created on : 04-Sep-2022, 1:07:32 am
    Author     : rahul
--%>


<%@page import="com.onlineblog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Admin Page</title>
    </head>
    <body>
        <%
         response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
          
        if(session.getAttribute("username")==null)
        {
         response.sendRedirect("admin_login.jsp");
     
        }
    
    %>
         <!--navbar start-->
        
        <%@include file="adminnav.jsp" %>
      
      <!--navbar end-->
      <div class="container">
          <div class="row" style="padding-top:100px;">
  <div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">User Detail</h5>
        <p class="card-text">Click on below button for user detail. </p>
        <a href="admin_userdetail.jsp" class="btn btn-primary">Click here</a>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">All Post</h5>
        <p class="card-text">Click on below button for All post.</p>
        <a href="adminallpost.jsp" class="btn btn-primary">Go somewhere</a>
      </div>
    </div>
  </div>
</div>
          <div class="row" style="padding-top:50px;">
  <div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">User_Query</h5>
        <p class="card-text">Click on below button for user query.</p>
        <a href="user_query.jsp" class="btn btn-primary">Click Here</a>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
        <a href="#" class="btn btn-primary">Go somewhere</a>
      </div>
    </div>
  </div>
</div>
              
      </div>
      </div>
    </body>
</html>
