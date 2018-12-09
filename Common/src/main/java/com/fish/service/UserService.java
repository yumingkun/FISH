package com.fish.service;

import com.fish.dao.UserDao;
import com.fish.bean.User;
import com.fish.vo.PageVO;

import java.net.URL;
import java.util.List;

public class UserService {

    private UserDao userDao;
    public UserService(){
        userDao=new UserDao();
    }

    /**
     * 前台用户登录
     * @param username 用户名
     * @param password 密码
     * @return 成功返回从数据库查出的用户
     */
    public User login(String username, String password){

        return  userDao.login(username,password);
    }

    /**
     * 前台用户注册
     * @param user
     * @return 添加用户成功返回true
     */
    public Boolean addUser(User user){
        return userDao.addUser(user);
    }

    /**
     * 前台用户上传头像
     * @param url
     * @return
     */
    public Boolean addHead(String url,int id){
        return  userDao.addHead(url,id);
    }


    /**
     * 前台查询指定用户
     * @param id
     * @return
     */
    public User getUser(int id){
        return userDao.getUser(id);
    }



    /**
     * 后台根据用户ID删除用户
     * @param id
     * @return
     */
    public  Boolean deleteUserById(int id){
        return userDao.deleteUserById(id);
    }




    /**
     * 后台查询所有的用户信息
     * @return 所有的用户信息 id username email
     */
    public List<User> getAllUsers(){
        return  userDao.getAllUsers();
    }

    /**
     * 后台分页查询用户
     * @param page 当前页
     * @param recordPage
     * @return
     */
    public PageVO<User> searchUsers(int page, int recordPage){
        // 用于封装分页的信息
        PageVO<User> pageVO=new PageVO<User>();
        //得到用户总数
        int userCount=userDao.countUsers();
        //计算总页数
        int pageCount=((userCount-1)/recordPage)+1;
        //当前页面控制
        if(page<1)page=1;
        if (page>pageCount)page=pageCount;
        //获取当前页的集合
        List<User> users=userDao.searchUsers(page,recordPage);

        //封装分页实体类(存，一个页面的用户，用户数，页数，等)
        pageVO.setPage(page);//当前页
        pageVO.setPageCount(pageCount);//总页数
        pageVO.setRecordCount(recordPage);//总记录数
        pageVO.setRecordOfPage(recordPage);//每页显示多少条
        pageVO.setList(users);//当前页的用户

        System.out.printf(pageVO.toString()+"------------------pageVo");
        return pageVO;
    }

    /**
     * 前台更新指定ID的用户
     */
    public Boolean updateUser(User  user) {
        return userDao.updateUser(user);

    }
    /**
     * 更新用户权限
     * @return
     */
    public  int updatePower(int userId) {
        return userDao.updatePower(userId);
    }


    /**
     * 得到文章数排行前五的作者信息
     * @return
     */
    public  List<User> getUserLimit(){
        return userDao.getUserLimit();
    }
}
