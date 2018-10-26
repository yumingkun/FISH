package com.fish.bean;


public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private String head;



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

    public User(int id, String username, String email) {
        this.id = id;
        this.username = username;
        this.email = email;
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