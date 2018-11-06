package com.show.controller;

import com.fish.bean.Comment;
import com.fish.bean.Message;
import com.fish.bean.User;
import com.fish.service.CommentService;
import com.fish.service.MessageService;
import com.fish.service.UserService;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//文章详情servlet
@WebServlet("/show/detail.do")
public class DetailServlet extends HttpServlet {
    private MessageService messageService;
    private UserService userService;
    private CommentService commentService;
    private static Logger logger = Logger.getLogger(MessageServlet.class);
    @Override
    public void init() throws ServletException {
        super.init();
        messageService=new MessageService();
        userService=new UserService();
        commentService=new CommentService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.valueOf(req.getParameter("id"));//获取前端传来的文章id
        int userId=Integer.valueOf(req.getParameter("userId"));//获取每个文章的用户ID

        Message message=messageService.getMessageById(id);
        User user=userService.getUser(userId);
        int countComment=commentService.countComment(id);//根据文章ID查询此文章的评论的个数
        List<Comment> comments=commentService.getCommentByMessageId(id);//根据文章的id查询comment和user（评论人）表

//        logger.info(comments);

        if (message!=null && user!=null){
            req.setAttribute("message",message);//文章详细信息
            req.setAttribute("user",user);//此文章作者信息
            req.setAttribute("countComment",countComment);//评论个数
            req.setAttribute("allComment",comments);//所有的评论
            System.out.printf("messageDetail-----------------------------------成功");
            req.getRequestDispatcher("/WEB-INF/views/messageDetail.jsp").forward(req,resp);
        }else {
            System.out.printf("messageDetail-----------------------------------失败");
            req.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(req,resp);
        }

    }
}
