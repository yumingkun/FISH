package com.fish.bean;

import java.util.Date;

public class Message {
    private  int id;
    private int userId;
    private String userName;
    private  String title;
    private String content;
    private Date createTime;
    private int laud;//点赞数量



    private String src;

//    分类
    private Category category;

    public Message(int id, int userId, String userName, String title, String content, Date createTime,int laud, Category category) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.title = title;
        this.category = category;
        this.content = content;
        this.createTime = createTime;
        this.laud=laud;
    }




    public Message() {
    }

    public Message(int userId, String userName, String title, String content) {
        this.userId = userId;
        this.userName = userName;
        this.title = title;
        this.content = content;
    }

    public Message(int id, int userId, String userName, String title, String content, Date createTime) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.title = title;
        this.content = content;
        this.createTime = createTime;
    }

    public Message(int id, int userId, String userName, String title, String content, Date createTime, int category) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.title = title;

        this.content = content;
        this.createTime = createTime;

    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Category getCategory() {

        return category;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }
    public void setLaud(int laud) {
        this.laud = laud;
    }

    public int getLaud() {

        return laud;
    }
}
