
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<div class="row">
    <div class="col-xl-12 col-md-6">
        <div class="container-fluid">
            <div class="table-responsive" style="height: 500px;" >
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class=" col-sm-8"><h2>User Details</h2></div>
                            <div class=" col-sm-4">
                                <div class="search-box">
                                    <i class="material-icons">&#xE8B6;</i>
                                    <input type="text" class="form-control" placeholder="Search&hellip;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name <i class="fa fa-sort"></i></th>
                                <th>Email</th>
                                <th>Gender<i class="fa fa-sort"></i></th>
                                <th>About</th>
                                <th>Registration Date <i class="fa fa-sort"></i></th>
                                <th>Profile</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                UserDao uDao1 = new UserDao(ConnectionProvider.getConnection());

                                List<User> user = uDao1.getAllUser();

                                for (User u : user) {
                            %>
                            <tr>
                                <td><%= u.getId()%></td>
                                <td><%= u.getName()%></td>
                                <td><%= u.getEmail()%></td>
                                <td><%= u.getGender()%></td>
                                <td><%= u.getAbout()%></td>
                                <td><%= u.getDatetime()%></td>
                                <td><img src="pics/<%= u.getProfile()%>" class="img-fluid" style="max-width:70px; max-height: 70px;"></td>
                                <%
                                    User user2= uDao1.getUserById(u.getId());
                                %>
                                <td>
                                    <a href="#" class="view" title="View"  data-toggle="modal" data-target="#profileModal"><i class="material-icons">&#xE417;</i></a>
                                    <!--<a href="#" class="edit" title="Edit" data-toggle="modal" data-target=""><i class="material-icons">&#xE254;</i></a>--> 
                                    <a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                        <ul class="pagination">
                            <li class="page-item disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>
                            <li class="page-item"><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                            <li class="page-item active"><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                            <li class="page-item"><a href="#" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>        
        </div>     
    </div>
</div>

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
                    <img <%-- src="pics/<%= user.getProfile()%>"--%> class="img-fluid" style="border-radius: 50%; max-width:150px;">
                    <br>
                    <h5 class="modal-title mt-3" id="exampleModalLabel"><%-- <%= user.getName()%> --%></h5>
                    <!--profile details-->
                    <div id="profile-details">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th scope="row">ID :</th>
                                    <td><%-- <%= user.getId()%> --%> </td>
                                </tr>
                                <tr>
                                    <th scope="row">Email :</th>
                                    <td><%-- <%= user.getEmail()%> --%> </td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender :</th>
                                    <td><%--  <%= user.getGender()%> --%> </td>
                                </tr>
                                <tr>
                                    <th scope="row">About :</th>
                                    <td><%-- <%= user.getAbout()%> --%> </td>
                                </tr>
                                <tr>
                                    <th scope="row">Registration Date :</th>
                                    <td><%-- <%= user.getDatetime().toString()%> --%> </td>
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
                                    <td> <%-- <%= user.getId()%> --%> </td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td> <input type="text" class="form-control" name="user_name" <%-- value="<%= user.getName()%>"> --%> </td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td> <input type="email" class="form-control" name="user_email" <%-- value="<%= user.getEmail()%>"> --%> </td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td> <input type="password" class="form-control" name="user_password"<%-- value="<%= user.getPassword()%>"> --%> </td>
                                </tr>
                                <tr>
                                    <td>Gender :</td>
                                    <td><%-- <%= user.getGender().toUpperCase()%> --%></td>
                                </tr>
                                <tr>
                                    <td>About :</td>
                                    <td><textarea class="form-control" rows="3" name="user_about" ><%-- <%= user.getAbout()%> --%></textarea></td>
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
<script>

    //Edit Profile 
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