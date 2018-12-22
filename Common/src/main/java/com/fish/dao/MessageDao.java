package com.fish.dao;


import com.fish.bean.Category;
import com.fish.bean.Message;
import com.fish.utils.ConnectUtil;
import com.fish.vo.ChartVo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MessageDao {
    /**
     * 前台分页查询全部文章
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
            String sql="select message.id,user_id,users.username as username,title,content,create_time,laud,category.id cid,gname from message,category,users  where auditing=1 and trash=0 and message.category_id=category.id and message.user_id=users.id order by create_time desc limit ?,?";
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
                        rs.getTimestamp("create_time"),
                        rs.getInt("laud"),
                        new Category(rs.getInt("cid"),rs.getString("gname")))
                );

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return messages;
    }

    /**
     * 获取所有需要审核的文章
     * @return
     */
    public List<Message> getAllMeaasgeAuditing()  {

        Connection conn=null;

        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Message> messages = new ArrayList<Message>();
        try {
            conn=ConnectUtil.getConnection();
            String sql="select message.id,user_id,users.username as username,title,content,create_time,laud,category.id cid,gname from message,category,users  where auditing=0 and trash=0 and message.category_id=category.id and message.user_id=users.id order by create_time desc ";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                messages.add(new Message(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getTimestamp("create_time"),
                        rs.getInt("laud"),
                        new Category(rs.getInt("cid"),rs.getString("gname")))
                );

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
            String sql="select message.id,user_id,users.username as username,title,content,create_time,laud,category.id cid,auditing,gname from message,category,users  where auditing=1 and user_id=? and trash=0 and message.category_id=category.id and message.user_id=users.id order by create_time desc";
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
                        rs.getTimestamp("create_time"),
                        rs.getInt("laud"),
                        new Category(rs.getInt("cid"),rs.getString("gname")))
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return messages;
    }

    /**
     * 个人中心查询自己（已经审核和未审核的文章）的全部文章
     * @param id 当前用户id
     * @return
     */
    public List<Message> getUserMessageListAuditing(int id)  {

        Connection conn=null;

        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Message> messages = new ArrayList<Message>();
        try {
            conn=ConnectUtil.getConnection();
            String sql="select message.id,user_id,users.username as username,title,content,create_time,laud,category.id cid,auditing,gname from message,category,users  where user_id=? and trash=0 and message.category_id=category.id and message.user_id=users.id order by create_time desc";
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
                        rs.getTimestamp("create_time"),
                        rs.getInt("laud"),
                        rs.getInt("auditing"),
                        new Category(rs.getInt("cid"),rs.getString("gname")))
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return messages;
    }

    /**
     * 查询当前用户回收站文章
     * @param id
     * @return
     */
    public List<Message> getTrash(int id){
        Connection conn=null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Message> messages = new ArrayList<Message>();
        try {
            conn=ConnectUtil.getConnection();
            String sql="select message.id,user_id,users.username as username ,title,content,create_time,laud,category.id cid,auditing,gname from message,category,users  where user_id=? and trash=1  and message.category_id=category.id and message.user_id=users.id order by create_time desc";
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
                        rs.getTimestamp("create_time"),
                        rs.getInt("laud"),
                        rs.getInt("auditing"),
                        new Category(rs.getInt("cid"),rs.getString("gname")))
                );
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
    public  int  addMessage(Message message,int category_id){
        Connection conn = ConnectUtil.getConnection();

        PreparedStatement pstmt = null;
        int result;
        try {
            String sql = "insert into message(user_id,category_id,title,content,create_time) values(?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, message.getUserId());
            pstmt.setInt(2,category_id);
            pstmt.setString(3, message.getTitle());
            pstmt.setString(4, message.getContent());
            pstmt.setTimestamp(5, new Timestamp(message.getCreateTime().getTime()));
            result =pstmt.executeUpdate();
            return  result;

        } catch (Exception e) {
            System.out.println("保存留言信息失败");
            e.printStackTrace();
            return 0;
        }finally {
            ConnectUtil.release(null,pstmt,conn);
        }

    }


    /**
     * 前台通过文章id查询文章详情
     * @param messageid 文章id
     * @return 一个文章
     */
    public Message getMessageById(int messageid)  {

        Connection conn=null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Message message=null;
        try {
            conn=ConnectUtil.getConnection();
            String sql="select message.id,message.category_id,user_id,users.username as username,title,content,create_time,laud,category.id cid,gname from message,category,users  where    category_id=category.id and message.user_id=users.id and  message.id=? and trash=0   ";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, messageid);
            rs = stmt.executeQuery();
            while (rs.next()) {
                message=new Message(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getTimestamp("create_time"),
                        rs.getInt("laud"),
                        new Category(rs.getInt("cid"),rs.getString("gname")));
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
            String sql="select message.id,message.category_id,user_id,users.username as username,title,content,create_time,laud,category.id cid,gname from message,category,users  where 1=1 and category_id=category.id and message.user_id=users.id   and trash=0";

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
                        rs.getTimestamp("create_time"),
                        rs.getInt("laud"),
                        new Category(rs.getInt("cid"),rs.getString("gname"))));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return messages;
    }

    /**
     * 把文章放入回收站
     * @param id
     * @return
     */
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

    /**
     * 恢复指定ID的文章
     * @param id
     * @return
     */
    public  Boolean restore(int id){

        Connection conn=null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num;
        try {
            conn=ConnectUtil.getConnection();
            String sql="update message set trash=0 where id=?";
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

    /**
     * 彻底删除指定ID的文章
     * @param id
     * @return
     */
    public  Boolean trashDelete(int id){
        Connection conn=null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num1;
        int num2;
        try {
            conn=ConnectUtil.getConnection();
            conn.setAutoCommit(false);

            String sql1="delete from  message  where  trash=1 and id=?";
            pstmt = conn.prepareStatement(sql1);
            pstmt.setInt(1, id);
            num1=pstmt.executeUpdate();

            String sql2="delete from  comment  where  message_id=?";
            pstmt = conn.prepareStatement(sql2);
            pstmt.setInt(1, id);
            num2=pstmt.executeUpdate();

            conn.commit();

            if (num1>0 && num2>0) {
                return true;
            }

        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs,pstmt, conn);
        }

        return false;

    }



    /**
     * 前台根据分类id查询相应的文章
     * @param id
     * @return
     */
    public List<Message> getMessagesByCategoryId(int id){
        Connection conn=null;

        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Message> messages = new ArrayList<Message>();
        try {
            conn=ConnectUtil.getConnection();
            String sql="select message.id,user_id,users.username as username,title,content,create_time,laud,category.id cid,gname from message,category,users  where auditing=1 and trash=0 and   message.category_id=category.id and message.user_id=users.id and  category.id =?  order by create_time desc";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id );
            rs = stmt.executeQuery();
            while (rs.next()) {
                messages.add(new Message(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getTimestamp("create_time"),
                        rs.getInt("laud"),
                        new Category(rs.getInt("cid"),rs.getString("gname")))
                );

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return messages;
    }

    /**
     * 前台更新文章内容
     * @param message
     * @return
     */
    public Boolean updateMessage(Message message,int category_id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num;
        try {
            conn = ConnectUtil.getConnection();
            String sql = "update message set title=?,content=?,category_id=?,auditing=0 where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,message.getTitle());
            pstmt.setString(2,message.getContent());
            pstmt.setInt(3,category_id);
            pstmt.setInt(4, message.getId());
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

    /**
     * 获取用户文章数量前6的用户名和数量
     */
    public List<ChartVo>  getMessageShowChart(){
        Connection conn=null;

        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<ChartVo> chartVos = new ArrayList<ChartVo>();
        try {
            conn=ConnectUtil.getConnection();
            String sql="select users.username as username ,count(username) as num from message,users where   message.user_id=users.id  and message.auditing=1 GROUP BY username ORDER BY count(username) desc";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                chartVos.add(new ChartVo(
                        rs.getString("username"),
                        rs.getInt("num")

                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
         return chartVos;
    }


    /**
     * 根据文章ID获取该文章的点赞量
     * @param messageId
     * @return
     */
    public int getLaudById(int messageId){
        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        int result=0;
        try {
            conn=ConnectUtil.getConnection();
            String sql = "select laud from message where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,messageId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result=rs.getInt("laud");
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, pstmt, conn);
        }
        return result;

    }

    /**
     * 给指定的文章点赞+1
     * @param messageId
     * @return
     */
    public int addLaud(int messageId){
        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        int result=0;
        try {
            conn=ConnectUtil.getConnection();
            String sql = "update message set laud=laud+1   where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,messageId);
            result = pstmt.executeUpdate();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, pstmt, conn);
        }
        return result;

    }

    /**
     * 获取点赞数前六的文章
     * @return
     */
    public List<Message> getMessageLaud(){
        Connection conn=null;

        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Message> messages = new ArrayList<Message>();
        try {
            conn=ConnectUtil.getConnection();
            String sql="select message.id,user_id,users.username as username ,title,content,create_time,laud,category.id cid,gname from message,category,users where auditing=1 and trash=0 and message.category_id=category.id and message.user_id=users.id order by laud desc limit 0,6";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                messages.add(new Message(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getTimestamp("create_time"),
                        rs.getInt("laud"),
                        new Category(rs.getInt("cid"),rs.getString("gname")))
                );

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, stmt, conn);
        }
        return messages;
    }


    /**
     * 审核通过
     * @param id
     * @return
     */
    public  int  updateAuditing(int id) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num=0;
        try {
            conn = ConnectUtil.getConnection();
            String sql = "update message set auditing=1 where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            num = pstmt.executeUpdate();
            return num;


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, pstmt, conn);
        }
        return  num;
    }

    /**
     * 审核不通过
     * @param id
     * @return
     */
    public  int  stopAuditing(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num=0;
        try {
            conn = ConnectUtil.getConnection();
            String sql = "update message set auditing=-1 where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            num = pstmt.executeUpdate();
            return num;


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectUtil.release(rs, pstmt, conn);
        }
        return num;
    }


}
