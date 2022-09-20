<%-- 
    Document   : user_query
    Created on : 11-Sep-2022, 10:29:33 am
    Author     : rahul
--%>

<%@page import="java.util.List"%>
<%@page import="com.onlineblog.entities.User"%>
<%@page import="com.onlineblog.dao.AdminDao"%>
<%@page import="com.onlineblog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Query Page</title>
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
      
      <!--User Data Table-->
       
        <div class="container">
            <center> <h1>User Query</h1></center>
            
            <div class="row" style="padding-top: 100px;">
                <div class="col-md-12">
        <table class="table">
            <thead>
         <tr>
          <td scope="col">Id</td>   
         <td scope="col">Name</td>
          <td scope="col">Email</td>
          <td scope="col">Number</td>
          <td scope="col">Query</td>
          
 
           </tr>
            </thead>
        <%
                
                AdminDao dao=new AdminDao(ConnectionProvider.getConnection());
                List<User> user=dao.SelectAllQuery();
                  
                for(User u:user){
                
                
                %>
                
                <tr>
                    
                    <td><%=u.getId()%></td>
                    <td><%=u.getName()%></td>
                    <td><%=u.getEmail()%></td>
                    <td><%=u.getNumber()%></td>
                    <td><%=u.getQuery()%></td>
                    
                    
                 </tr>
                
                <%
                }
                %>
        </table>
                </div>
            </div>
        </div>
        <!--User Data Table End-->
      
    </body>
</html>
