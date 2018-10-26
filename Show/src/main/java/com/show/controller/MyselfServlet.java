package com.show.controller;


import com.fish.bean.User;
import com.fish.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//个人中心
@WebServlet("/show/myself.do")
public class MyselfServlet extends HttpServlet {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user=(User)request.getSession().getAttribute("user");
        int  id=user.getId();
        User  myself=userService.getUser(id);
        if (myself!=null){
            request.setAttribute("user",myself);
            request.getRequestDispatcher("/WEB-INF/views/myself.jsp").forward(request,response);
        }else {
            System.out.println("个人中心的servlet错误===============================================");
            request.getRequestDispatcher("/WEB-INF/error/404.jsp").forward(request,response);
        }


    }
}
