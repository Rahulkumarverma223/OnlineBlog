
<%@page import="java.util.List"%>
<%@page import="com.onlineblog.entities.User"%>
<%@page import="com.onlineblog.helper.ConnectionProvider"%>
<%@page import="com.onlineblog.dao.AdminDao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
         response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
          
        if(session.getAttribute("username")==null)
        {
         response.sendRedirect("admin_login.jsp");
     
        }
        %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Details</title>
    </head>
    <body>
        <!--Navbar Start-->
        
       <%@include file="adminnav.jsp" %>
        <!--Navabar End-->
        
        
        <!--User Data Table-->
       
        <div class="container">
            <center> <h1>User Details</h1></center>
                <c:if test="${not empty sucess}">
                <p class ="text-center text-sucess ">${sucess}</p>
                <c:remove var="sucess" scope="session"/>
             
            </c:if>
                
                 <c:if test="${not empty error}">
                <p class ="text-center text-denger ">${error}</p>
                <c:remove var="sucess" scope="session"/>
             
            </c:if>
            
            <div class="row" style="padding-top: 100px;">
                <div class="col-md-12">
        <table class="table">
            <thead>
         <tr>
          <td scope="col">Id</td>   
         <td scope="col">Name</td>
          <td scope="col">Email</td>
          <td scope="col">Number</td>
          <td scope="col">gender</td>
          <td scope="col">Time</td>
 
           </tr>
            </thead>
        <%
                 
                AdminDao dao=new AdminDao(ConnectionProvider.getConnection());
                List<User> user=dao.selectAllUsers();
                
                for(User u:user){
                %>
                
                <tr>
                    <td><%=u.getId()%></td>
                    <td><%=u.getName()%></td>
                    <td><%=u.getEmail()%></td>
                    <td><%=u.getNumber()%></td>
                    <td><%=u.getGender()%></td>
                    <td><%=u.getDataTime()%></td>
                    <td><a class="btn-primary" href="UserDeleteServlet?id=<%=u.getId()%>">Delete</a></td>
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
