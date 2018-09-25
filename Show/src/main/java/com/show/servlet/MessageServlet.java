package com.show.servlet;

import com.fish.entity.Message;
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

@WebServlet("/show/message.do")
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

        String pageStr=request.getParameter("page");//获得请求的页码
        int page=1;//页码默认为1
        if(pageStr!=null && (!"".equals(pageStr))){
            page=Integer.parseInt(pageStr);//获得数字页码
        }

        //根据获取前端传过来的page进行分页查询
        List<Message> messages =messageService.getMessages(page,5);//分页查询全部留言
        //提取每篇文章的第一个src
//        List<String> srcs=new ArrayList<>();
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

    }

}


