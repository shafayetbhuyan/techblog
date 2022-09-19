/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.entities;

import java.sql.Timestamp;


public class Admin {
    private int adminId;
    private String adminName;
    private String adminEmail;
    private String adminPassword;
    private String adminGender;
    private String adminAbout;
    private Timestamp datetime;
    private String adminProfile;

    public Admin() {
    }

    public Admin(int adminId, String adminName, String adminEmail, String adminPassword, String adminGender, String adminAbout, Timestamp datetime) {
        this.adminId = adminId;
        this.adminName = adminName;
        this.adminEmail = adminEmail;
        this.adminPassword = adminPassword;
        this.adminGender = adminGender;
        this.adminAbout = adminAbout;
        this.datetime = datetime;
    }

    public Admin(String adminName, String adminEmail, String adminPassword, String adminGender, String adminAbout) {
        this.adminName = adminName;
        this.adminEmail = adminEmail;
        this.adminPassword = adminPassword;
        this.adminGender = adminGender;
        this.adminAbout = adminAbout;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public String getAdminGender() {
        return adminGender;
    }

    public void setAdminGender(String adminGender) {
        this.adminGender = adminGender;
    }

    public String getAdminAbout() {
        return adminAbout;
    }

    public void setAdminAbout(String adminAbout) {
        this.adminAbout = adminAbout;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public String getAdminProfile() {
        return adminProfile;
    }

    public void setAdminProfile(String adminProfile) {
        this.adminProfile = adminProfile;
    }
    
    
}
