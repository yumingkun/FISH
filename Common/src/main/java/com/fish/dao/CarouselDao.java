package com.fish.dao;

import com.fish.bean.Carousel;
import com.fish.bean.Category;
import com.fish.utils.ConnectUtil;

import java.util.ArrayList;
import java.util.Date;
import java.sql.*;
import java.util.List;

/**
 * 上传轮播图
 */
public class CarouselDao {
    /**
     * 上传轮播图
     * @param uploadUrl
     * @return
     */
   public int addCarousel(String uploadUrl){
       Connection conn=ConnectUtil.getConnection();
       String sql="insert into carousel(img_loc,create_time) values(?,?)";
       PreparedStatement stmt=null;
       ResultSet rs=null;
       int n=0;
       try {

           stmt=conn.prepareStatement(sql);
           stmt.setString(1,uploadUrl);
           stmt.setTimestamp(2,new Timestamp(new Date().getTime()));
           n=stmt.executeUpdate();
           return n;

       } catch (SQLException e) {
           System.out.println("addUser-----------------------------添加用户失败");
           e.printStackTrace();
           return n;
       }finally {
           ConnectUtil.release(rs,stmt,conn);
       }

   }


    /**
     * 得到所有轮播图信息
     * @return
     */
   public List<Carousel> getCarouselList(){
       Connection conn=null;

       PreparedStatement stmt = null;
       ResultSet rs = null;
       List<Carousel> carousels = null;
       try {
           conn=ConnectUtil.getConnection();
           String sql="select * from carousel order by create_time desc limit 0,4";
           stmt = conn.prepareStatement(sql);
           rs = stmt.executeQuery();
           carousels=new ArrayList<Carousel>();
           while (rs.next()) {
               carousels.add(new Carousel(
                       rs.getInt("id"),
                       rs.getString("img_loc"),
                       rs.getTimestamp("create_time")
               ));
           }
           return carousels;

       } catch (Exception e) {
           e.printStackTrace();
       } finally {
           ConnectUtil.release(rs, stmt, conn);
       }
       return carousels;
   }
}
