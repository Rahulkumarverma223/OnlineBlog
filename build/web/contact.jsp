<%-- 
    Document   : contact
    Created on : 01-Sep-2022, 3:11:15 pm
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
        <title>Contact Page</title>
        
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        
        <!--contact page-->
        <main class="d-flex align-items-center" style="height:80vh">
        <div class="container" >
            
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center">
                            <h2>Contact with us </h2>
                        </div>
                        <div class="card-body">
                            <form id="reg-form"  action="ContactServlet" method="post">
                                 <div class="form-group">
                                    <label for="exampleInputEmail1"> Name</label>
                                    <input type="text" name="name" class="form-control" id="exampleInputusername" aria-describedby="usernameHelp" placeholder="Enter User name">
                                   
                                  </div>
                                  <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                  </div>
                                  <div class="form-group">
                                    <label for="exampleInputEmail1">Mobile Number</label>
                                    <input type="int" name="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Number">
                                  </div> 
                                   
                                  <div class="form-group">
                                      <p> <label for="query">Your Query</label></p>
                                    <textarea id="query" name="query" rows="4" cols="62"></textarea>
                                  </div>
                                  
                                <br>
                                
                                <div class="container text-center" id="loader" style="display:none;" >
                                    <span class="fa fa-refresh fa-spin fa-4x"> </span>
                                    <h4>Please wait..</h4>
                                </div>
                                
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                 </form>
                        </div>
                    </div>
                </div>
                </div>
        </div>
        </main>
        
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="javascript/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
         
    </body>
</html>
