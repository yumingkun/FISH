package com.show.controller;
/*
分类
 */
import com.fish.bean.Category;
import com.fish.bean.Message;
import com.fish.service.CategoryService;
import com.fish.service.MessageService;
import com.fish.utils.GetImgStr;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/show/oneCategory.do"})
public class CategoryShowServlet extends HttpServlet {
    private static Logger logger = Logger.getLogger(MessageServlet.class);
    private CategoryService categoryService;
    private MessageService messageService;
    @Override
    public void init() throws ServletException {
        super.init();
        categoryService=new CategoryService();
        messageService=new MessageService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //点击专题下面的专题
       if ("/show/oneCategory.do".equals(request.getServletPath())){
          int cid=Integer.parseInt(request.getParameter("cid"));//获取前端的分类id
           List<Message> messages=messageService.getMessagesByCategoryId(cid);

           //提取每篇文章的第一个src
           List<Message> messageSrcs=new ArrayList<>();
           for (Message message:messages) {
               message.setSrc(GetImgStr.getImgStr(message.getContent()));
               messageSrcs.add(message);
           }

           //获得所有的分类
           List<Category> categories=categoryService.getCategoryList();

           if (messages!=null){
               request.setAttribute("messages",messageSrcs);
               request.setAttribute("categories",categories);
               request.setAttribute("count",messages.size());
               request.setAttribute("show",1);
               request.getRequestDispatcher("/WEB-INF/views/allMessage.jsp").forward(request,response);
           }

       }
    }
}
