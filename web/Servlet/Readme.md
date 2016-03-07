# Servlet

标签（空格分隔）： JavaWeb

---

##**1. 什么是Servlet**
Servlet是在服务器上运行的小程序.一个Servlet就是一个Java类,并且可以通过"请求-响应"编程模型来访问这个驻留在服务器内存里的Servlet程序.
##**2. Tomcat容器等级**
Tomcat的容器分为4个等级,Servlet的容器管理Context容器,一个Context对应一个Web工程.
![容器等级](http://7xp3bw.com1.z0.glb.clouddn.com/Servlet1.png)
##**3. 编写Servlet**
###**3.1 手工编写Servlet**
编写Servlet步骤有三个.

    1. 继承HttpServlet
    2. 重写doGet和doPost方法
    3. 在web.xml中注册Servlet
![HttpServlet](http://7xp3bw.com1.z0.glb.clouddn.com/HttpServlet.png)

实例如下:
```java
//1. 继承于HttpServlet
public class HelloServlet extends HttpServlet {
    //2. 重写doGet或者doPost
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("处理Get请求...");
        PrintWriter printWriter = resp.getWriter();
        printWriter.println("<strong>Hello Servlet</strong>");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
```
web.xml
```xml
<servlet>
        <servlet-name>HelloServlet</servlet-name>
        <servlet-class>servlet.HelloServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>HelloServlet</servlet-name>
        <url-pattern>/servlet/HelloServlet</url-pattern>
    </servlet-mapping>
```
然后就可以在jsp页面中调用这个Servlet.
###**3.2 IDEA编写Servlet**
    1.执行src->new->servlet创建Servlet类.
    2.编写doGet,doPost方法.
    3.在web.xml
基本上和3.1一致.

##**4. Servlet执行流程**
    1.首先使用超链接用Get方式请求Servlet.
    2.服务器在web.xml中的url-pattern中查找与超链接路径一致的Servlet名字.
    3.再到<servlet>标签中查找和Servlet名字一致的Servlet类,最后调用Servlet类中的doGet方法.
    4.doPost一样使用方法.
![流程](http://7xp3bw.com1.z0.glb.clouddn.com/Servlet2.png)

##**4. Servlet生命周期**
![生命周期](http://7xp3bw.com1.z0.glb.clouddn.com/Servlet3.png)



