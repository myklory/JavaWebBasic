<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: 刘英明
  Date: 2016/3/3
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
</head>
<body>
<h1>用户登录</h1>
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
                username = URLDecoder.decode(c.getValue(), "utf-8");
            }
            else if (c.getName().equals("password")){
                password = URLDecoder.decode(c.getValue(), "utf-8");
            }
        }
    }
%>
<form action="dologin.jsp">
    <table>
        <tr>
            <td>用户名</td>
            <td><input type="text" name="username" value="<%=username %>"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="text" name="password" value="<%=password %>"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="checkbox" name="isusecookie" checked="checked">十天内不需要登录</td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="登录"></td>
        </tr>
    </table>
</form>
</body>
</html>
