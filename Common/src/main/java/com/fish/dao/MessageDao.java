package com.fish.dao;


import com.fish.bean.Message;
import com.fish.utils.ConnectUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MessageDao {
    /**
     * 前台分页查询全部留言
     * @param start 从第一个到点击数*10个
     * @param count 每页记录数
     * @return
     * @throws Exception
     */

    public List<Message> getMessageList(int start , int count)  {

        Connection conn=null;

        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Message> messages = new ArrayList<Message>();
        try {
            conn=ConnectUtil.getConnection();
            String sql="select * from message where trash=0 order by create_time desc limit ?,?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, start );
            stmt.setInt(2, count);
            rs = stmt.executeQuery();
            while (rs.next()) {
                messages.add(new Message(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getTimestamp("create_time")));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return messages;
    }


    /**
     * 前台用户查询自己的全部文章
     * @param id 当前用户id
     * @return
     */
    public List<Message> getUserMessageList(int id)  {

        Connection conn=null;

        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Message> messages = new ArrayList<Message>();
        try {
            conn=ConnectUtil.getConnection();
            String sql="select * from message  where user_id=?  and trash=0 order by create_time desc ";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                messages.add(new Message(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getTimestamp("create_time")));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return messages;
    }

    /**
     * 前台计算所有文章数量
     * @return
     * @throws Exception
     */
    public  int countMessages() {
        Connection conn =null;
        String sql = "select count(*) total from message";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn=ConnectUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
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
     * 前台添加新建的文章
     * @return
     */
    public  boolean save(Message message){
        Connection conn = ConnectUtil.getConnection();
        String sql = "insert into message(user_id,username,title,content,create_time) values(?,?,?,?,?)";
        PreparedStatement stmt = null;

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setLong(1, message.getUserId());
            stmt.setString(2, message.getUserName());
            stmt.setString(3, message.getTitle());
            stmt.setString(4, message.getContent());
            stmt.setTimestamp(5, new Timestamp(message.getCreateTime().getTime()));
            stmt.execute();
            System.out.println(message.getTitle()+"---------------");
        } catch (Exception e) {
            System.out.println("保存留言信息失败");
            e.printStackTrace();
            return false;
        }finally {
            ConnectUtil.release(null,stmt,conn);
        }


        return true;
    }


    /**
     * 前台通过文章id查询文章详情
     * @param id 文章id
     * @return 一个文章
     */
    public Message getMessageById(int id)  {

        Connection conn=null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Message message=null;
        try {
            conn=ConnectUtil.getConnection();
            String sql="select * from message where id=?  and trash=0";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                message=new Message(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getTimestamp("create_time"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return message;
    }
    /**
     * 前台根据关键词，查找文章
     * @param search
     * @return
     */
    public List<Message> searchMessages(String search){
        Connection conn=null;
        Statement stmt = null;
        ResultSet rs = null;
        List<Message> messages = new ArrayList<Message>();
        try {
            conn=ConnectUtil.getConnection();
            String sql="select * from message where 1=1 and trash=0";

            if(search!= null){//按照游戏名称查询
                sql+=" and title like '%"+search+"%' ";
            }

            stmt=conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                messages.add(new Message(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getTimestamp("create_time")));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return messages;
    }

    public  Boolean trash(int id){

        Connection conn=null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num;
        try {
            conn=ConnectUtil.getConnection();
            String sql="update message set trash=1 where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            num=pstmt.executeUpdate();
            if (num>0) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs,pstmt, conn);
        }
        return false;
    }

}
