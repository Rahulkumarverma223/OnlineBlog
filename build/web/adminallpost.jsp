<%-- 
    Document   : adminallpost
    Created on : 16-Sep-2022, 12:36:26 pm
    Author     : rahul
--%>

<%@page import="com.onlineblog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.onlineblog.dao.PostDao"%>
<%@page import="com.onlineblog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file="adminnav.jsp" %>
           <!--banner-->
       
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
         
             <!--Java Script-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="javascript/myjs.js" type="text/javascript"></script>
        
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
