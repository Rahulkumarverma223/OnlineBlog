<%@page import="com.onlineblog.entities.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <a class="nav-link" href="contact.jsp"><span class="fa fa-address-book-o"></span>Contact</a>
      </li>
    </ul>
    <%
        User user=(User)session.getAttribute("CurrentUser");
        %>
      
      <ul class="navbar-nav mr-right">
          <c:if test="${empty CurrentUser }">
               
               <li class="nav-item active">
          <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle-o"></span>Login</a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span>Sign Up</a>
      </li>
           </c:if>
      
       <c:if test="${not empty CurrentUser }">
               
               <li class="nav-item active">
          <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle-o"></span><%=user.getName() %></a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="LogoutServlet"><span class="fa fa-power-off"></span>Logout</a>
      </li>
           </c:if>
      
      
      
    </ul>
    
        
    
  </div>
</nav>