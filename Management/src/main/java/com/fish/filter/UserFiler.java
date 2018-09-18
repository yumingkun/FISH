package com.fish.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 登录过滤器
 */
public class UserFiler implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        //登录的时候已经把信息放在会话里，如果会话里没有，表示没有登录，跳转到 LoginServlet
        if (null != ((HttpServletRequest) servletRequest).getSession().getAttribute("username")) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            servletRequest.getRequestDispatcher("/notLogin.do").forward(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
