package com.show.controller;

import com.fish.bean.User;
import com.fish.service.UserService;
import org.apache.log4j.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/show/toLogin.do","/show/login.do","/show/register.do","/show/quit.do","/show/editUser.do","/show/toRegister","/show/user.do"})
public class UserServlet extends HttpServlet {
    private static Logger logger = Logger.getLogger(MessageServlet.class);
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
        if ("/show/login.do".equals(req.getServletPath())) {
            String username = req.getParameter("username");
            String password = req.getParameter("password");

            getServletConfig();

            //接收form传来的记住我
            String remember = req.getParameter("ok");
            //创建一个cookie，存放制定值
            Cookie nameCookie = new Cookie("username", username);
            Cookie passwordCookie = new Cookie("password", password);
            //设置失效时间
            if (null != remember && "ok".equals(remember)) {
                nameCookie.setMaxAge(7 * 24 * 60 * 60);
                passwordCookie.setMaxAge(7 * 24 * 60 * 60);
            } else {
                nameCookie.setMaxAge(0);
                passwordCookie.setMaxAge(0);
            }
            //将Cookie存放到response中
            resp.addCookie(nameCookie);
            resp.addCookie(passwordCookie);


            User user = userService.login(username, password);//成功则返回一个用户实体
            if (user != null) {
                req.getSession().setAttribute("user", user);//登录成功，把用户信息放到会话里
                req.getRequestDispatcher("/show/message.do").forward(req, resp);
            } else {
                req.setAttribute("msg_l", "Fail");
                req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
            }
        }else if ("/show/toLogin.do".equals(req.getServletPath())){
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
        //注册处理
        }else if ("/show/toRegister".equals(req.getServletPath())){
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req,resp);
        } else if("/show/register.do".equals(req.getServletPath())){

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
                if(userService.addUser(user)){//添加用户成功后返回true
                    System.out.printf("注册成功--------");
                    req.setAttribute("msg_r","Success");
                    req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req,resp);
                }
            }else{
                System.out.printf("注册失败======================================");
                req.setAttribute("msg_r","Fail");
                req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req,resp);
            }
        //登出
        }else if ("/show/quit.do".equals(req.getServletPath())) {
            req.getSession().setAttribute("user", "");
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
        // 个人中心
        }else if ("/show/user.do".equals(req.getServletPath())){
            User user=(User)req.getSession().getAttribute("user");
            int  id=user.getId();
            User  myself=userService.getUser(id);
            if (myself!=null){
                req.setAttribute("user",myself);
                req.getRequestDispatcher("/WEB-INF/views/user.jsp").forward(req,resp);
            }else {
                System.out.println("个人中心的servlet错误===============================================");
                req.getRequestDispatcher("/WEB-INF/error/404.jsp").forward(req,resp);
            }

        //修改用户信息
        }else if ("/show/editUser.do".equals(req.getServletPath())){
            int userid=Integer.parseInt(req.getParameter("userId"));
            String username=req.getParameter("username");
            String password=req.getParameter("password");
            String email=req.getParameter("email");

            User user=new User();
            user.setId(userid);
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);


            Boolean updateUserResult=userService.updateUser(user);
            logger.info(updateUserResult);
            if (updateUserResult){//修改成功后条转到个人中心
                // 更新会话信息
//                User userSession=userService.login(username,password);//成功则返回一个用户实体
//                req.getSession().setAttribute("user",userSession);//修改信息成功，更新会话
                req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req,resp);
            }

            req.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(req,resp);
        }
    }
}
