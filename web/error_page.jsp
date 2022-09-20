

<%@page import="java.lang.Exception"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Something went wrong..</title>
    </head>
    <body>
        <div class="container text-center">
            <img src="image/error.png">
            <h3 class="display-3">Sorry ! Something Went Wrong...</h3>
            <%= exception %>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">home</a>
        </div>
    </body>
</html>
