<%-- 
    Document   : mypost
    Created on : 12-Sep-2022, 11:53:02 pm
    Author     : rahul
--%>

<%@page import="com.onlineblog.dao.Userdao"%>
<%@page import="com.onlineblog.entities.User"%>
<%@page import="com.onlineblog.entities.Post"%>
<%@page import="java.util.*"%>
<%@page import="com.onlineblog.helper.ConnectionProvider"%>
<%@page import="com.onlineblog.dao.PostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    User user=(User)session.getAttribute("CurrentUser");
    if(user==null){
     response.sendRedirect("login_page.jsp");
     
    }
    
    %>
   
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Post</title>
    </head>
    <body>
         <!--navbar start-->
        
        <nav class="navbar navbar-expand-lg navbar-light primary-background">
  <a class="navbar-brand" href="index.jsp">Gurukul</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-book"></span>Programming <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="mypost.jsp" id="#" role="button" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-briefcase"></span> My Post
        </a>
      </li>
      
      <li class="nav-item active">
          <a class="nav-link" href="contact.jsp"><span class="fa fa-address-book-o"></span>Contact</a>
      </li>
       <li class="nav-item active">
          <a class="nav-link" href="#!" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>Do Post</a>
      </li>
      
    </ul>
      <ul class="navbar-nav mr-right">
           <li class="nav-item active">
          <a class="nav-link text-white" href="#!" data-toggle="modal" data-target="#profile-Modal"><span class="fa fa-user-circle"></span><%=user.getName() %></a>

      </li>
       <li class="nav-item active">
          <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
      </li>
      </ul>
         
  </div>
</nav> 
        
        <!--navbar end-->
        
         <div class="container">
             <div class="row">
           
        <%    
           
                PostDao d=new PostDao(ConnectionProvider.getConnection());
                int id=Integer.parseInt(request.getParameter("id"));
                 List<Post> posts=d.getPostByUserId(id);
                 
                 for(Post p:posts)
                {
            
            %>
            <div class="col-md-4 mt-2">
              <div class="card">
            <img class="card-img-top" src="blog_pic/<%=p.getpPic() %>" alt="Card image cap">
            <div class="card-body">
                <b><%=p.getpTitle() %> </b>
                <p><%=p.getpContent() %> </p>
                
             </div>
                <div class="card-footer text-center primary-background">
                    <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-primary btn-sm text-white">Read More..</a>

                </div>
          </div>
        
         </div>
        
            <%
            }
            %>
             </div>
        </div>
         </div>
        
    </body>
</html>

