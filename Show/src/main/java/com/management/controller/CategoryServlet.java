package com.management.controller;

import com.fish.bean.Category;
import com.fish.service.CategoryService;
import com.fish.vo.CategoryVo;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/manage/category.do","/manage/cddCategory.do","/manage/deleteById.do","/manage/updateById.do"})
public class CategoryServlet extends HttpServlet {
    private static Logger logger = Logger.getLogger(CategoryServlet.class);
    private CategoryService categoryService;

    @Override
    public void init() throws ServletException {
        super.init();
        categoryService=new CategoryService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获得所有的分类
         if ("/manage/category.do".equals(request.getServletPath())){
             List<Category> categories=categoryService.getCategoryList();//获得所有的分类


             if (categories.size()>0){
                 request.setAttribute("categorys",categories);

                 request.getRequestDispatcher("/admin/views/category.jsp").forward(request,response);
             }
         }else if ("/manage/cddCategory.do".equals(request.getServletPath())){
//          获取类名
             String gname=request.getParameter("gname");
             if (!("".equals(gname) && gname.length()>0)){
                 Boolean addResult=categoryService.addCategory(gname);
                 if (addResult){
                     request.getRequestDispatcher("category.do").forward(request,response);
                 }

             }else {
                 request.getRequestDispatcher("category.do").forward(request,response);
             }

         }else if ("/manage/deleteById.do".equals(request.getServletPath())){
             int id=Integer.parseInt(request.getParameter("id"));
             int result=categoryService.deleteCategory(id);
             if (result>0){
                 request.setAttribute("result",1);
                 request.getRequestDispatcher("/manage/category.do").forward(request,response);
             }

         }else if ("/manage/updateById.do".equals(request.getServletPath())){
            int gid=Integer.parseInt(request.getParameter("gid"));
            String gname=request.getParameter("gname");

            Category category=new Category(gid,gname);
            int result=categoryService.upldateCategory(category);
            if (result>0){
                request.setAttribute("update",1);
                request.getRequestDispatcher("/manage/category.do").forward(request,response);
            }
         }
    }
}
