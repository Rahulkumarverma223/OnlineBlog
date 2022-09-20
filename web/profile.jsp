<%@page import="com.onlineblog.entities.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.onlineblog.entities.Category"%>
<%@page import="com.onlineblog.helper.ConnectionProvider"%>
<%@page import="com.onlineblog.dao.PostDao"%>
<%@page import="com.onlineblog.entities.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
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
          <a class="nav-link" href="mypost.jsp?id=<%=user.getId()%>" id="#" role="button" aria-haspopup="true" aria-expanded="false">
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
          <a class="nav-link" href="LogoutServlet"><span class="fa fa-power-off"></span>Logout</a>
      </li>
      </ul>
         
  </div>
</nav> 
        
        <!--navbar end-->
         <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div> 


        <%
                session.removeAttribute("msg");
            }
        %>
        
        <!--main body of the page-->
        <main>
            <div class="container">
                <div class="row">
                    <!--first col-->
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group mt-4">
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                                All Posts
                              </a>
                              <!--Categories-->
                              <%
                               PostDao dao=new PostDao(ConnectionProvider.getConnection());
                               ArrayList<Category> list1=dao.getAllCategories();
                                for(Category cc:list1){
                                
                                %>
                                <a href="#" onclick="getPosts(<%=cc.getCid()%>,this)" class="c-link list-group-item list-group-item-action"><%=cc.getName() %></a>
                                <%
                                  }
                                  
                                  %>
                            
                            </div>
                        
                    </div>
                    <!--second col-->
                    <div class="col-md-8">
                        <!--posts-->
                         <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                         <div class="container-fluid" id="post-container">

                        </div>
                        
                    </div>
                </div>
            </div>
            
        </main>
        
        <!--end main body of the page-->
        
        <!--profile modal--> 

<!-- Modal -->
<div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">Gurukul</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="cotainer text-center">
              <h5 class="modal-title" id="exampleModalLabel"><%= user.getName() %></h5>
              <!--details-->
               <c:if test="${not empty success}">
                <p class ="text-center text-sucess ">${success}</p>
                <c:remove var="success" scope="session"/>
             
            </c:if>
                
                 <c:if test="${not empty error}">
                <p class ="text-center text-denger ">${error}</p>
                <c:remove var="success" scope="session"/>
             
            </c:if>
              
              <div id="profile-details">
              <table class="table">

                      <tbody>
                        <tr>
                          <th scope="row">Email</th>
                          <td><%= user.getEmail() %></td>

                        </tr>
                        <tr>
                          <th scope="row">Number</th>
                          <td><%=user.getNumber() %></td>

                        </tr>
                        <tr>
                          <th scope="row">Gender</th>
                          <td><%=user.getGender() %></td>

                        </tr>
                      </tbody>
                    </table>
              </div>
                           <!--profile edit-->
                           <div id="profile-edit" style="display:none;">
                               <h3 class="mt-2">Please edit carefully</h3>
                               <form action="EditServlet" method="post" enctype="multipart/form-data">
                                   <table class="table">
                                       <tr>
                                            <tr>
                                           <td>Name: </td>
                                           <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"> </td>
                                       </tr>
                                           <td>Email: </td>
                                           <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"> </td>
                                       </tr>
                                        <tr>
                                           <td>Number: </td>
                                           <td><input type="int" class="form-control" name="user_number" value="<%= user.getNumber() %>"> </td>
                                       </tr>
                                        <tr>
                                           <td>Password: </td>
                                           <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"> </td>
                                       </tr>
                                   </table>
                                       <div class="cotainer">
                                           <button type="submit" class="btn btn-outline-primary">Save</button>
                                       </div>
                                   
                               </form>
                               
                           </div>
                          
                                  <!--details end-->
                              </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                          </div>
                        </div>
                      </div>
                    </div>
        
        <!--End profile modal-->
        
        <!--add post modal-->
        <!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <form action="AddPostServlet" method="post" id="add-post-form">
               
              <div class="form-group">
                  <select class="form-control" name="cid">
                      <option selected disabled>..Select Category..</option>
                      <%
                          PostDao postd=new PostDao(ConnectionProvider.getConnection());
                          ArrayList<Category> list=postd.getAllCategories();
                          for(Category c:list){
                          %>
                          
                          <option value="<%=c.getCid()%>">  <%=c.getName() %> </option>
                          <%
                          }
                          
                          %>
                      
                  </select>
              </div>
              
               <div class="form-group">
                    <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                </div>

                <div class="form-group">
                    <textarea name="pContent" class="form-control" style="height: 150px;" placeholder="Enter your content"></textarea>
                </div>
                <div class="form-group">
                    <textarea name="pCode" class="form-control" style="height: 150px;" placeholder="Enter your program (if any)"></textarea>
                </div>
             <div class="form-group">
                 <label>Select your pic..</label>
                    <br>
                   <input type="file" name="pic"  >
               </div>
                          <div class="container text-center">
                              <button type="submit" class="btn btn-outline-primary">Post </button>  
                          </div>
              
          </form>
         
      </div>
      
    </div>
  </div>
</div>
        
        <!--end add post modal-->
        
        
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="javascript/myjs.js" type="text/javascript"></script>
        
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-button').click(function ()
                                    {
                                        if (editStatus == false)
                                        {
                                            $("#profile-details").hide()
                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else
                                        {
                                            $("#profile-details").show()
                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit")
                                        }
                                    })
                                });
        </script>
        <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "saved successfully", "success");
                            } else
                            {
                                swal("Good job!", "saved successfully", "success");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>

        <!--loading post using ajax-->
        <script>
            function getPosts(catID, temp) {
                $("#loader").show();
                $("#post-container").hide()
                $(".c-link").removeClass('active')
                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catID},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                        $(temp).addClass('active')
                    }
                })
            }
            $(document).ready(function (e) {
                let allPostRef = $('.c-link')[0]
                getPosts(0, allPostRef)
            })
        </script>
        
    </body>
</html>
