package com.fish.vo;

public class CategoryVo {
    private String gname;
    private int num;

    public CategoryVo() {
    }

    public CategoryVo(String gname, int num) {
        this.gname = gname;
        this.num = num;
    }

    public String getGname() {
        return gname;
    }

    public int getNum() {
        return num;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "CategoryVo{" +
                "gname='" + gname + '\'' +
                ", num=" + num +
                '}';
    }
}
