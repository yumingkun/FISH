package com.fish.dao;

import com.fish.bean.Follow;
import com.fish.bean.User;
import com.fish.utils.ConnectUtil;
import com.fish.utils.SQLUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FollowDao {

    /**
     * 当前用户点击添加关注
     *
     * @param userId   当前用户
     * @param followId 所要关注的用户
     * @return
     */
    public int addFollow(int userId, int followId) {
        Connection conn = ConnectUtil.getConnection();
        String sql = "insert into follow(user_id,follow_user_id,status) values(?,?,1)";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int num = 0;
        try {

            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, followId);
            num = stmt.executeUpdate();
            return num;

        } catch (SQLException e) {
            System.out.println("addUser-----------------------------添加用户失败");
            e.printStackTrace();
            return num;
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
    }


    /**
     * 取消关注
     *
     * @param userId   用户
     * @param followId 关注的人
     * @return
     */
    public int updateFollow(int userId, int followId) {
        Connection conn = ConnectUtil.getConnection();
        String sql = "update  follow  set status=0  where user_id=? and follow_user_id=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int num = 0;
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, followId);
            num = stmt.executeUpdate();
            return num;

        } catch (SQLException e) {
            e.printStackTrace();
            return num;
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
    }

    /**
     * 再次关注
     *
     * @param userId   用户
     * @param followId 关注的人
     * @return
     */
    public int addFollowTwo(int userId, int followId) {
        Connection conn = ConnectUtil.getConnection();
        String sql = "update  follow set status=1  where user_id=? and follow_user_id=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int num = 0;
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, followId);
            num = stmt.executeUpdate();
            return num;

        } catch (SQLException e) {
            e.printStackTrace();
            return num;
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
    }


    /**
     * 根据用户id和关注着id查看关注状态
     *
     * @return
     */
    public Follow getFollow(int userId, int followId) {
        Connection conn = ConnectUtil.getConnection();
        String sql = " select * from  follow   where user_id=? and follow_user_id=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Follow follow = null;
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, followId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                follow = new Follow(rs.getInt("id"), rs.getInt("user_id"), rs.getInt("follow_user_id"), rs.getString("status"));
                return follow;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return follow;

    }

    /**
     * 根据当前用户id获得他关注的所有用户
     *
     * @param userId
     * @return
     */
    public List<User> getFollowUsers(int userId) {
        Connection conn = null;
        List<User> users = new ArrayList<User>();
        String sql = "select * from  follow,users where status=1 and follow_user_id=users.id  and  user_id=?";
//        30	8	7	1	7	wangwang	123456	wang@qq.com	1541775229056.jpg	0
//        31	8	8	1	8	yuyuyu	123456	yu@qq.com	1543654548855.jpeg	2
//        32	8	23	1	23	sunsun	123456	sun@qq.com	1542014009716.jpg	0
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("follow_user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setHead(rs.getString("head"));
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return users;

    }

    /**
     * 获得当前用户的全部粉丝
     * @param follow_user_id
     * @return
     */
    public List<User> getFans(int follow_user_id) {
        Connection conn = null;
        List<User> users = new ArrayList<User>();
        String sql = "select * from  follow,users   where  status=1 and user_id=users.id  and  follow_user_id=?";
//        32	8	23	1	8	yuyuyu	123456	yu@qq.com	1543654548855.jpeg	2
//        33	7	23	1	7	wangwang	123456	wang@qq.com	1541775229056.jpg	0
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, follow_user_id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setHead(rs.getString("head"));
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return users;
    }

    /**
     * 判断用户之前是否关注过，如果是关注过是update status=1 而不是再插入一条关注
     * @param userId
     * @param followId
     * @return
     */
    public int checkFollow(int userId, int followId) {
        Connection conn = ConnectUtil.getConnection();

        PreparedStatement stmt = null;
        ResultSet rs = null;
        int num =0;
        try {
            String sql = "select  count(*) as num from  follow where user_id=? and follow_user_id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, followId);
            rs = stmt.executeQuery();
            if (rs.next()){
                num=rs.getInt("num");
            }
            return num;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return num;
    }



}


