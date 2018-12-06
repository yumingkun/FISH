package com.management.controller;

import com.fish.bean.User;
import com.fish.service.MessageService;
import com.fish.service.UserService;
import com.fish.vo.ChartVo;
import com.fish.vo.PageVO;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//后台分页获取的users
@WebServlet({"/manage/login.do","/manage/toLogin.do","/manage/getUsers.do","/manage/delete.do","/manage/quit.do","/manage/updatePower.do"})
public class UsersServlet extends HttpServlet {
    private UserService userService;
    private MessageService messageService;
    private static  Logger logger = Logger.getLogger(UsersServlet.class);
    @Override
    public void init() throws ServletException {
        super.init();
        messageService=new MessageService();
        userService=new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if ("/manage/login.do".equals(req.getServletPath())) {//登录请求
            String username = req.getParameter("username");
            String password = req.getParameter("password");

            User manageUser=userService.login(username,password);
            String power=manageUser.getPower();
            if (manageUser!=null && manageUser.getUsername().length()>=6 ){
                if ("1".equals(power) || "2".equals(power)){
                    req.getSession().setAttribute("manageUser",manageUser);
                    req.getRequestDispatcher("/admin/views/index.jsp").forward(req,resp);//重定向到后台主页面
                }else if ("0".equals(power)){
                    req.setAttribute("result","权限不足");
                    req.getRequestDispatcher("/manage/toLogin.do").forward(req, resp);
                }else {
                    req.setAttribute("result","信息错误");
                    req.getRequestDispatcher("/manage/toLogin.do").forward(req, resp);
                }

            } else {
                req.setAttribute("result","信息错误");
                req.getRequestDispatcher("/manage/toLogin.do").forward(req, resp);
            }
        } else if ("/manage/toLogin.do".equals(req.getServletPath())) {//过滤器判断为未登录时，自动跳转到登录页面
            req.getRequestDispatcher("/admin/views/login.jsp").forward(req, resp);

        }else if ("/manage/getUsers.do".equals(req.getServletPath())){
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
                req.getRequestDispatcher("/admin/views/usersShow.jsp").forward(req, resp);
            }else {
                req.getRequestDispatcher("/admin/views//error/404.jsp").forward(req,resp);
            }
        }else if("/manage/delete.do".equals(req.getServletPath())){
            int userId=Integer.parseInt(req.getParameter("userId"));
            Boolean delete=userService.deleteUserById(userId);
            if (delete){
                req.setAttribute("delete",1);
                req.getRequestDispatcher("getUsers.do").forward(req, resp);
            }else {
                req.setAttribute("delete",0);
                req.getRequestDispatcher("getUsers.do").forward(req, resp);

            }

        }else if ("/manage/quit.do".equals(req.getServletPath())){
            req.getSession().setAttribute("manageUser",null);
            req.getRequestDispatcher("/manage/toLogin.do").forward(req, resp);
        }else if("/manage/updatePower.do".equals(req.getServletPath())){
            int userId=Integer.parseInt(req.getParameter("userId"));
            int result=userService.updatePower(userId);
            if (result>0){
                req.setAttribute("updatePower",1);
                req.getRequestDispatcher("/manage/getUsers.do").forward(req, resp);
            }
        }
    }
}
