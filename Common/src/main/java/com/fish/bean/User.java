package com.fish.bean;


public class User {


    //类型         类型名       类型解释
    private int id;           //用户id
    private String username;  //用户名
    private String password;  //用户密码
    private String email;     //邮箱
    private String head;      //头像路径
    private String power;     //权限 0用户 1管理员 2超级管理员



    public User() {
    }

    public User(int id, String username, String password, String email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", head='" + head + '\'' +
                '}';
    }

    public User(int id, String username, String password, String email, String head) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.head = head;
    }

    public User(int id, String username, String password, String email, String head,String power) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.head = head;
        this.power=power;
    }

    public User(int id, String username, String email) {
        this.id = id;
        this.username = username;
        this.email = email;
    }

    public void setPower(String power) {
        this.power = power;
    }

    public String getPower() {

        return power;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }
}