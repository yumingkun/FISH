package com.fish.dao;

import com.fish.bean.Category;
import com.fish.bean.Message;
import com.fish.utils.ConnectUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 分类Dao
 */
public class CategoryDao {


    /**
     * 后台查询所有的分类
     * @return
     */
    public List<Category> getCategoryList()  {

        Connection conn=null;

        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Category> categories = new ArrayList<Category>();
        try {
            conn=ConnectUtil.getConnection();
            String sql="select * from category";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                categories.add(new Category(
                        rs.getInt("id"),
                        rs.getString("gname")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return categories;
    }


    /**
     *  添加新类别
     * @param gname
     * @return
     */
    public Boolean addCategory(String gname){
        Connection conn=ConnectUtil.getConnection();
        String sql="insert into category(gname) values(?)";
        PreparedStatement stmt=null;
        ResultSet rs=null;

        try {
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,gname);
            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
//            System.out.println("");
            e.printStackTrace();
            return false;
        }finally {
            ConnectUtil.release(rs,stmt,conn);
        }

    }
}
