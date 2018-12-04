package com.show.controller;

import com.fish.bean.User;
import com.fish.service.FollowService;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/show/addFollow.do","/show/updateFollow.do","/show/addFollowTwo.do","/show/toFollow.do","/show/toFan.do"})
public class FollowServlet extends HttpServlet {

    private static Logger logger = Logger.getLogger(FollowServlet.class);
    private FollowService followService;

    @Override
    public void init() throws ServletException {
        super.init();
        followService=new FollowService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user =(User)request.getSession().getAttribute("user");
        //添加关注insert
        if ("/show/addFollow.do".equals(request.getServletPath())){
            int followId=Integer.parseInt(request.getParameter("followId"));

            //判断是第一次关注（insert）还是第二次关注(update )
            int check=followService.checkFollow(user.getId(),followId);
            logger.info(user.getId());
            logger.info(followId);
            logger.info(check);
            if (check>0){ //第二次关注//update
                int result=followService.addFollowTwo(user.getId(),followId);
                if (result>0){
                    response.getWriter().write("已关注");
                }else {
                    response.getWriter().write("关注失败");
                }
            }else { //第一次关注 insert
                int result=followService.addFollow(user.getId(),followId);
                if (result>0){
                    response.getWriter().write("已关注");
                }else {
                    response.getWriter().write("关注失败");
                }
            }


         //取消关注
        }else if ("/show/updateFollow.do".equals(request.getServletPath())){
            int followId=Integer.parseInt(request.getParameter("followId"));

            int result=followService.updateFollow(user.getId(),followId);
            if (result>0){
                response.getWriter().write("已取消关注");
            }else {
                response.getWriter().write("取消关注失败");
            }
         //再次关注update
        }else if ("/show/addFollowTwo.do".equals(request.getServletPath())){
            int followId=Integer.parseInt(request.getParameter("followId"));
            int result=followService.addFollowTwo(user.getId(),followId);
            if (result>0){
                response.getWriter().write("已关注");
            }else {

            }
        //我的关注
        }else if ("/show/toFollow.do".equals(request.getServletPath())){
            int userid=user.getId();
            List<User> userfollows=followService.getFollowUsers(userid);
            request.setAttribute("userfollows",userfollows);
            request.getRequestDispatcher("/WEB-INF/views/userFollow.jsp").forward(request,response);

        }else if ("/show/toFan.do".equals(request.getServletPath())){
            int userid=user.getId();
            List<User> userfans=followService.getFans(userid);
            request.setAttribute("userfans",userfans);
            request.getRequestDispatcher("/WEB-INF/views/userFan.jsp").forward(request,response);

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
