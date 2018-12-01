package com.management.controller;

import com.fish.bean.User;
import com.fish.service.MessageService;
import com.fish.service.UserService;
import com.fish.vo.ChartVo;
import com.fish.vo.PageVO;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//后台分页获取的users
@WebServlet({"/manage/login.do","/manage/toLogin.do","/manage/toShowChart.do","/manage/getUsers.do","/manage/delete.do"})
public class UsersServlet extends HttpServlet {
    private UserService userService;
    private MessageService messageService;
    private static  Logger logger = Logger.getLogger(UsersServlet.class);
    @Override
    public void init() throws ServletException {
        super.init();
        messageService=new MessageService();
        userService=new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if ("/manage/login.do".equals(req.getServletPath())) {//登录请求
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            if ("root".equals(username) && "root".equals(password)) {
                req.getSession().setAttribute("username", username);//把登录的后台管理员储存在回话里（为了进行是否登录状态的判断）
                List<ChartVo> chartVos=messageService.getMessageShowChart();

                List<String> usernameList=new ArrayList<>();
                List<Integer> numList=new ArrayList<>();


                for (ChartVo chartVo:chartVos)  {
                    usernameList.add('"'+chartVo.getUsername()+'"');
                    numList.add(chartVo.getNum());
                }
                req.setAttribute("usernameList",usernameList.toString());
                req.setAttribute("numList",numList);

                req.getRequestDispatcher("/admin/views/management.jsp").forward(req,resp);//重定向到后台主页面
            } else {
                req.getRequestDispatcher("/manage/toLogin.do").forward(req, resp);
            }
        } else if ("/manage/toLogin.do".equals(req.getServletPath())) {//过滤器判断为未登录时，自动跳转到登录页面
            req.getRequestDispatcher("/admin/views/login.jsp").forward(req, resp);
        }else if ("/manage/toShowChart.do".equals(req.getServletPath())){

            List<ChartVo> chartVos=messageService.getMessageShowChart();
            List<String> usernameList=new ArrayList<>();
            List<Integer> numList=new ArrayList<>();


            for (ChartVo chartVo:chartVos)  {
                usernameList.add('"'+chartVo.getUsername()+'"');
                numList.add(chartVo.getNum());
            }
            req.setAttribute("usernameList",usernameList);
            req.setAttribute("numList",numList);
            req.getRequestDispatcher("/admin/views/management.jsp").forward(req,resp);//重定向到后台主页面

        }else if ("/manage/getUsers.do".equals(req.getServletPath())){
            //1 获取请求参数-分页
            int recordOfPage = 10;//每页10条记录
            int page = 1;//默认第一页
            if(req.getParameter("page")!=null){
                page = Integer.parseInt(req.getParameter("page"));
            }
            //2 调用业务逻辑
            PageVO<User> pageVO = userService.searchUsers(page,recordOfPage);//（里面封装的是用户分页信息）
            List<User> userList = pageVO.getList();
            //3 数据传递和页面导航
            if (userList!=null){
                req.setAttribute("userList", userList);//每页的用户
                req.setAttribute("pageVO", pageVO);//分页的信息
                req.getRequestDispatcher("/admin/views/usersShow.jsp").forward(req, resp);
            }else {
                req.getRequestDispatcher("/admin/views//error/404.jsp").forward(req,resp);
            }
        }else if("/manage/delete.do".equals(req.getServletPath())){
            int userId=Integer.parseInt(req.getParameter("userId"));
            Boolean delete=userService.deleteUserById(userId);
            if (delete){
                req.getRequestDispatcher("getUsers.do").forward(req, resp);
            }

        }
    }
}
