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

@WebServlet({"/show/message.do","/show/myMessage.do"})
public class MessageServlet extends HttpServlet {
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
//        前台分页获取文章
        if ("/show/message.do".equals(request.getServletPath())){

            String pageStr=request.getParameter("page");//获得请求的页码
            int page=1;//页码默认为1
            if(pageStr!=null && (!"".equals(pageStr))){
                page=Integer.parseInt(pageStr);//获得数字页码
            }

            //根据获取前端传过来的page进行分页查询
            List<Message> messages =messageService.getMessages(page,5);//分页查询全部留言
            //提取每篇文章的第一个src
            List<Message> messageSrcs=new ArrayList<>();
            for (Message message:messages) {
                message.setSrc(GetImgStr.getImgStr(message.getContent()));
                messageSrcs.add(message);
            }

//        for (String src:srcs) {
//            System.out.printf(src+"===================|");
//        }


            int count=messageService.countMessage();//获取全部消息数量


            int last=count%5 ==0? (count/ 5):((count/5)+1);//最后一页
            request.setAttribute("last",last);
            request.setAttribute("messages",messageSrcs);
            request.setAttribute("page",page);



            request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request,response);

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



