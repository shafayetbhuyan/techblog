package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    //save post
    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String query = "insert into posts(p_title, p_content, p_code, p_pic, c_id, user_id) values (?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getcId());
            pstmt.setInt(6, p.getUserId());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String query = "select * from categories";

            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(query);

            while (set.next()) {
                int cId = set.getInt("c_id");
                String cName = set.getString("c_name");
                String cDescription = set.getString("c_description");

                Category c = new Category(cId, cName, cDescription);

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //get all the post
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from posts order by p_id desc");

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                int pId = set.getInt("p_id");
                String pTitle = set.getString("p_title");
                String pContent = set.getString("p_content");
                String pCode = set.getString("p_code");
                String pPic = set.getString("p_pic");
                Timestamp pDate = set.getTimestamp("p_date");
                int cId = set.getInt("c_id");
                int userId = set.getInt("user_id");

                Post post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, cId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        //fetch all the post by id
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from posts where c_id=?");
            pstmt.setInt(1, catId);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                int pId = set.getInt("p_id");
                String pTitle = set.getString("p_title");
                String pContent = set.getString("p_content");
                String pCode = set.getString("p_code");
                String pPic = set.getString("p_pic");
                Timestamp pDate = set.getTimestamp("p_date");
                int userId = set.getInt("user_id");

                Post post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Post getPostByPostId(int postId) {
        Post post = null;
        String query = "select * from posts where p_id=?";

        try {

            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, postId);
            
            ResultSet set= pstmt.executeQuery();
            
            if(set.next()){
                
                int pId = set.getInt("p_id");
                String pTitle = set.getString("p_title");
                String pContent = set.getString("p_content");
                String pCode = set.getString("p_code");
                String pPic = set.getString("p_pic");
                Timestamp pDate = set.getTimestamp("p_date");
                int userId = set.getInt("user_id");
                int catId = set.getInt("c_id");
                post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);


            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
    
    //Get Number of Posts
    public int getNumberOfPosts(){
        int noOfPosts=0;
        
        String query= "SELECT COUNT(p_id) FROM `posts`";
        try {
            PreparedStatement pstmt=this.con.prepareStatement(query);
            
            ResultSet set= pstmt.executeQuery();
            
            if(set.next()){
                //count post id
                noOfPosts= set.getInt("count(p_id)");
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return noOfPosts;
        
    }

}
