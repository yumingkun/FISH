package com.fish.bean;

import java.util.Date;

public class Message {


    //类型         类型名       类型解释
    private  int id;           //id
    private int userId;        //评论者ID
    private  String title;     //标题
    private String content;    //内容
    private Date createTime;   //创建时间
    private int laud;          //点赞数量
    private String src;        //文章提取出的第一张图片
    private Category category; //文章分类
    private int auditing;      //审核状态
    private String userName;   //

    public Message(int id, int userId, String userName,  String title, String content, Date createTime,int laud, Category category) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.title = title;
        this.category = category;
        this.content = content;
        this.createTime = createTime;
        this.laud=laud;
    }

    public Message(int id, int userId, String userName,  String title, String content, Date createTime,int laud, int auditing,Category category) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.title = title;
        this.category = category;
        this.content = content;
        this.createTime = createTime;
        this.auditing= auditing;
        this.laud=laud;
    }


    public Message() {
    }


    public int getAuditing() {
        return auditing;
    }

    public void setAuditing(int auditing) {
        this.auditing = auditing;
    }
    public Message(int userId, String userName, String title, String content) {
        this.userId = userId;
        this.userName = userName;
        this.title = title;
        this.content = content;
    }

    public Message(int id, int userId, String userName,String title, String content, Date createTime) {
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
