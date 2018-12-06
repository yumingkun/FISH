package com.fish.dao;

import com.fish.bean.Category;
import com.fish.bean.Message;
import com.fish.utils.ConnectUtil;
import com.fish.vo.CategoryVo;

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

    /**
     * 删除专题的同时把文章类别设置成0：无
     * @param id
     * @return
     */
    public int deleteCategory(int id){
        Connection conn=null;
        PreparedStatement stmt=null;
        ResultSet rs=null;
        int num1=0;
        int num2=0;

        try {
            conn=ConnectUtil.getConnection();
            conn.setAutoCommit(false);

            String sql1="delete from   category where id=?";
            stmt=conn.prepareStatement(sql1);
            stmt.setInt(1,id);
            num1=stmt.executeUpdate();

            String sql2="update message set category_id=0 where category_id=?";
            stmt = conn.prepareStatement(sql2);
            stmt.setInt(1, id);
            num2=stmt.executeUpdate();

            conn.commit();
            return num1+num2;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }

        }finally {
            ConnectUtil.release(rs,stmt,conn);
        }
        return num1+num2;
    }

    /**
     * 修改专题名称
     * @param
     * @return
     */
    public int upldateCategory(Category category){
        Connection conn=null;
        PreparedStatement stmt=null;
        ResultSet rs=null;
        int num=0;


        try {
            conn=ConnectUtil.getConnection();

            String sql="update category  set gname=? where id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, category.getGname());
            stmt.setInt(2,category.getId());
            num=stmt.executeUpdate();
            return num;
        } catch (SQLException e) {
            e.printStackTrace();

        }finally {
            ConnectUtil.release(rs,stmt,conn);
        }
        return num;
    }

    /**
     * 获取每个专题对应的文章个数
     * @return
     */
    public List<CategoryVo> getCategoryVo(){
        Connection conn=null;

        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<CategoryVo> categoryVos = new ArrayList<CategoryVo>();
        try {
            conn=ConnectUtil.getConnection();
            String sql="select category.gname as gname,count(category_id) as num from message,category where message.category_id=category.id GROUP BY category_id ORDER BY num desc";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                categoryVos.add(new CategoryVo(
                        rs.getString("gname"),
                        rs.getInt("num")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return categoryVos;
    }
}
