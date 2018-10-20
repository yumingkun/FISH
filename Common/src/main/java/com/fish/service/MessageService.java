package com.fish.service;

import com.fish.dao.MessageDao;
import com.fish.bean.Message;

import java.util.Date;
import java.util.List;

public class MessageService {
    private MessageDao messageDao;
    public MessageService(){
        messageDao=new MessageDao();
    }


    /**
     * 分页查询所有留言
     * @param page 当前页码
     * @param pageSize 每页数量
     * @return
     */
    public List<Message> getMessages(int page, int pageSize)   {
        // 得到messages
        return messageDao.getMessageList(page,pageSize);
    }

    /**
     * 计算所有留言数量
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
    public boolean addMessage(Message message){
        message.setCreateTime(new Date());
        return messageDao.save(message);
    }

    /**
     * 通过文章id查询文章详情
     * @param id 文章id
     * @return 一个文章
     */
    public Message getMessageById(int id){
        return messageDao.getMessageById(id);
    }
}
