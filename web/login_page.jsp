

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> 
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <!--navbar--> 
        <%@include file="normal_navbar.jsp" %>
        <main class="d-flex p-5 primary-background mt-3" style="height: 100vh">
            <div class="container">
                <div class="row text-center">
                    <div class="col-md-6">
                        <div>
                            <a class="btn btn-outline-light" href="user_login_page.jsp"><span class="fa fa-user-circle"></span> User Login</a>
                        </div>
                    </div>
                    <div class="col-md-6 ">
                        <div>
                            <a href="admin_login_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle"></span> Admin Login</a>
                        </div>
                    </div>
                </div> 
            </div>
        </main>



        <!--javaScripts--> 
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/myjs.js" type="text/javascript"></script>


    </body>
</html>
