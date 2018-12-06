package com.management.filter;

import com.fish.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 后台登录过滤器
 */
@WebFilter("/manage/*")
public class ManagementUserFiler implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        //登录的时候已经把信息放在会话里，如果会话里没有，表示没有登录，跳转到 LoginServlet
        HttpServletRequest req = (HttpServletRequest)request;
        User user = (User)req.getSession().getAttribute("manageUser");
        if(user==null){
            request.setAttribute("error", "请先登录");
            request.getRequestDispatcher("/manage/toLogin.do").forward(request, response);
        }

        chain.doFilter(request, response);



    }

    @Override
    public void destroy() {

    }
}
