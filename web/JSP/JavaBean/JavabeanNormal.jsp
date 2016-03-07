<%@ page import="com.javabean.Users" %><%--
  Created by IntelliJ IDEA.
  User: 刘英明
  Date: 2016/3/3
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>使用普通方式调用Javabean</title>
</head>
<body>
<%
    Users user = new Users();
    user.setUsername("admin");
    user.setPassword("123456");
%>
<h1>使用普通方式调用Javabean</h1>
<br>
用户名: <%=user.getUsername()%><br>
密码: <%=user.getPassword()%><br>
</body>
</html>
