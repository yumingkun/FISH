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

@WebServlet({"/show/message.do","/show/myMessage.do","/show/more.do"})
public class MessageServlet extends HttpServlet {
    private static org.apache.log4j.Logger logger = Logger.getLogger(MessageServlet.class);
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


        //初始显示5条数据
        if ("/show/message.do".equals(request.getServletPath())){


            List<Message> messages =messageService.getMessages(0,3);//分页查询全部留言
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
                request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request,response);
            }

        // 前台加载更多
        } else if("/show/more.do".equals(request.getServletPath())){

            int clickNum=Integer.parseInt(request.getParameter("clickNum"));//获取点击加载更多次数;//点击加载更多次数
//            logger.info(request.getParameter("clickNum"));//1 2 3

            int start = clickNum*3;
            logger.info(start+"========");// 3 6 9

            //根据获取前端传过来的page进行分页查询
            List<Message> messages =messageService.getMessages(start,3);//分页查询全部留言
            //提取每篇文章的第一个src
            List<Message> messageSrcs=new ArrayList<>();
            for (Message message:messages) {
                message.setSrc(GetImgStr.getImgStr(message.getContent()));
                messageSrcs.add(message);
            }


            // 结果返回
            JSONArray json = JSONArray.fromObject(messageSrcs);

            String str = json.toString();
            logger.info(str);
            response.getWriter().write(str);


        }else if ("/show/myMessage.do".equals(request.getServletPath())){//前台获取当前用户所有的文章
//          获取当前用户的id
            User user=(User)request.getSession().getAttribute("user");

            int id=user.getId();

            List<Message> myMessages=messageService.getUserMessageList(id);


            //提取每篇文章的第一个src
            List<Message> messageSrcs=new ArrayList<>();
            for (Message message:myMessages) {
                message.setSrc(GetImgStr.getImgStr(message.getContent()));
                messageSrcs.add(message);
            }

            if (myMessages!=null){
                request.setAttribute("myMessages",messageSrcs);
                request.setAttribute("id",id);
//                request.setAttribute("user",user.toString());
                System.out.println(myMessages);
                request.getRequestDispatcher("/WEB-INF/views/myselfMessage.jsp").forward(request,response);
            }else {
                System.out.println("当前用户文章查询失败============================");
                request.getRequestDispatcher("/WEB-INF/error/404.jsp").forward(request,response);
            }
        }

    }

}



