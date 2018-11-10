package com.fish.bean;

import java.util.Date;

/**
 * 轮播图实体
 */
public class Carousel {
    private int id;
    private String imgLoc;

    private Date createTime;

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
