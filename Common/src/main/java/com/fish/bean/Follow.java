package com.fish.bean;

/**
 * 关注和粉丝表
 */
public class Follow {
    private int id;
    private int userId;//粉丝
    private int fllowUserId;//关注的用户id
    private String status;//关注状态

    public Follow(int id, int userId, int fllowUserId, String status) {
        this.id = id;
        this.userId = userId;
        this.fllowUserId = fllowUserId;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Follow() {
    }

    public Follow(int userId, int fllowUserId) {
        this.userId = userId;
        this.fllowUserId = fllowUserId;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public int getFllowUserId() {
        return fllowUserId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setFllowUserId(int fllowUserId) {
        this.fllowUserId = fllowUserId;
    }

    @Override
    public String toString() {
        return "Follow{" +
                "id=" + id +
                ", userId=" + userId +
                ", fllowUserId=" + fllowUserId +
                '}';
    }
}
