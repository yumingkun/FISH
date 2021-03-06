package com.fish.service;

import com.fish.bean.Follow;
import com.fish.bean.User;
import com.fish.dao.FollowDao;
import com.fish.utils.ConnectUtil;

import java.sql.Connection;
import java.util.List;

public class FollowService {

    private FollowDao followDao;

    public FollowService(){
        followDao=new FollowDao();
    }

    /**
     * 当前用户点击添加关注
     * @param userId 当前用户
     * @param followId 所要关注的用户
     * @return
     */
    public int addFollow(int userId,int followId){
        return followDao.addFollow(userId,followId);
    }

    /**
     * 取消关注
     * @param userId 用户
     * @param followId 关注的人
     * @return
     */
    public int updateFollow(int userId,int followId){
        return  followDao.updateFollow(userId,followId);
    }

    /**
     * 再次关注
     * @param userId 用户
     * @param followId 关注的人
     * @return
     */
    public int addFollowTwo(int userId,int followId){
        return followDao.addFollowTwo(userId,followId);
    }

    /**
     * 根据用户id和关注着id查看关注状态
     * @return
     */
    public Follow getFollow(int userId, int followId){
        return followDao.getFollow(userId,followId);
    }


    /**
     * 根据当前用户id获得他关注的所有用户
     * @param userId
     * @return
     */
    public List<User> getFollowUsers(int userId){
        return followDao.getFollowUsers(userId);
    }


    /**
     * 获得当前用户的全部粉丝
     * @param follow_user_id
     * @return
     */
    public List<User> getFans(int follow_user_id) {
        return followDao.getFans(follow_user_id);
    }

    /**
     * 判断用户之前是否关注过，如果是关注过是update status=1 而不是再插入一条关注
     * @param userId
     * @param followId
     * @return
     */
    public int checkFollow(int userId, int followId) {
        return followDao.checkFollow(userId,followId);
    }


    /**
     * 查询当前用户的关注数
     * @param userId
     * @return
     */
    public  int getFollowNum(int userId){
        return followDao.getFollowNum(userId);
    }

    /**
     * 查询当前用户的粉丝数
     * @param userId
     * @return
     */
    public  int getFanNum(int userId){
        return followDao.getFanNum(userId);
    }

}
