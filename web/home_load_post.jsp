<%@page import="com.tech.blog.dao.HomePostDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">

    <%
        Thread.sleep(100);
        HomePostDao pdao = new HomePostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));

        List<Post> post = null;
        if (cid == 0) {
            post = pdao.getSixAllPosts();
        } else {
            post = pdao.getSixPostByCatId(cid);
        }

        if (post.size() == 0) {
            out.println("<h4 class='display-3 text-center'>No Posts avilable in this category.</h4>");
            return;
        }

        for (Post p : post) {
    %>

    <div class="col-md-12 mt-2">
        <div class="card">
            <img src="blog_pics/<%= p.getpPic()%>" class="card-img-top" alt="...">
            <div class="card-body">
                <b> <%= p.getpTitle()%> </b>
                <div>
                    <p class="mt-2" style=" display: block; display: -webkit-box; max-width: 680px; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis; "><%= p.getpContent()%></p>
                </div>
                <%--<pre><%= p.getpCode()%></pre> --%>

            </div>
            <div class="card-footer text-center">
                <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                <a href="show_home_blog_page.jsp?post_id=<%= p.getpId()%>" class="btn btn-outline-primary btn-sm"> Read More...</a>
                <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
            </div>
        </div>
    </div>

    <%
        }
    %>
</div>