package com.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * Created by myklory on 2016/3/4.
 */
public class SecondFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("SecondFilter:Init.....Filter");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("SecondFilter:Start.....doFilter");
        filterChain.doFilter(servletRequest, servletResponse);
        System.out.println("SecondFilter:End.......doFilter");
    }

    @Override
    public void destroy() {
        System.out.println("SecondFilter:Destory....Filter");
    }
}
