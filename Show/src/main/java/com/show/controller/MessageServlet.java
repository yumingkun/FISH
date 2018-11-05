package com.show.controller;

import com.fish.bean.Message;
import com.fish.bean.User;
import com.fish.service.MessageService;
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

@WebServlet({"/show/message.do","/show/myMessage.do","/show/more.do","/show/search.do","/show/trash.do","/show/showTrashMessage.do","/show/restore.do","/show/myDelete.do"})
public class MessageServlet extends HttpServlet {
    private static Logger logger = Logger.getLogger(MessageServlet.class);
    private MessageService messageService;
    @Override
    public void init() throws ServletException {
        super.init();
        messageService=new MessageService();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //初始显示6条数据
        if ("/show/message.do".equals(request.getServletPath())){


            List<Message> messages =messageService.getMessages(0,6);//分页查询全部留言
            //提取每篇文章的第一个src
            List<Message> messageSrcs=new ArrayList<>();
            for (Message message:messages) {
                message.setSrc(GetImgStr.getImgStr(message.getContent()));
                messageSrcs.add(message);
           }

//            int count=messageService.countMessage();//获取全部消息数量
//            int last=count%5 ==0? (count/ 5):((count/5)+1);//最后一页
//            request.setAttribute("last",last);
//            request.setAttribute("page",page);

            if (messages!=null){
                request.setAttribute("messages",messageSrcs);
                request.getRequestDispatcher("/WEB-INF/views/allMessage.jsp").forward(request,response);
            }

        // 前台加载更多
        } else if("/show/more.do".equals(request.getServletPath())){


            int count=6;//每次从数据库取出的数量
            int clickNum=Integer.parseInt(request.getParameter("clickNum"));//获取点击加载更多次数;// 1 2 3 4
            int start = clickNum*count;//每次点加的查询位置

            //根据获取前端传过来的page进行分页查询
            List<Message> messages =messageService.getMessages(start,count);//分页查询全部留言
            //提取每篇文章的第一个src
            List<Message> messageSrcs=new ArrayList<>();
            for (Message message:messages) {
                message.setSrc(GetImgStr.getImgStr(message.getContent()));
                messageSrcs.add(message);
            }


            // 结果返回
            JSONArray json = JSONArray.fromObject(messageSrcs);

            String str = json.toString();
//            logger.info(str);
            response.getWriter().write(str);

        //前台获取当前用户所有的文章
        }else if ("/show/myMessage.do".equals(request.getServletPath())) {
//          获取当前用户的id
            User user = (User) request.getSession().getAttribute("user");
            int id = user.getId();
            //查找文章不在回收站的
            List<Message> myMessages = messageService.getUserMessageList(id);


            //当前用户文章列表提取每篇文章的第一个src
            List<Message> messageSrcs = new ArrayList<>();
            for (Message message : myMessages) {
                message.setSrc(GetImgStr.getImgStr(message.getContent()));
                messageSrcs.add(message);
            }

            if (myMessages.size()>= 0) {
                request.setAttribute("myMessages", messageSrcs);
                request.setAttribute("id", id);
                request.getRequestDispatcher("/WEB-INF/views/userMessage.jsp").forward(request, response);//我的博客页面
            } else {
                System.out.println("当前用户文章查询失败============================");
                request.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(request, response);
            }
        //查询回收站
        }else if ("/show/showTrashMessage.do".equals(request.getServletPath())){
//            获取当前用户的id
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
//            logger.info(messageSrcsTrash);
            request.setAttribute("id", id);
            request.getRequestDispatcher("/WEB-INF/views/trashMessage.jsp").forward(request, response);//回收站页面


                //模糊查询
        }else if ("/show/search.do".equals(request.getServletPath())){
//            获取前端关键词
                String search=request.getParameter("search");
                List<Message> messages=messageService.searchMessages(search);
//                logger.info(search);
//                logger.info(messages);
                if (messages.size()!=0 ){//不为空
                    //提取每篇文章的第一个图片rc
                    List<Message> messageSrcs=new ArrayList<>();
                    for (Message message:messages) {
                        message.setSrc(GetImgStr.getImgStr(message.getContent()));
                        messageSrcs.add(message);
                    }
                    request.setAttribute("searchMessages",messageSrcs);
                    request.getRequestDispatcher("/WEB-INF/views/searchResult.jsp").forward(request,response);
                }else {
                    request.getRequestDispatcher("/WEB-INF/views/error/nullMessage.jsp").forward(request,response);

                }
        //把指定文章放入回收站
        }else if ("/show/trash.do".equals(request.getServletPath())){
            int messageId=Integer.parseInt(request.getParameter("id"));//获取文章id
//            logger.info(messageId);
            Boolean trash=messageService.trash(messageId);
//            logger.info(trash);
            if (trash){
                String result="已经放入回收站";
                response.getWriter().write(result);
            }
        //恢复指定的文章
        }else if ("/show/restore.do".equals(request.getServletPath())){
            int messageId=Integer.parseInt(request.getParameter("id"));//获取文章id
//            logger.info(messageId);
            Boolean restore=messageService.restore(messageId);
//            logger.info(restore);
            if (restore){
                String result="已经恢复";
                response.getWriter().write(result);
            }
        //彻底删除
        }else if ("/show/myDelete.do".equals(request.getServletPath())){
            int messageId=Integer.parseInt(request.getParameter("id"));//获取文章id
//            logger.info(messageId);
            Boolean myDelete=messageService.trashDelete(messageId);
//            logger.info(messageId);
            if (myDelete){
                String result="已经彻底删除";
                response.getWriter().write(result);
            }
        }

    }

}



