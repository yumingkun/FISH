package com.fish.controller;

import com.fish.bean.User;
import com.fish.service.UserService;
import com.fish.vo.PageVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import org.apache.log4j.Logger;

//后台分页获取的users
@WebServlet({"/manage/getUsers.do","/manage/delete.do"})
public class UsersServlet extends HttpServlet {
    private UserService userService;
    private static  Logger logger = Logger.getLogger(UsersServlet.class);
    @Override
    public void init() throws ServletException {
        super.init();
        userService=new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if ("/manage/getUsers.do".equals(req.getServletPath())){
            //1 获取请求参数-分页
            int recordOfPage = 10;//每页10条记录
            int page = 1;//默认第一页
            if(req.getParameter("page")!=null){
                page = Integer.parseInt(req.getParameter("page"));
            }
            //2 调用业务逻辑
            PageVO<User> pageVO = userService.searchUsers(page,recordOfPage);//（里面封装的是用户分页信息）
            List<User> userList = pageVO.getList();
            //3 数据传递和页面导航
            if (userList!=null){
                req.setAttribute("userList", userList);//每页的用户
                req.setAttribute("pageVO", pageVO);//分页的信息
                req.getRequestDispatcher("/WEB-INF/views/usersShow.jsp").forward(req, resp);
            }else {
                req.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(req,resp);
            }
        }else if("/manage/delete.do".equals(req.getServletPath())){
            int userId=Integer.parseInt(req.getParameter("userId"));
//          logger.info("userid"+userId);
//            根据用户Id删除用户o
            Boolean delete=userService.deleteUserById(userId);
            logger.info(delete);
            if (delete){
                req.getRequestDispatcher("getUsers.do").forward(req, resp);
            }

        }


    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
