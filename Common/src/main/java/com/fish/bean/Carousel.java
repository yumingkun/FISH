package com.fish.bean;

import java.util.Date;

/**
 * 轮播图实体
 */
public class Carousel {

    //类型         类型名       类型解释
    private int id;            //id
    private String imgLoc;     //图片上传路径
    private Date createTime;   //上传时间

    public Carousel(int id, String imgLoc, Date createTime) {
        this.id = id;
        this.imgLoc = imgLoc;
        this.createTime = createTime;
    }

    public Carousel() {
    }

    public int getId() {
        return id;
    }

    public String getImgLoc() {
        return imgLoc;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setImgLoc(String imgLoc) {
        this.imgLoc = imgLoc;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
