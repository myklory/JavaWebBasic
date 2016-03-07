# 过滤器

标签（空格分隔）： 未分类

---

##**1. 定义**
过滤器是一个服务器端的组件,它可以截取用户端的请求与响应信息,并对这些信息过滤.
##**2. 生命周期**
过滤器随WEB服务启动,随WEB服务停止销毁.
##**3. 创建filter**
filter实现javax.servlet.Filter接口
###**3.1 创建filter类**
```java
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
        System.out.println("Init.....Filter");
    }

    //这个方法完成实际的过滤操作,这个方法是过滤器的核心方法.当用户请求访问与过滤器关联的RUL时,Web容器将先调用过滤器的doFilter方法
    //FilterChain参数可以调用chain.doFilter方法,将请求传递给下一个过滤器或目标资源,或利用转发/重定向将请求转发到其他资源.
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("Start.....doFilter");
        filterChain.doFilter(servletRequest, servletResponse);
        System.out.println("End.......doFilter");
    }

    //Web容器在销毁过滤器实例前调用该方法,在这个方法中可以释放过滤器占用的资源
    @Override
    public void destroy() {
        System.out.println("Destory....Filter");
    }
}
```
###**3.2 配置filter**
在web.xml中配置filter
```xml
<!--过滤器配置-->
    <filter>
        <!--过滤器名称-->
        <filter-name>FirstFilter</filter-name>
        <!--过滤器类名字,包括包名-->
        <filter-class>com.filter.FirstFilter</filter-class>
        <!--初始化参数,可以有多对-->
        <!--<init-param>-->
            <!--描述信息,可省略-->
            <!--<description></description>-->
            <!--参数名-->
            <!--<param-name>namespace</param-name>-->
            <!--参数值-->
            <!--<param-value></param-value>-->
        <!--</init-param>-->
    </filter>
    <filter-mapping>
        <!--和上面filter-name要一致-->
        <filter-name>FirstFilter</filter-name>
        <!--需要过滤的URL地址,只有和用户请求的URL匹配才起作用,/*表示任意URL-->
        <url-pattern>/*</url-pattern>
        <!--过滤请求类型,可以有多对,取值为REQUEST|INCLUDE|FORWARD|ERROR,默认为REQUEST-->
        <dispatcher>REQUEST</dispatcher>
    </filter-mapping>
```
###**3.3 启动服务器**
启动服务器访问就可以看到在输出窗口中输出相应的信息.

##**4. 多过滤器**
如果多过滤器的url-pattern配置的URL不相干,则多个过滤器各不相干,自己处理自己的URL,否则多过滤器按照web.xml中定义顺序执行.

##**5. 过滤器分类**
1.REQUEST,用户直接访问页面时,WEB容器将会调用过滤器.重定向也属于REQUEST,如response.sendRedircet()方法.
2.FORWARD,目标资源是通过RequestDispatcher的forward或jsp:forward动作访问时,该过滤器被调用.
3.INCLUDE,同FORWARD,但是是include动作.
4.ERROR,目标资源是通过声明式异常处理机制调用时,过滤器将被调用.
5.ASYNC,异步过滤

##**5. @WebFilter**
使用@WebFilter就可以不用在web.xml配置过滤器.格式如下:
```java
//使用@WebFilter则不用在Web.xml进行配置
@WebFilter(filterName = "AsyncFilter", value = {"/index.jsp"}, dispatcherTypes = {DispatcherType.ASYNC, DispatcherType.REQUEST})
public class AsyncFilter implements Filter {
...
}
```



