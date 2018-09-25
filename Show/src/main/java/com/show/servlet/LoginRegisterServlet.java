package com.show.servlet;

import com.fish.entity.User;
import com.fish.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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

            //接收form传来的记住我
            String remember=req.getParameter("ok");
            //创建一个cookie，存放制定值
            Cookie nameCookie = new Cookie("username", username);
            Cookie passwordCookie = new Cookie("password", password);
            //设置失效时间
            if (null!=remember && "ok".equals(remember)){
                nameCookie.setMaxAge(7*24*60*60);
                passwordCookie.setMaxAge(7*24*60*60);
            }else {
                nameCookie.setMaxAge(0);
                passwordCookie.setMaxAge(0);
            }
            //将Cookie存放到response中
            resp.addCookie(nameCookie);
            resp.addCookie(passwordCookie);


            User user=userService.login(username,password);//成功则返回一个用户实体
//            System.out.printf(user.toString());
            if (user!=null){
                System.out.printf("doPost成功------------------------");
                req.getSession().setAttribute("user",user);//登录成功，把用户信息放到会话里
                req.getRequestDispatcher("/show/message.do").forward(req,resp);
            }else {
                System.out.printf("登录失败-------------------------------------");//继续登录
                req.setAttribute("msg_l","Fail");
                req.getRequestDispatcher("/WEB-INF/views/login_register.jsp").forward(req,resp);
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
                req.setAttribute("msg_r","Fail");
                req.getRequestDispatcher("/WEB-INF/views/login_register.jsp").forward(req,resp);
            }

        }
    }
}
