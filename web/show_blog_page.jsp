
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
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

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
           
            }
        </style>
    </head>
    <body>
        <!--navbar--> 
        <nav class="navbar navbar-expand-lg navbar-dark primary-background ">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-gg"></span>Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link " href="profile.jsp"><span class="fa fa-lightbulb-o"></span> Learn Code With Abir <span class="sr-only">(current)</span></a>
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
                        <a class="nav-link " href="#!" data-toggle="modal" data-target="#profileModal"><span class="fa fa-user-circle"></span> <%= user.getName()%> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="LogoutServlet"><span class="fa fa-user-times"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--end of navbar-->


        <!--main content of body--> 
        <div class="container">
            <div class="row my-2">
                <div class="col-md-10 offset-md-1">
                    <div class="card" style="width: 25rem;">
                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%= p.getpTitle()%></h4>
                        </div>
                        <div class="card-body">
                            <img src="blog_pics/<%= p.getpPic()%>" class="card-img-top my-4" alt="Card image cap">
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
                            <a href="#!" onclick="doLike(<%= p.getpId() %>,<%= user.getId() %>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ldao.countLikeOnPost(p.getpId()) %></span></a>
                            <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end of main body content--> 



        <!--Profile Model--> 
        <!-- Modal  -->
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ,<div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width:150px;">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                            <!--profile details-->
                            <div id="profile-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID :</th>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%= user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">About :</th>
                                            <td><%= user.getAbout()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registration Date :</th>
                                            <td><%= user.getDatetime().toString()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile edit--> 
                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td> <%= user.getId()%> </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"> </td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"> </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"> </td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>About :</td>
                                            <td><textarea class="form-control" rows="3" name="user_about" ><%= user.getAbout()%></textarea></td>
                                        </tr>
                                        <tr>
                                            <td>New Profile Pic :</td>
                                            <td><input type="file" class="form-control" name="image"></textarea></td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End of profile Model--> 


        <!--Add Post Model--> 
        <!-- Modal -->
        <div class="modal fade" id="add-post-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="POST">
                            <div class="form-group">
                                <select class="form-control" name="cId">
                                    <option selected disabled>Select Category</option>
                                    <%
                                        PostDao postd1 = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd1.getAllCategories();

                                        for (Category c : list) {

                                    %>
                                    <option value="<%= c.getcId()%>"><%= c.getcName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control">
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Enter your Content" style="height: 150px;"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" placeholder="Enter your Program (if any)" style="height: 110px;"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your post pic</label>
                                <br>
                                <input name="pPic" type="file" class="form-control">
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end add post model--> 



        <!--javaScripts--> 
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-button').click(function () {
                    if (editStatus == false) {
                        // alert("edit button clicked");
                        $('#profile-details').hide();
                        $('#profile-edit').show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $('#profile-details').show();
                        $('#profile-edit').hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                });
            });
        </script>

        <!--add post in js-->
        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted
                    event.preventDefault();
                    console.log("You have clicked in submit");
                    let form = new FormData(this);
                    // now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success
                            console.log(data);
                            if (data.trim() == "Done") {
                                swal("Good job!", "Successfully posted", "success");
                            } else {
                                swal("Error!", "Something went wrong, post not finished.", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error
                            swal("Error!", "Something went wrong, post not finished.", "error");
                        },
                        processData: false,
                        contentType: false

                    });
                });
            });
        </script>


    </body>
</html>
