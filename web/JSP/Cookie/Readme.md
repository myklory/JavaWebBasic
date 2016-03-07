# JSP状态管理

标签（空格分隔）： JavaWeb

---
[TOC]
##**1. HTTP协议的无状态性**
HTTP协议是没有状态的,两次HTTP请求没有关联.服务器要管理状态有两各方式,session和cookie.
##**2. Cookie**
cookie:是服务器保存在客户端的一系列文本信息.

典型应用一:判定用户是否已经登陆网站.

典型应用二:购物车的处理.
###**2.1 作用**

 - 对特定对象的追踪
 - 保存用户网页浏览记录与习惯
 - 简化登录
 
 安全风险:容易泄漏用户信息

####**2.1.1 JSP中使用Cookie**
创建Cookie对象:
```java
Cookie newCookie = new Cookie(String key, Object value);
```
写入Cookie对象:
```java
response.addCookie(newCookie);
```
读取Cookie对象:
```java
Cookie[] cookies = request.getCookies()
```
Cookie对象常用方法:
```java
setMaxAge(int second)//设置Cookie有效期
int getMaxAge()     //读取Cookie有效期
String getName()    //取Cookie名字
setValue(String value)//设置Cookie值
String getValue()   //取Cookie值
```

####**2.2.2 使用Cookie管理登录状态**
保存Cookies:
```jsp
<%
    //设置request对象为utf-8
    request.setCharacterEncoding("utf-8");
    //1. 判断用户是否选择了记住登录状态
    String[] isUseCookies = request.getParameterValues("isusecookie");
    if (isUseCookies != null && isUseCookies.length > 0){
        //2. 从request中取用户名和密码,设置编码格式以支持中文
        String username = URLEncoder.encode(request.getParameter("username"), "utf-8");
        String password = URLEncoder.encode(request.getParameter("password"), "utf-8");
        //3. 生成用户名和密码Cookie对象
        Cookie usernameCookie = new Cookie("username", username);
        Cookie passwordCookie = new Cookie("password", password);
        //4. 设置用户名和密码Cookie对象生存周期
        usernameCookie.setMaxAge(10*24*60*60);
        passwordCookie.setMaxAge(10*24*60*60);
        //4. 保存Cookie到response对象
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
    }
    else //5. 用户没选择保存Cookies,则要删除当前已经保存的Cookies
    {
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0){
            for (Cookie c : cookies){
                if (c.getName().equals("username") || c.getName().equals("password")){
                    //6. Cookie设置为失效
                    c.setMaxAge(0);
                    //7. 再写入response对象中
                    response.addCookie(c);
                }
            }
        }
    }
%>
```
取出Cookies:
```jsp
<%
    //设置request对象为utf-8
    request.setCharacterEncoding("utf-8");
    String username = "";
    String password = "";
    //遍历取出Cookies
    Cookie[] cookies = request.getCookies();
    if (cookies != null && cookies.length > 0){
        for (Cookie c : cookies){
            if (c.getName().equals("username")){
                //调用decode解码
                username = URLDecoder.decode(c.getValue(), "utf-8");
            }
            else if (c.getName().equals("password")){
                password = URLDecoder.decode(c.getValue(), "utf-8");
            }
        }
    }
%>
```

