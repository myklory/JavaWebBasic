<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: 刘英明
  Date: 2016/3/3
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
</head>
<body>
<h1>用户信息</h1>
<hr>
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
用户名: <%=username %><br>
密码: <%=password %><br>
</body>
</html>
