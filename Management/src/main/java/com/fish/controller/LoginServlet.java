package com.fish.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/login.do","/notLogin.do"})//处理登录和没有登录两种情况
public class LoginServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if ("/login.do".equals(req.getServletPath())) {//登录请求
//         获取前端传来的数据
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            System.out.printf(password + "------------------------------------------");
//         后台默认用户名和密码（设定为死）
            if ("root".equals(username) && "root".equals(password)) {
                req.getSession().setAttribute("username", username);//把登录的后台管理员储存在回话里（为了进行是否登录状态的判断）
                req.getRequestDispatcher("/WEB-INF/views/management.jsp").forward(req,resp);//重定向到后台主页面
            } else {
                req.getRequestDispatcher("/notLogin.do").forward(req, resp);
            }
        } else if ("/notLogin.do".equals(req.getServletPath())) {//过滤器判断为未登录时，自动跳转到登录页面
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
        }
    }
}