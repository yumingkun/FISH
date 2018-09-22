package com.show.servlet;

import com.fish.entity.User;
import com.fish.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/show/login.do","/show/register.do"})
public class LoginRegisterServlet extends HttpServlet {
    private UserService userService;
    @Override
    public void init() throws ServletException {
        super.init();
        userService=new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //登录处理
        if ("/show/login.do".equals(req.getServletPath())){
            String username=req.getParameter("username");
            String password=req.getParameter("password");
            User user=userService.login(username,password);//成功则返回一个用户实体
            if (null!=user){
                System.out.printf("doPost成功------------------------");
                req.getSession().setAttribute("user",user);//登录成功，把用户信息放到会话里
                req.getRequestDispatcher("/show/message.do").forward(req,resp);
            }else {
                System.out.printf("登录失败");//继续登录
                req.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(req,resp);
            }
        //注册处理
        }else if("/show/register.do".equals(req.getServletPath())){

            //获取前端传来的数据
            String username=req.getParameter("username");
            String password=req.getParameter("password");
            String email=req.getParameter("email");
//            System.out.printf(username+password+email+"8888888888888888888888888888888888888");
            boolean isEmpty=(username!=null && password!=null  && email!=null );
            if (isEmpty){
                User user=new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setEmail(email);
                if(userService.addUser(user)){//添加用户成功后悔返回true
                    System.out.printf("注册成功--------");
                    req.getRequestDispatcher("/WEB-INF/views/success.jsp").forward(req,resp);
                }
            }else{
                System.out.printf("注册失败======================================");
                req.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(req,resp);
            }

        }
    }
}
