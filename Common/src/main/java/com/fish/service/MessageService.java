package com.fish.service;

import com.fish.dao.MessageDao;
import com.fish.entity.Message;

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



}
