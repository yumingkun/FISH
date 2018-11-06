package com.show.controller;

import com.fish.bean.Comment;
import com.fish.bean.User;
import com.fish.service.CommentService;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/show/addComment.do"})
public class CommentsServlet extends HttpServlet {
    private CommentService commentService;


    private static Logger logger = Logger.getLogger(MessageServlet.class);
    @Override
    public void init() throws ServletException {
        super.init();
        commentService=new CommentService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(request, resp);

        //（写评论）添加文章的评论，只有登录的时候才能写评论
        if ("/show/addComment.do".equals(request.getServletPath())){
//            获取当前评论所属的文章ID
            int messageId=Integer.parseInt(request.getParameter("messageId"));
//            logger.info(messageId);
//            获取当前评论人的user_id
            User user = (User) request.getSession().getAttribute("user");
            int userid = user.getId();
//            获取ajax传来的content(评论内容)
            String content=request.getParameter("content");
//            logger.info(content+id+messageId);

            Comment comment=new Comment();
            comment.setUserId(userid);
            comment.setMessageId(messageId);
            comment.setContrent(content);

//            把评论插入数据库获
            Boolean ment=commentService.addComment(comment);
            if (ment){
                System.out.printf("添加评论成功");
            }else {
                System.out.printf("添加评论失败");
            }


        }
    }
}
