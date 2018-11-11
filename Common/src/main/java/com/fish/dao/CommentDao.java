package com.fish.dao;

import com.fish.bean.Comment;
import com.fish.bean.Message;
import com.fish.bean.User;
import com.fish.utils.ConnectUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {



    /**
     * 前台增加评论
     * @param
     * @return
     */
    public Boolean addComment(Comment comment){

        Connection conn=ConnectUtil.getConnection();
        String sql="insert into comment(user_id,message_id,content,create_time) values(?,?,?,?)";
        PreparedStatement stmt=null;
        ResultSet rs=null;
        try {

            stmt=conn.prepareStatement(sql);
            stmt.setInt(1,comment.getUserId());
            stmt.setInt(2,comment.getMessageId());
            stmt.setString(3,comment.getContrent());
            stmt.setTimestamp(4, new Timestamp(comment.getCreate_time().getTime()));
            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("addComment-----------------------------添加评论失败");
            e.printStackTrace();
            return false;
        }finally {
            ConnectUtil.release(rs,stmt,conn);
        }

    }


    /**
     * 根据文章ID查询此文章有多少评论
     * @param messageId
     * @return
     */
    public int countComment(int messageId){
        Connection conn =null;
        String sql = "select count(*) total from comment where message_id=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn=ConnectUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,messageId);
            rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return 0;
    }


    /**
     * 通过文章Id查询此文章所有的评论，以及评论者的部分信息
     * @param messageId
     * @return
     */
    public List<Comment> getCommentByMessageId(int messageId){
        Connection conn=null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Comment> comments = new ArrayList<Comment>();
        try {
            conn=ConnectUtil.getConnection();
            String sql="select user_id,message_id,content,create_time,username,head from `comment`,users  where message_id=? and `comment`.user_id=users.id order by create_time desc; ";

            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, messageId);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Comment comment=new Comment();
                User user=new User();
                comment.setUserId(rs.getInt("user_id"));
                comment.setMessageId(rs.getInt("message_id"));
                comment.setContrent(rs.getString("content"));
                comment.setCreate_time(rs.getTimestamp("create_time"));
                user.setUsername(rs.getString("username"));
                user.setHead(rs.getString("head"));
                comment.setUser(user);
                comments.add(comment);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return comments;
    }
}
