package com.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * Created by myklory on 2016/3/4.
 */
public class FirstFilter implements Filter {
    //过滤器初始化方法,Web容器创建过滤器实例后将调用这个方法,这个方法中可以读取Web.xml文件中过滤器的参数
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("FirstFilter:Init.....Filter");
    }

    //这个方法完成实际的过滤操作,这个方法是过滤器的核心方法.当用户请求访问与过滤器关联的RUL时,Web容器将先调用过滤器的doFilter方法
    //FilterChain参数可以调用chain.doFilter方法,将请求传递给下一个过滤器或目标资源,或利用转发/重定向将请求转发到其他资源.
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("FirstFilter:Start.....doFilter");
        filterChain.doFilter(servletRequest, servletResponse);
        System.out.println("FirstFilter:End.......doFilter");
    }

    //Web容器在销毁过滤器实例前调用该方法,在这个方法中可以释放过滤器占用的资源
    @Override
    public void destroy() {
        System.out.println("FirstFilter:Destory....Filter");
    }
}
