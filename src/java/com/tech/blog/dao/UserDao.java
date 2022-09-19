package com.tech.blog.dao;

import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

//    Method to insert user to database 
    public boolean saveUser(User user) {
        boolean f = false;
        try {
//          User Database 
            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //get user by useremail and userpassword
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            //bring data from user table
            String query = "select * from user where email=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();

                // name data from DataBase
                String name = set.getString("name");
                // set to user object
                user.setName(name);

                //in same line for id from DataBase
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDatetime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    //Update user
    public boolean updateUser(User user){
        boolean f=false;
        try{
            String query="update user set name=?, email=?, password=?, about=?, profile=? where id=?";
            PreparedStatement pstmt= con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getAbout());
            pstmt.setString(5, user.getProfile());
            pstmt.setInt(6, user.getId());
            
            pstmt.executeUpdate();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    
    //get user by ID
    public User getUserById(int userId){
        User user= null;
        
        String query="select * from user where id=?";
        try {
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setInt(1, userId);
            
            ResultSet set= pstmt.executeQuery();
            
            if(set.next()){
                user= new User();
                
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDatetime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return user;
    }
    
    //Get Number of Users
    public int getNumberOfUsers(){
        int noOfUser=0;
        
        String query= "SELECT COUNT(id) FROM `user`";
        try {
            PreparedStatement pstmt=this.con.prepareStatement(query);
            
            ResultSet set=pstmt.executeQuery();
            
            if(set.next()){
                //count id
                noOfUser= set.getInt("count(id)");
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return noOfUser;
        
    }
    
    public List<User> getAllUser(){
        List<User> list= new ArrayList<>();
        String query="SELECT * FROM user";
        
        try {
            PreparedStatement pstmt= this.con.prepareStatement(query);
            ResultSet set= pstmt.executeQuery();
            
            while (set.next()) {                
                
                int id= set.getInt("id");
                String name= set.getString("name");
                String email= set.getString("email");
                String password= set.getString("password");
                String gender= set.getString("gender");
                String about= set.getString("about");
                String profile= set.getString("profile");
                Timestamp rdate= set.getTimestamp("rdate");
                
                User user= new User(id, name, email, password, gender, rdate, about, profile);
                list.add(user);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
}
