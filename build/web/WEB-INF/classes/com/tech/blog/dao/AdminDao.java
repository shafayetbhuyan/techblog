/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Abir
 */
public class AdminDao {
    private Connection con;
    
    public AdminDao( Connection con){
        this.con=con;
    }
    
    //Method to insert Admin to database
    public boolean saveAdmin(Admin admin){
        boolean f= false;
        try {
            // Admin database
            String query= "insert into admin (admin_name, admin_email, admin_password, admin_gender, admin_about) values(?,?,?,?,?) ";
            PreparedStatement pstmt= this.con.prepareStatement(query);
            pstmt.setString(1, admin.getAdminName());
            pstmt.setString(2, admin.getAdminEmail());
            pstmt.setString(3, admin.getAdminPassword());
            pstmt.setString(4, admin.getAdminGender());
            pstmt.setString(5, admin.getAdminAbout());
            
            pstmt.executeUpdate();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    //get admin by user email and password
    public Admin getAdminByEmailAndPassword (String adminEmail, String adminPassword){
        Admin admin = null;
        try {
            String query= "select * from admin where admin_email=? and admin_password=? ";
            PreparedStatement pstmt= this.con.prepareStatement(query);
            pstmt.setString(1, adminEmail);
            pstmt.setString(2, adminPassword);
            
            ResultSet set= pstmt.executeQuery();
            
            if (set.next()) {
                admin= new Admin();
                
                admin.setAdminName(set.getString("admin_name"));
                admin.setAdminId(set.getInt("admin_id"));
                admin.setAdminEmail(set.getString("admin_email"));
                admin.setAdminPassword(set.getString("admin_password"));
                admin.setAdminGender(set.getString("admin_gender"));
                admin.setAdminAbout(set.getString("admin_about"));
                admin.setDatetime(set.getTimestamp("admin_rdate"));
                admin.setAdminProfile(set.getString("admin_profile"));
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return admin;
    }
    
    //update admin
    public boolean updateAdmin (Admin admin){
        boolean f=false;
        try {
            String query="update admin set admin_name=?, admin_email=?, admin_password=?, admin_about=?, admin_profile=? where admin_id=?";
            PreparedStatement pstmt= this.con.prepareStatement(query);
            pstmt.setString(1, admin.getAdminName());
            pstmt.setString(2, admin.getAdminEmail());
            pstmt.setString(3, admin.getAdminPassword());
            pstmt.setString(4, admin.getAdminAbout());
            pstmt.setString(5, admin.getAdminProfile());
            pstmt.setInt(6, admin.getAdminId());
            
            pstmt.executeUpdate();
            f=true;  
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return f;
    }
    
    //get admin by ID
    public Admin getAdminById(int adminId){
        Admin admin= null;
        
        String query="select * from admin where admin_id=?";
        try {
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setInt(1, adminId);
            
            ResultSet set= pstmt.executeQuery();
            if (set.next()) {
                admin = new Admin();
                
                admin.setAdminName(set.getString("admin_name"));
                admin.setAdminId(set.getInt("admin_id"));
                admin.setAdminEmail(set.getString("admin_email"));
                admin.setAdminPassword(set.getString("admin_password"));
                admin.setAdminGender(set.getString("admin_gender"));
                admin.setAdminAbout(set.getString("admin_about"));
                admin.setDatetime(set.getTimestamp("admin_rdate"));
                admin.setAdminProfile(set.getString("admin_profile"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return admin;
    }
    
}
