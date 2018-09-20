package com.fish.dao;

import com.fish.entity.User;
import com.fish.utils.ConnectUtil;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;



public class UserDao {
    /**
     * 用户登录
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
}
