package com.show.servlet;

import com.fish.entity.Message;
import com.fish.service.MessageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//文章详情servlet
@WebServlet("/show/detail.do")
public class DetailServlet extends HttpServlet {
    private MessageService messageService;
    @Override
    public void init() throws ServletException {
        super.init();
        messageService=new MessageService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.valueOf(req.getParameter("id"));//获取前端传来的文章id
        Message message=messageService.getMessageById(id);
        System.out.printf(message.toString());
        if (message!=null){
            req.setAttribute("message",message);
            System.out.printf("messageDetail-----------------------------------成功");
            req.getRequestDispatcher("/WEB-INF/views/messageDetail.jsp").forward(req,resp);
        }else {
            System.out.printf("messageDetail-----------------------------------失败");
            req.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(req,resp);
        }

    }
}
