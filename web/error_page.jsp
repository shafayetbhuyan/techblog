
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry..!! something went wrong.</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> 
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <div class="container text-center mt-5">
            <div class="col-md-4 offset-md-4">
                <img src="img/error.png" class="img-fluid">
            </div>
            <h3 class="display-4">Sorry..!! something went wrong.</h3>
            <h5 class="mt-3 text-center"> <%= exception %> </h5>
            <br>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
        </div>
        
        


        <!--javaScripts--> 
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/myjs.js" type="text/javascript"></script> 

    </body>
</html>
