package com.fish.service;

import com.fish.dao.UserDao;
import com.fish.entity.User;

public class UserService {

    private UserDao userDao;
    public UserService(){
        userDao=new UserDao();
    }

    /**
     * 用户登录
     * @param username 用户名
     * @param password 密码
     * @return 成功返回从数据库查出的用户
     */
    public User login(String username, String password){

        return  userDao.login(username,password);
    }

    /**
     * 用户注册
     * @param user
     * @return 添加用户成功返回true
     */
    public Boolean addUser(User user){
        return userDao.addUser(user);
    }
}
