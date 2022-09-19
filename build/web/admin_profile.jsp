
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.AdminDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.Admin"%>
<%@page errorPage="error_page.jsp" %>
<%
    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("admin_login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/usertable.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>

    </head>


    <body>

        <!--navbar--> 
        <nav class="navbar navbar-expand-lg navbar-dark primary-background fixed-top">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-gg"></span>Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link " href="#"><span class="fa fa-lightbulb-o"></span> Learn Code With Abir <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-file-code-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implimentation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Stracture</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#"><span class="fa fa-address-book"></span> Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " data-toggle="modal" data-target="#add-post-model" href="#"><span class="fa fa-asterisk"></span> Post</a>
                    </li>
                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <!--profile Model added--> 
                        <a class="nav-link " href="#!" data-toggle="modal" data-target="#profileModal"><span class="fa fa-user-circle"></span> <%= admin.getAdminName()%> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="LogoutServlet"><span class="fa fa-user-times"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--end of navbar-->


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


        <!--Main body--> 
        <main>
            <div class="container-fluid" style="margin-top: 80px;">
                <div class="row">
                    <!--sidebar-->
                    <div class=" col-xl-3 col-md-3">
                        <div class=" bg-light border-right" id="sidebar-wrapper">
                            <div class="list-group list-group-flush mb-3">
                                <a href="#" class="list-group-item list-group-item-action bg-light">Dashboard</a>
                                <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a>
                                <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a>
                                <a href="#" class="list-group-item list-group-item-action bg-light">Events</a>
                                <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
                                <a href="#" class="list-group-item list-group-item-action bg-light">Status</a>
                            </div>
                        </div>
                    </div>
                    <!--end of sidebar--> 

                    <div class="col-xl-9">
                        <div class="row">
                            <!--User Card-->
                            <div class=" col-xl-4 col-md-6 mb-4">
                                <div class="card border-left-primary shadow py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"> Users </div>
                                                <%
                                                    UserDao uDao = new UserDao(ConnectionProvider.getConnection());
                                                %>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"> <%= uDao.getNumberOfUsers()%> </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa fa-user-circle fa-3x"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--Post card--> 
                            <div class=" col-xl-4 col-md-6 mb-4">
                                <div class="card border-left-primary shadow py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"> Post </div>
                                                <%
                                                    PostDao pDao = new PostDao(ConnectionProvider.getConnection());
                                                %>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"> <%= pDao.getNumberOfPosts()%> </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa fa-file-text fa-3x"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Others Card--> 
                            <div class="col-xl-4 col-md-6 mb-4">
                                <div class="card border-left-primary shadow py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"> Others </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"> 40,000 </div>
                                            </div>
                                            <div class=" col-auto">
                                                <i class="fa fa-align-left fa-3x"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!------------> 
                        <div class="row ">
                            <div class="container-fluid " id="user_table">


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--End of main body--> 

        <!--javaScripts--> 
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
    $(function () {
        $("#user_table").load("user_list.jsp"); // load the user_list.jsp page in the #user_table element
    });
        </script>


    </body>
</html>


<!----------------------------> 
<%--  $(function() { // when DOM is ready
    $("#showhidecomment").click(function(){         // when #showhidecomment is clicked
        $("#chkcomments").load("sample.jsp");       // load the sample.jsp page in the #chkcomments element
    }); 
}); --%>
