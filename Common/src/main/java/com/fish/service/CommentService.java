package com.fish.service;

import com.fish.bean.Comment;
import com.fish.dao.CommentDao;

import java.util.Date;
import java.util.List;

public class CommentService {


    private CommentDao commentDao;
    public CommentService(){
        commentDao=new CommentDao();
    }
    /**
     * 返回插入评论结果
     * @param comment
     * @return
     */
    public Boolean addComment(Comment comment){

//        设置评论时间
        comment.setCreate_time(new Date());
        return commentDao.addComment(comment);
    }

    /**
     * 根据文章ID查询此文章有多少评论
     * @param messageId
     * @return
     */
    public int countComment(int messageId){

        return commentDao.countComment(messageId);
    }


    /**
     * 通过文章Id查询此文章所有的评论，以及评论者的部分信息
     * @param messageId
     * @return
     */
    public List<Comment> getCommentByMessageId(int messageId){
        return commentDao.getCommentByMessageId(messageId);
    }
}
