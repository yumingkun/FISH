package com.fish.dao;

import com.fish.bean.User;
import com.fish.utils.ConnectUtil;
import com.fish.utils.SQLUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserDao {
    /**
     * 前台用户登录
     * @param username 用户名
     * @param password 密码
     * @return 成功返回数据库用户实体 失败返回null
     */
    public User login(String username, String password){

        Connection conn=ConnectUtil.getConnection();
        String sql="select * from users where username= ? and password=?";
        PreparedStatement stmt=null;
        ResultSet rs=null;
        User user=null;

        try {
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,username);
            stmt.setString(2,password);
            rs=stmt.executeQuery();
            //如果有这个用户，则从数据库取出用户信息并返回这个用户信息
            while (rs.next()){
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setHead(rs.getString("head"));
            }
        } catch (SQLException e) {
            System.out.println("UserDao-----------------------------登录失败");
            e.printStackTrace();
            return null;
        }finally {
            ConnectUtil.release(rs,stmt,conn);
        }


        return  user;
    }

    /**
     * 前台增加用户
     * @param user
     * @return
     */
    public boolean addUser(User user){
        Connection conn=ConnectUtil.getConnection();
        String sql="insert into users(username,password,email) values(?,?,?)";
        PreparedStatement stmt=null;
        ResultSet rs=null;

        try {

            stmt=conn.prepareStatement(sql);
            stmt.setString(1,user.getUsername());
            stmt.setString(2,user.getPassword());
            stmt.setString(3,user.getEmail());
            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("addUser-----------------------------添加用户失败");
            e.printStackTrace();
            return false;
        }finally {
            ConnectUtil.release(rs,stmt,conn);
        }

    }


    /**
     * 前台添加用户头像的文件名
     * @param url 上传头像的文件名
     * @return
     */
    public boolean addHead(String url,int id){
        Connection conn=ConnectUtil.getConnection();
        String sql="update users set head=? where id=? ";
        PreparedStatement stmt=null;
        ResultSet rs=null;

        try {
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,url);
            stmt.setInt(2,id);
            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("addUser-----------------------------添加用户头像失败");
            e.printStackTrace();
            return false;
        }finally {
            ConnectUtil.release(rs,stmt,conn);
        }
    }

    /**
     * 前台查询指定用户
     * @param id
     * @return
     */
    public User getUser(int id){
        Connection conn = ConnectUtil.getConnection();
        String sql = "select * from users where id=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        User user=null;
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();

            while (rs.next()) {
               user=new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("email"),rs.getString("head"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return user;
    }


    /**
     * 后台查询所有的用户信息
     * @return
     */
    public List<User> getAllUsers() {
        Connection conn = ConnectUtil.getConnection();
        String sql = "select * from users";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<User> users = new ArrayList<User>();
        try {
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("email")));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return users;
    }

    /**
     * 后台计算所有用户数量
     * @return 用户总数
     * @throws Exception
     */
    public  int countUsers() {
        Connection conn =null;
        String sql = "select count(*) total from users";
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
     * 分页查询用户
     * @param page 当前页
     * @param recordPage 一次查询多少用户
     * @return 返回一页查询的用户数量
     */
    public List<User> searchUsers(int page,int recordPage){
        Connection conn =null;
        List<User> users=new ArrayList<User>();
        String sql = "select id,username,password,email  from users "+SQLUtil.getLimit(page,recordPage);
        // select id,username,password,email  from users limit 0,5
        PreparedStatement stmt=null;
        ResultSet rs=null;
        try {
            conn=ConnectUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                User user=new User();
               user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
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
     * 后台根据用户ID删除用户
     * @param userid
     * @return
     */
    public  Boolean deleteUserById(int userid) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num;
        try {
            conn = ConnectUtil.getConnection();
            String sql = "delete from  users  where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userid);
            num = pstmt.executeUpdate();
            if (num > 0) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, pstmt, conn);
        }
        return false;
    }

}
