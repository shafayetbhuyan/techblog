
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao postd = new PostDao(ConnectionProvider.getConnection());

    Post p = postd.getPostByPostId(postId);
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%></title>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .post-title{
                font-weight: 400;
            }
            .post-content{
                padding-top: 15px;
                font-weight: 300;
                font-size: 18px;
            }
            .post-user-info{
                font-weight: 300;
                font-size: 20px;
            }
            .row-user{
                padding-top: 15px;
            }
            .post-code{
                padding-top: 15px;
                font-weight: 300;
                font-size: 18px;
            }
            body{
                
                background: #efefef;
                margin-top: 70px;
           
            }
        </style>
    </head>
    <body>
        <!--navbar--> 
        <%@include file="normal_navbar.jsp" %>
        <!--end of navbar-->


        <!--main content of body--> 
        <div class="container">
            <div class="row my-2">
                <div class="col-md-10 offset-md-1">
                    <div class="card">
                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%= p.getpTitle()%></h4>
                        </div>
                        <div class="card-body">
                            <img src="blog_pics/<%= p.getpPic()%>" class="card-img-top my-4" alt="...">
                            <br>
                            <div class="dropdown-divider"></div>
                            <div class="row my-2 row-user">
                                <div class="col-md-8">
                                    <%
                                    UserDao userd=new UserDao(ConnectionProvider.getConnection());
                                    %>
                                    <p class="post-user-info">Posted by : <a href="#"> <%= userd.getUserById(p.getUserId()).getName() %> </a></p>
                                </div>
                                <div class="col-md-4">
                                    <p><%= DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
                                </div>
                            </div>
                            <div class="dropdown-divider"></div>
                            <p class="post-content"><%= p.getpContent()%></p>
                            <br>
                            <br>
                            <div class="dropdown-divider"></div>
                            <div class="post-code">
                                <pre><%= p.getpCode()%></pre>
                            </div>
                            <div class="dropdown-divider"></div>
                        </div>
                        <div class="card-footer text-center">
                            <%
                            LikeDao ldao=new LikeDao(ConnectionProvider.getConnection());
                            %>
                            <%-- <a href="#!" onclick="doLike(<%= p.getpId() %>,<%= user.getId() %>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ldao.countLikeOnPost(p.getpId()) %></span></a>--%> 
                            <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ldao.countLikeOnPost(p.getpId()) %></span></a> 
                            <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end of main body content--> 



        


        <!--javaScripts--> 
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        


    </body>
</html>
