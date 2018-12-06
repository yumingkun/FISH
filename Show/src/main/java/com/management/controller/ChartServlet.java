package com.management.controller;

import com.fish.service.CategoryService;
import com.fish.service.MessageService;
import com.fish.vo.CategoryVo;
import com.fish.vo.ChartVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/manage/toShowCategoryChart.do","/manage/toShowUserChart.do"})
public class ChartServlet extends HttpServlet {

    private MessageService messageService;
    private CategoryService categoryService;

    public void init() throws ServletException {
        super.init();
        messageService=new MessageService();
        categoryService=new CategoryService();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ("/manage/toShowUserChart.do".equals(request.getServletPath())) {

            List<ChartVo> chartVos = messageService.getMessageShowChart();
            List<String> usernameList = new ArrayList<>();
            List<Integer> numList = new ArrayList<>();


            for (ChartVo chartVo : chartVos) {
                usernameList.add('"' + chartVo.getUsername() + '"');
                numList.add(chartVo.getNum());
            }
            request.setAttribute("usernameList", usernameList);
            request.setAttribute("numList", numList);
            request.getRequestDispatcher("/admin/views/userChart.jsp").forward(request, response);//重定向到后台主页面

        }else if ("/manage/toShowCategoryChart.do".equals(request.getServletPath())){
            List<CategoryVo> categoryVos=categoryService.getCategoryVo();//获取每个分类对应的分类名：数量
            List<String> gnameList=new ArrayList<>();
            List<Integer> numList=new ArrayList<>();
            for (CategoryVo categoryVo:categoryVos) {
                gnameList.add('"'+categoryVo.getGname()+'"');
                numList.add(categoryVo.getNum());
            }

            request.setAttribute("gnameList",gnameList);//类别名称
            request.setAttribute("numList",numList);//数量
            request.getRequestDispatcher("/admin/views/categoryChart.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
