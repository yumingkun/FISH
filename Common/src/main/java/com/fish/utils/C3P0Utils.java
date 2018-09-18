package com.fish.utils;


import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 * C3P0连接数据库的工具类
 */
public class C3P0Utils {


    private static final ComboPooledDataSource dataSource = new ComboPooledDataSource();

    /**
     * 获得连接的方法:
     * @throws SQLException
     */
    public static Connection getConnection() throws Exception{
        Connection conn = dataSource.getConnection();
        return conn;
    }

    /**
     * 资源释放无结果集
     */
    public static void release(Statement stmt,Connection conn){
        if(stmt != null){
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            stmt = null;
        }
        if(conn != null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            conn = null;
        }
    }

    /**
     * 资源释放有结果集
     */
    public static void release(ResultSet rs,Statement stmt,Connection conn){
        if(rs!= null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            rs = null;
        }
        if(stmt != null){
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            stmt = null;
        }
        if(conn != null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            conn = null;
        }
    }
}
