package com.fish.filter;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * 字符集的过滤器
 */
@WebFilter("/*")
public class CharsetEncodingFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {

    }
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        3：请求和响应分别设置编码格式
        servletRequest.setCharacterEncoding("UTF-8");
        servletResponse.setCharacterEncoding("UTF-8");
//        4：继续过滤下一个
        filterChain.doFilter(servletRequest,servletResponse);
    }

    public void destroy() {

    }


}
