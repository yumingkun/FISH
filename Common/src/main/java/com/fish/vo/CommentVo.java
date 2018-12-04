package com.fish.vo;

import java.util.Date;

public class CommentVo {
//    select users.id 评论者id,`comment`.id 评论的id, users.username 评论的人 ,message.title 评论的文章, `comment`.content 评论内容,`comment`.create_time from 	`comment`,message,users  where users.id=`comment`.user_id  and `comment`.message_id=message.id and message.user_id=8 ORDER BY `comment`.create_time DESC

    private int id;//评论id
    private  int userId;//评论者的ID
    private  int commentId;//评论的ID
    private String username;//评论的人
    private String title;//评论的文章标题
    private String content;//评论的内容
    private Date time;//评论的时间

    public CommentVo() {
    }

    public CommentVo(int userId, int commentId, String username, String title, String content, Date time) {
        this.userId = userId;
        this.commentId = commentId;
        this.username = username;
        this.title = title;
        this.content = content;
        this.time = time;
    }

    public int getUserId() {
        return userId;
    }

    public int getCommentId() {
        return commentId;
    }

    public String getUsername() {
        return username;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public Date getTime() {
        return time;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
