package com.tech.blog.dao;

import com.mysql.cj.protocol.Resultset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int postId, int userId) {
        boolean f = false;
        try {
            String query = "insert into liked (post_id, user_id) values (?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            // values set
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);

            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countLikeOnPost(int postId) {
        int count = 0;

        try {

            String query = "select count(*) from liked where post_id=? ";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, postId);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                //count = set.getInt(1);
                count = set.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public boolean isLikedByUser(int postId, int userId) {
        boolean f = false;
        try {
            String query = "select * from liked where post_id=? and user_id=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            // values set
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteLike(int postId, int userId) {
        boolean f = false;
        try {
            String query = "delete from liked where post_id=? and user_id=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            // values set
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
