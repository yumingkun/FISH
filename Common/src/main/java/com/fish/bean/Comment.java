package com.fish.bean;

import java.util.Date;

//评论
public class Comment {
    // id user_id message_id content laud create_time
    private int id;
    private int userId;
    private int messageId;
    private String contrent;
    private int laud;//赞
    private Date create_time;

    private User user;//此文章评论者的信息

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser() {

        return user;
    }

    public Comment() {
    }

    public Comment(int id, int userId, int messageId, String contrent, int laud, Date create_time, User user) {
        this.id = id;
        this.userId = userId;
        this.messageId = messageId;
        this.contrent = contrent;
        this.laud = laud;
        this.create_time = create_time;
        this.user = user;
    }

    public Comment(int id, int userId, int messageId, String contrent, int laud, Date create_time) {
        this.id = id;
        this.userId = userId;
        this.messageId = messageId;
        this.contrent = contrent;
        this.laud = laud;
        this.create_time = create_time;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", userId=" + userId +
                ", messageId=" + messageId +
                ", contrent='" + contrent + '\'' +
                ", laud=" + laud +
                ", create_time=" + create_time +
                '}';
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public int getMessageId() {
        return messageId;
    }

    public String getContrent() {
        return contrent;
    }

    public int getLaud() {
        return laud;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public void setContrent(String contrent) {
        this.contrent = contrent;
    }

    public void setLaud(int laud) {
        this.laud = laud;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }
}
