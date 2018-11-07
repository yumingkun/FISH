package com.fish.bean;

/**
 * 分类 id gname
 */
public class Category {
    private int id;//分类编号
    private String gname;//分类编号对应的分类名

    public Category() {
    }

    public Category(int id) {

        this.id = id;
    }

    public Category(int id, String gname) {
        this.id = id;
        this.gname = gname;
    }

    public int getId() {
        return id;
    }

    public String getGname() {
        return gname;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", gname='" + gname + '\'' +
                '}';
    }
}
