package com.show.controller;

import com.fish.bean.Category;
import com.fish.bean.Message;
import com.fish.bean.User;
import com.fish.service.CategoryService;
import com.fish.service.MessageService;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

//处理文章的写入
@WebServlet({"/show/addMessage.do"})
public class addMessageServlet extends HttpServlet {
    private static Logger logger = Logger.getLogger(addMessageServlet.class);
    private MessageService messageService;
    private CategoryService categoryService;



    @Override
    public void init() throws ServletException {
        super.init();
        messageService=new MessageService();
        categoryService=new CategoryService();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathName=request.getServletPath();//获取url

        System.out.println("进入");
        //获取所有专题

        if (Objects.equals("/addMessagePrompt.do",pathName)){// 点击写文章进入的页面
            request.getRequestDispatcher("/WEB-INF/views/biz/add_message.jsp").forward(request,response);

        }else {
            request.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(request,response);
        }



    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //添加文章
        if("/show/addMessage.do".equals(request.getServletPath())){//点击添加post过来的数据
            User user=(User)request.getSession().getAttribute("user");//根据用户是否登录，来做选择

            if (null==user){//如果没有登录，可以看留言但是不能写留言
                request.getRequestDispatcher("/show/login.do").forward(request,response);
            }else {//如果登录了，拿到前端传来的数据
                String title=request.getParameter("title");
                String content=request.getParameter("content");
                int categoryId=Integer.parseInt(request.getParameter("categoryId"));//获取文章修改之后的分类Id

                logger.info(title.length()+"-----------");
                logger.info(content.length());
                logger.info(categoryId);
                if (title.length()>3 && content.length()>50){
                    Message message=new Message();
                    message.setUserId(user.getId());
                    message.setUserName(user.getUsername());
                    message.setTitle(title);
                    message.setContent(content);

                    int  result=messageService.addMessage(message,categoryId);//进行数据保存数据库
                    logger.info(result);
                    if (result>0){//用户添加文章 成功
                        //获取所有的分类专题
                        List<Category> categories=categoryService.getCategoryList();
                        request.setAttribute("categories",categories);
                        request.setAttribute("result",1);
                        request.getRequestDispatcher("/WEB-INF/views/addMessage.jsp").forward(request,response);

                    }else {
                        List<Category> categories=categoryService.getCategoryList();
                        request.setAttribute("categories",categories);
                        request.setAttribute("result",0);
                        request.getRequestDispatcher("/WEB-INF/views/addMessage.jsp").forward(request,response);
                    }

                }else {
                    List<Category> categories=categoryService.getCategoryList();
                    request.setAttribute("categories",categories);
                    request.setAttribute("result",0);
                    request.getRequestDispatcher("/WEB-INF/views/addMessage.jsp").forward(request,response);



                }




            }

        }else {
            request.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(request,response);
        }


    }


}
