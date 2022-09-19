/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


public class HomePostDao {
    Connection con;

    public HomePostDao(Connection con) {
        this.con = con;
    }
    
    public List<Post> getSixAllPosts(){
      List<Post> list = new ArrayList<>();
      //fetch six post
        try {
            PreparedStatement pstmt=con.prepareStatement("SELECT * FROM posts ORDER BY p_id DESC LIMIT 6");
            ResultSet set= pstmt.executeQuery();
            
            while(set.next()){
                int pId = set.getInt("p_id");
                String pTitle = set.getString("p_title");
                String pContent = set.getString("p_content");
                String pCode = set.getString("p_code");
                String pPic = set.getString("p_pic");
                Timestamp pDate = set.getTimestamp("p_date");
                int cId = set.getInt("c_id");
                int userId = set.getInt("user_id");
                
                Post post= new Post(pId, pTitle, pContent, pCode, pPic, pDate, cId, userId);
                list.add(post);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
      
      return list;
    }
    
    public List<Post> getSixPostByCatId(int catId){
        List<Post> list=new ArrayList<>();
        try {
            PreparedStatement pstmt= con.prepareStatement("SELECT * FROM posts WHERE c_id=? ORDER BY p_id DESC LIMIT 6");
            pstmt.setInt(1, catId);
            
            ResultSet set= pstmt.executeQuery();
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
    
}
