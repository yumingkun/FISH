package com.fish.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.fish.bean.Doc;
import com.fish.utils.ConnectUtil;

//消息DAO
public class DocDao {

       /**
     * 查询全部文件
     */
    public List<Doc> getDocList() {
        Connection conn = ConnectUtil.getConnection();
        String sql = "select * from doc  where isshare=1 order by `count` desc ";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Doc> docs = new ArrayList<Doc>();
        try {
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                docs.add(new Doc(rs.getInt("id"),
                        rs.getString("filename"),
                        rs.getString("savepath"),
                        rs.getLong("filesize"),
                        rs.getString("filetype"),
                        rs.getString("memo"),
                        rs.getString("isshare"),
                        rs.getString("username"),
                        rs.getString("uploaddate"),
                        rs.getInt("count")));
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return docs;
    }

    /**
     * 根据用户username查询用户所有文件
     */
    public List<Doc> getDocListByUsername(String username) {
        Connection conn = ConnectUtil.getConnection();
        String sql = "select * from doc  where username=? order by uploaddate desc ";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Doc> docs = new ArrayList<Doc>();
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,username);
            rs = stmt.executeQuery();
            while (rs.next()) {
                docs.add(new Doc(rs.getInt("id"),
                        rs.getString("filename"),
                        rs.getString("savepath"),
                        rs.getLong("filesize"),
                        rs.getString("filetype"),
                        rs.getString("memo"),
                        rs.getString("isshare"),
                        rs.getString("username"),
                        rs.getString("uploaddate"),
                        rs.getInt("count")));
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return docs;
    }


    /**
     * 上传新的文件
     *
     * @return
     */
    public int save(Doc doc) {
        Connection conn = ConnectUtil.getConnection();
        String sql = "insert into doc(filename,savepath,filesize,filetype,memo,isshare,username,uploaddate) values(?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;
        int n = 0;
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, doc.getFilename());
            stmt.setString(2, doc.getSavepath());
            stmt.setLong(3, doc.getFilesize());
            stmt.setString(4, doc.getFiletype());
            stmt.setString(5, doc.getMemo());
            stmt.setString(6, doc.getIsshare());
            stmt.setString(7, doc.getUsername());
            stmt.setString(8, doc.getUploaddate());
            n = stmt.executeUpdate();
            return n;
        } catch (Exception e) {
            System.out.println("dao上传文件失败");
            e.printStackTrace();

        } finally {
            ConnectUtil.release(null, stmt, conn);
        }
        return n;
    }

    /**
     * 根据id删除文件
     *
     * @param id
     * @return
     */
    public int deleteDoc(int id) {
        Connection conn = ConnectUtil.getConnection();
        String sql = "delete from doc where id=?";
        PreparedStatement stmt = null;
        int n = 0;
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            n = stmt.executeUpdate();
            return n;
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            ConnectUtil.release(null, stmt, conn);
        }
        return n;
    }

    /**
     * 前台通过文章id查询文章详情
     *
     * @param id 文章id
     * @return 一个文章
     */
    public Doc getMessageById(int id) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Doc doc = null;
        try {
            conn = ConnectUtil.getConnection();
            String sql = "select* from doc where id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                doc = new Doc(
                        rs.getInt("id"),
                        rs.getString("filename"),
                        rs.getString("savepath"),
                        rs.getLong("filesize"),
                        rs.getString("filetype"),
                        rs.getString("memo"),
                        rs.getString("isshare"),
                        rs.getString("username"),
                        rs.getString("uploaddate"),
                        rs.getInt("count"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return doc;
    }

    /**
     * 前台根据关键词，查找文件
     *
     * @param search
     * @return
     */
    public List<Doc> searchFile(String search) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Doc> docs = new ArrayList<Doc>();
        try {
            conn = ConnectUtil.getConnection();
            String sql = "select* from doc where filename like ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + search + "%");
            rs = stmt.executeQuery();
            while (rs.next()) {
                docs.add(new Doc(rs.getInt("id"),
                        rs.getString("filename"),
                        rs.getString("savepath"),
                        rs.getLong("filesize"),
                        rs.getString("filetype"),
                        rs.getString("memo"),
                        rs.getString("isshare"),
                        rs.getString("username"),
                        rs.getString("uploaddate"),
                        rs.getInt("count")));
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return docs;

    }

    /**
     * 每次下载增加下载量
     * @param savepath
     * @return
     */
    public int addDownNum(String savepath){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num=0;
        try {
            conn = ConnectUtil.getConnection();
            String sql = "update doc set  `count`=`count`+1  where savepath=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,savepath);

            num = pstmt.executeUpdate();
            if (num > 0) {
                return num;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, pstmt, conn);
        }
        return num;
    }


    /**
     * 更新分享状态
     * @return
     */
    public  int uploadShare(String share,int id){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num=0;
        try {
            conn = ConnectUtil.getConnection();
            String sql = "update doc set isshare=?  where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,share);
            pstmt.setInt(2,id);

            num = pstmt.executeUpdate();
            if (num > 0) {
                return num;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, pstmt, conn);
        }
        return num;
    }



}


 