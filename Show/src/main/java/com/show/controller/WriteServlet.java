package com.show.controller;

import com.fish.bean.Category;
import com.fish.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//处理点击写文章对应的事件
@WebServlet({"/show/write.do"})
public class WriteServlet extends HttpServlet{
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user")==null ||  ("".equals(req.getParameter("user")) )){//判断是否已经登录
            req.getRequestDispatcher("/WEB-INF/views/login_register.jsp").forward(req,resp);
        }else {//没有登录，跳到登录页面
            //获取所有的分类专题
            List<Category> categories=categoryService.getCategoryList();
            req.setAttribute("categories",categories);
            req.getRequestDispatcher("/WEB-INF/views/addMessage.jsp").forward(req,resp);
        }

    }
}
