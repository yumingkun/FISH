//package com.fish.controller;
//
//import com.fish.service.MessageService;
//import com.fish.vo.ChartVo;
//import net.sf.json.JSONArray;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/manage/showChart.do")
//public class UserChartServlet extends HttpServlet {
//    private MessageService messageService;
//    @Override
//    public void init() throws ServletException {
//        super.init();
//        messageService=new MessageService();
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request,response);
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
////            logger.info(str);
//        response.getWriter().write(str);
//
//    }
//}
