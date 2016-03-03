<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: 刘英明
  Date: 2016/3/3
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录信息</title>
</head>
<body>
<h1>登录成功</h1>
<hr>
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
<a href="userinfo.jsp">用户信息</a>
</body>
</html>
