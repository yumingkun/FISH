package com.show.controller;

import com.fish.bean.*;
import com.fish.service.*;
import com.fish.utils.GetImgStr;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


import net.sf.json.JSONArray;
import org.apache.log4j.Logger;

@WebServlet({"/show/message.do","/show/myMessage.do","/show/more.do","/show/search.do","/show/trash.do","/show/showTrashMessage.do","/show/restore.do","/show/myDelete.do","/show/getMessageId.do","/show/updateMessage.do","/show/addLaud.do","/show/detail.do","/show/toWrite.do","/show/addMessage.do","/show/toAddMessage.do"})
public class MessageServlet extends HttpServlet {
    private static Logger logger = Logger.getLogger(MessageServlet.class);
    private MessageService messageService;
    private CategoryService categoryService;
    private CarouseService carouseService;
    private UserService userService;
    private CommentService commentService;
    private FollowService followService;

    @Override
    public void init() throws ServletException {
        super.init();
        messageService=new MessageService();
        categoryService=new CategoryService();
        carouseService=new CarouseService();
        userService=new UserService();
        commentService=new CommentService();
        followService=new FollowService();


    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //初始显示6条数据,以及显示轮播图信息
        if ("/show/message.do".equals(request.getServletPath())){
            List<Message> messages =messageService.getMessages(0,6);//分页查询全部留言

            //提取每篇文章的第一个src
            List<Message> messageSrcs=new ArrayList<>();
            for (Message message:messages) {
                message.setSrc(GetImgStr.getImgStr(message.getContent()));
                messageSrcs.add(message);
           }

            //获得所有的分类
            List<Category> categories=categoryService.getCategoryList();

            //获得所有的轮播图
            List<Carousel> carousels=carouseService.getCarouselList();

            //获取的点赞前6的文章
            List<Message> messagesLauds=messageService.getMessageLaud();

            if (messages.size()>0){
                request.setAttribute("messages",messageSrcs);
                request.setAttribute("categories",categories);
                request.setAttribute("carousels",carousels);
                request.setAttribute("messagesLauds",messagesLauds);
                request.getRequestDispatcher("/WEB-INF/views/allMessage.jsp").forward(request,response);
            }
        // 前台加载更多
        } else if("/show/more.do".equals(request.getServletPath())) {


            int count = 6;//每次从数据库取出的数量
            int clickNum = Integer.parseInt(request.getParameter("clickNum"));//获取点击加载更多次数;// 1 2 3 4
            int start = clickNum * count;//每次点加的查询位置

            //根据获取前端传过来的page进行分页查询
            List<Message> messages = messageService.getMessages(start, count);//分页查询全部留言
            //提取每篇文章的第一个src
            List<Message> messageSrcs = new ArrayList<>();
            for (Message message : messages) {
                message.setSrc(GetImgStr.getImgStr(message.getContent()));
                messageSrcs.add(message);
            }
            JSONArray json = JSONArray.fromObject(messageSrcs);
            String str = json.toString();
            response.getWriter().write(str);
        //文章详情展示
        }else if ("/show/detail.do".equals(request.getServletPath())){
            // 获取当前用户的id
            User user = (User) request.getSession().getAttribute("user");
            if (request.getSession().getAttribute("user")==null ||  ("".equals(request.getParameter("user")) )) {//判断是否已经登录
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            }else {

                int id=Integer.valueOf(request.getParameter("id"));//获取前端传来的文章id
                int userId=Integer.valueOf(request.getParameter("userId"));//获取每个文章的作者ID

                Follow follow=followService.getFollow(user.getId(),userId);//获取关注
                Message message=messageService.getMessageById(id);
                User zuozhe=userService.getUser(userId);
                int countComment=commentService.countComment(id);//根据文章ID查询此文章的评论的个数
                List<Comment> comments=commentService.getCommentByMessageId(id);//根据文章的id查询comment和user（评论人）表
                if (message!=null && user!=null){
                    request.setAttribute("message",message);//文章详细信息
                    request.setAttribute("user",zuozhe);//此文章作者信息
                    request.setAttribute("countComment",countComment);//评论个数
                    request.setAttribute("allComment",comments);//所有的评论
                    request.setAttribute("follow",follow);//关注
                    request.getRequestDispatcher("/WEB-INF/views/messageDetail.jsp").forward(request,response);
                }else {
                    request.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(request,response);
                }
            }
        //前台获取当前用户所有的文章，以及获取所有的分类
        }else if ("/show/myMessage.do".equals(request.getServletPath())) {
            // 获取当前用户的id
            User user = (User) request.getSession().getAttribute("user");
            int id = user.getId();
            //查找文章不在回收站的
            List<Message> myMessages = messageService.getUserMessageList(id);
            //得到所有的分类
            List<Category> categories=categoryService.getCategoryList();


            //当前用户文章列表提取每篇文章的第一个src
            List<Message> messageSrcs = new ArrayList<>();
            for (Message message : myMessages) {
                message.setSrc(GetImgStr.getImgStr(message.getContent()));
                messageSrcs.add(message);
            }

            if (myMessages.size()>= 0) {
                request.setAttribute("myMessages", messageSrcs);
                request.setAttribute("id", id);
                request.setAttribute("categories",categories);
                request.getRequestDispatcher("/WEB-INF/views/userMessage.jsp").forward(request, response);//我的博客页面
            } else {
                System.out.println("当前用户文章查询失败============================");
                request.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(request, response);
            }
        //查询回收站
        }else if ("/show/showTrashMessage.do".equals(request.getServletPath())){
            //获取当前用户的id
            User user = (User) request.getSession().getAttribute("user");
            int id = user.getId();
            //查找当前用户文章在回收站的
            List<Message> trashMessage = messageService.getTrash(id);

            //回收站提取每篇文章的第一个src
            List<Message> messageSrcsTrash = new ArrayList<>();
            for (Message message : trashMessage) {
                message.setSrc(GetImgStr.getImgStr(message.getContent()));
                messageSrcsTrash.add(message);
            }
            request.setAttribute("trashMessage", messageSrcsTrash);
            request.setAttribute("id", id);
            request.getRequestDispatcher("/WEB-INF/views/userTrash.jsp").forward(request, response);//回收站页面


        //导航条模糊查询
        }else if ("/show/search.do".equals(request.getServletPath())){
                String search=request.getParameter("search");//获取前端关键词
                List<Message> messages=messageService.searchMessages(search);
                String serachnum=String.valueOf(messages.size());
                if (messages.size()!=0 && search.length()>0){//不为空
                    //提取每篇文章的第一个图片rc
                    List<Message> messageSrcs=new ArrayList<>();
                    for (Message message:messages) {
                        message.setSrc(GetImgStr.getImgStr(message.getContent()));
                        messageSrcs.add(message);
                    }
                    request.setAttribute("num",serachnum);//搜索到文章数
                    logger.info(serachnum);
                    request.setAttribute("searchMessages",messageSrcs);
                    request.getRequestDispatcher("/WEB-INF/views/searchResult.jsp").forward(request,response);
                }else {
                    request.getRequestDispatcher("/WEB-INF/views/error/nullMessage.jsp").forward(request,response);

                }
        //把指定文章放入回收站
        }else if ("/show/trash.do".equals(request.getServletPath())){
            int messageId=Integer.parseInt(request.getParameter("id"));//获取文章id
            Boolean trash=messageService.trash(messageId);
            if (trash){
                String result="已经放入回收站";
                response.getWriter().write(result);
            }
        //恢复指定的文章
        }else if ("/show/restore.do".equals(request.getServletPath())){
            int messageId=Integer.parseInt(request.getParameter("id"));//获取文章id
            Boolean restore=messageService.restore(messageId);
            if (restore){
                String result="已经恢复";
                response.getWriter().write(result);
            }
        //彻底删除
        }else if ("/show/myDelete.do".equals(request.getServletPath())){
            int messageId=Integer.parseInt(request.getParameter("id"));//获取文章id
            Boolean myDelete=messageService.trashDelete(messageId);
            if (myDelete){
                String result="已经彻底删除";
                response.getWriter().write(result);
            }
         //用ajax 查询指定文章
        }else if ("/show/getMessageId.do".equals(request.getServletPath())){
            int messageId=Integer.parseInt(request.getParameter("messageId"));
            Message message=messageService.getMessageById(messageId);

            List<Message> messages =new ArrayList<>();
            messages.add(message);

            //回收站提取每篇文章的第一个src
            List<Message> messageSrcs = new ArrayList<>();
            for (Message ms : messages) {
                ms.setSrc(GetImgStr.getImgStr(ms.getContent()));
                messageSrcs.add(message);
            }
            // 结果返回
            JSONArray json = JSONArray.fromObject(messageSrcs);

            String str = json.toString();
//            logger.info(str);
            response.getWriter().write(str);

        //更新文章
        }else if ("/show/updateMessage.do".equals(request.getServletPath())){
            User user=(User)request.getSession().getAttribute("user");//用户id
            int messageId=Integer.parseInt(request.getParameter("messageId"));//获取要更新文章的Id
            int categoryId=Integer.parseInt(request.getParameter("categoryId"));//获取文章修改之后的分类Id
            String title=request.getParameter("title");//获取文章修改之后的标题
            String content=request.getParameter("content");//获取文章修改之后内容
//
//            logger.info(messageId);
//            logger.info(categoryId);
//            logger.info(title);
//            logger.info(content);

            if (title.length()>3 && content.length()>50 && messageId!=0){
                Message  message=new Message();
                message.setId(messageId);
                message.setUserId(user.getId());
                message.setUserName(user.getUsername());
                message.setTitle(title);
                message.setContent(content);

                Boolean updateMessage=messageService.updateMessage(message,categoryId);
//                logger.info(updateMessage);

                //更新成功之后的操作
                if (updateMessage){
                    request.setAttribute("result2",1);//修改文章成功提示
                    request.getRequestDispatcher("/show/myMessage.do").forward(request,response);
                }
            }else {//文章修改不符合要求
                request.setAttribute("result2",0);//修改文章错误提示
                request.getRequestDispatcher("/show/myMessage.do").forward(request,response);
            }
            //点赞
        }else if ("/show/addLaud.do".equals(request.getServletPath())){
             int messageId=Integer.parseInt(request.getParameter("messageId"));
             int result=messageService.addLaud(messageId);
             if (result>0){
                 response.getWriter().write("成功");
             }
        }else if ("/show/toWrite.do".equals(request.getServletPath())) {
            if (request.getSession().getAttribute("user") == null || ("".equals(request.getParameter("user")))) {//判断是否已经登录
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            } else {//没有登录，跳到登录页面
                //获取所有的分类专题
                List<Category> categories = categoryService.getCategoryList();
                request.setAttribute("categories", categories);
                request.getRequestDispatcher("/WEB-INF/views/addMessage.jsp").forward(request, response);
            }
        }else if ("/show/toAddMessage.do".equals(request.getServletPath())) {
            request.getRequestDispatcher("/WEB-INF/views/addMessage.jsp").forward(request, response);
         //添加文章
        }else if("/show/addMessage.do".equals(request.getServletPath())){
                User user=(User)request.getSession().getAttribute("user");//根据用户是否登录，来做选择
                if (null==user){//如果没有登录，可以看留言但是不能写留言
                    request.getRequestDispatcher("/show/login.do").forward(request,response);
                }else {//如果登录了，拿到前端传来的数据
                    String title=request.getParameter("title");
                    String content=request.getParameter("content");
                    int categoryId=Integer.parseInt(request.getParameter("categoryId"));//获取文章修改之后的分类Id
                    if (title.length()>3 && content.length()>50){
                        Message message=new Message();
                        message.setUserId(user.getId());
                        message.setTitle(title);
                        message.setContent(content);
                        int  result=messageService.addMessage(message,categoryId);//进行数据保存数据库
                        if (result>0){//用户添加文章 成功
                            List<Category> categories=categoryService.getCategoryList();           //获取所有的分类专题
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
                        List<Category> categories = categoryService.getCategoryList();
                        request.setAttribute("categories", categories);
                        request.setAttribute("result", 0);
                        request.getRequestDispatcher("/WEB-INF/views/addMessage.jsp").forward(request, response);

                    }

                }



        }
    }

}



