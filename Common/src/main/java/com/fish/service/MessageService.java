package com.fish.service;

import com.fish.dao.MessageDao;
import com.fish.bean.Message;
import com.sun.xml.internal.ws.api.model.MEP;

import java.util.Date;
import java.util.List;

public class MessageService {
    private MessageDao messageDao;
    public MessageService(){
        messageDao=new MessageDao();
    }


    /**
     * 查询部分文章
     * @param start （开始位置）从点击数*6个
     * @param count 每页数量
     * @return
     */
    public List<Message> getMessages(int start, int count)   {
        // 得到messages
        return messageDao.getMessageList(start,count);
    }

    /**
     * 查询用户所有的文章
     * @param id
     * @return
     */
    public List<Message> getUserMessageList(int id){
        return  messageDao.getUserMessageList(id);
    }


    /**
     * 查询当前用户在回收站的文章
     * @param id
     * @return
     */
    public List<Message> getTrash(int id){
        return messageDao.getTrash(id);
    }

    /**
     * 计算所有文章数量
     * @return

     */
    public  int countMessage() {

        return messageDao.countMessages();
    }




    /**
     * 新建留言
     * @param message
     * @return
     */
    public int addMessage(Message message,int category_id){
        message.setCreateTime(new Date());
        return messageDao.addMessage(message,category_id);
    }

    /**
     * 通过文章id查询文章详情
     * @param id 文章id
     * @return 一个文章
     */
    public Message getMessageById(int id){
        return messageDao.getMessageById(id);
    }


    /**
     * 根据关键词，查找文章
     * @param search
     * @return
     */
    public List<Message> searchMessages(String search){
        return messageDao.searchMessages(search);
    }

    /**
     * 通过指定文章id放入回收站
     * @param id
     * @return
     */
    public Boolean trash(int id){
        return  messageDao.trash(id);
    }


    /**
     * 通过指定文章id恢复文章
     * @param id 文章ID
     * @return
     */
    public Boolean restore(int id){
        return messageDao.restore(id);
    }

    /**
     *彻底删除指定文章
     * @param id
     * @return
     */
    public Boolean trashDelete(int id){
        return messageDao.trashDelete(id);
    }


    /**
     * 前台根据分类id查询相应的文章
     * @param id
     * @return
     */
    public List<Message> getMessagesByCategoryId(int id){
        return messageDao.getMessagesByCategoryId(id);

    }


    /**
     * 前台更新文章内容
     * @param message
     * @return
     */
    public Boolean updateMessage(Message message,int category_id){
        return messageDao.updateMessage(message,category_id);
    }


}
