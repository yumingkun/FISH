package com.show.servlet;

import com.fish.entity.Message;
import com.fish.entity.User;
import com.fish.service.MessageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

//处理文章的写入
@WebServlet({"/show/addMessage.do"})
public class addMessageServlet extends HttpServlet {
    private MessageService messageService;

    @Override
    public void init() throws ServletException {
        super.init();
        messageService=new MessageService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathName=request.getServletPath();//获取url
        if(Objects.equals("/show/addMessage.do",pathName)){//点击添加post过来的数据
            User user=(User)request.getSession().getAttribute("user");//根据用户是否登录，来做选择
            if (null==user){//如果没有登录，可以看留言但是不能写留言
                request.getRequestDispatcher("/show/login.do").forward(request,response);
            }else {//如果登录了，拿到前端传来的数据
                String title=request.getParameter("title");
                String content=request.getParameter("content");
//                System.out.println(title+content);
                boolean result=messageService.addMessage(new Message((int)user.getId(),user.getUsername(),title,content));//进行数据保存数据库
                if (result){//用户添加文章 成功
                    request.getRequestDispatcher("/WEB-INF/views/success.jsp").forward(request,response);
                }else {
                    request.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(request,response);
                }
            }

        }else {
            request.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(request,response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathName=request.getServletPath();//获取url

        System.out.println("进入留言");
        if (Objects.equals("/addMessagePrompt.do",pathName)){// 点击留言进入的页面
            request.getRequestDispatcher("/WEB-INF/views/biz/add_message.jsp").forward(request,response);

        }else {
            request.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(request,response);
        }



    }
}
