<%-- 
    Document   : index
    Created on : Jun 30, 2020, 4:40:56 PM
    Author     : Abir
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--navbar--> 
        <%@include file="normal_navbar.jsp" %>
        <!--banner--> 
        <div class="container-fluid p-0 m-0 ">
            <div class="jumbotron primary-background text-white ">
                <div class="container text-center"> 
                    <h3 class="display-3"> Welcome to Tech Blog</h3><br><br>
                    <p>
                        Use the world best technical blog for better resources and content also you will get best programming resources
                    </p>
                    <p>
                        Now, we are moving on the Second one method which is download method.
                        In this method, you can download this CDN’s directory from the getbootstrap.com. 
                        We moving on the download method step by step.
                    </p>
                    <a class="btn btn-outline-light" href="register_page.jsp"><span class="fa fa-magic"></span> Start Free</a>
                    <a href="login_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle"></span> Login</a>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="list-group">
                        <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">All Posts</a>
                        <%
                            PostDao d = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Category> list1 = d.getAllCategories();

                            for (Category cc : list1) {
                        %>
                        <a href="#" onclick="getPosts(<%= cc.getcId()%>, this)" class="c-link list-group-item list-group-item-action"> <%= cc.getcName()%> </a>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="container text-center" id="loader">
                        <i class="fa fa-refresh fa-4x fa-spin"></i>
                        <h3 class="mt-2"> Loading. . .</h3>
                    </div>
                    <div class="container-fluid" id="post-container">

                    </div>
                </div>

            </div>
        </div>
        <!--Footer-->
        <div class="container-fluid p-0 m-0">
            <div class="primary-background text-white">
                <div class="container">
                    <div class="row mt-4">
                        <div class="col-md-6 py-4 ">
                            <h5 class="text-uppercase">Footer Content</h5>
                            <p>Here you can use rows and columns to organize your footer content.</p>
                        </div>
                        <div class="col-md-3 py-4">
                            <h5 class="text-uppercase">Links</h5>
                            <ul class="list-unstyled">
                                <li>
                                    <a href="#!" class="text-white">Link 1</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white">Link 2</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-3 py-4 ">
                            <h5 class="text-uppercase">Links</h5>
                            <ul class="list-unstyled ">
                                <li>
                                    <a href="#!" class="text-white">Link 1</a>
                                </li>
                                <li>
                                    <a href="#!" class="text-white">Link 2</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-copyright text-center py-3 primary-background text-white">© 2020 Copyright :
            <a href="https://mdbootstrap.com/" class="text-white"> MDBootstrap.com</a>
        </div>


        <!--javaScripts--> 
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
                            function getPosts(catId, temp) {
                                $("#loader").show();
                                $("#post-container").hide();

                                $(".c-link").removeClass('active');

                                $.ajax({
                                    url: "home_load_post.jsp",
                                    data: {cid: catId},
                                    success: function (data, textStatus, jqXHR) {
                                        console.log(data);
                                        $("#loader").hide();
                                        $("#post-container").show();
                                        $("#post-container").html(data);
                                        $(temp).addClass('active');
                                    }
                                });
                            }

                            $(document).ready(function (e) {
                                let allPostRef = $('.c-link')[0]
                                getPosts(0, allPostRef);
                            });
        </script>

    </body>
</html>
