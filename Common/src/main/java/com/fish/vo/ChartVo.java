package com.fish.vo;

public class ChartVo {
    private  String username;//用户名
    private int num;//文章数

    public ChartVo(String username, int num) {
        this.username = username;
        this.num = num;
    }

    public String getUsername() {
        return username;
    }

    public int getNum() {
        return num;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
