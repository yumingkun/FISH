package com.management.controller;

import com.fish.bean.Message;
import com.fish.service.MessageService;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/manage/toAuditing.do","/manage/getMessage.do","/manage/updateAuditing","/manage/stopAuditing"})
public class MessageServlet extends HttpServlet {
    private MessageService messageService=new MessageService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ("/manage/toAuditing.do".equals(request.getServletPath())){

            List<Message> messages=messageService.getAllMeaasgeAuditing();//得到全部需要审核的文章
            request.setAttribute("messages",messages);
            request.getRequestDispatcher("/admin/views/userMessage.jsp").forward(request,response);
        //预览一篇文章
        }else if ("/manage/getMessage.do".equals(request.getServletPath())){
            int messageId=Integer.parseInt(request.getParameter("messageId"));
            Message message=messageService.getMessageById(messageId);
            String content=message.getContent();
            response.getWriter().write(content);
        }
//        审核通过
        else if("/manage/updateAuditing".equals(request.getServletPath())){
            int messageId=Integer.parseInt(request.getParameter("messageId"));
            int result=messageService.updateAuditing(messageId);
            if (result>0){
                response.getWriter().write("审核成功");
            }else {
                response.getWriter().write("审核失败");

            }

        }else if ("/manage/stopAuditing".equals(request.getServletPath())){
            int messageId=Integer.parseInt(request.getParameter("messageId"));
            int result=messageService.stopAuditing(messageId);
            if (result>0){
                response.getWriter().write("禁止成功");
            }else {
                response.getWriter().write("禁止失败");

            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doPost(request,response);
    }
}
