package com.fish.filter;


import javax.servlet.*;
import java.io.IOException;

/**
 * 字符集的过滤器
 */
public class CharsetEncodingFilter implements Filter {
//       1：默认编码
    private String encoding="UTF-8";

    public void init(FilterConfig filterConfig) throws ServletException {
//       2:如果配置文件配置了编码格式，则赋值，没有的话，使用默认
        if (filterConfig.getInitParameter("ENCODING")!=null)
            encoding=filterConfig.getInitParameter("ENCODING");

    }
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        3：请求和响应分别设置编码格式
        servletRequest.setCharacterEncoding(encoding);
        servletResponse.setCharacterEncoding(encoding);
//        4：继续过滤下一个
        filterChain.doFilter(servletRequest,servletResponse);
    }

    public void destroy() {
        encoding=null;
    }


}
