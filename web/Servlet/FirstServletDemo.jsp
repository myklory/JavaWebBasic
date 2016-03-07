<%--
  Created by IntelliJ IDEA.
  User: 刘英明
  Date: 2016/3/7
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>第一个Servlet小例子</title>
</head>
<body>
<h1>第一个Servlet小例子</h1>
<a href="../servlet/HelloServlet">以Get方式请求Servlet</a>
<form action="../servlet/HelloServlet" method="post"><input type="submit" value="以Post方式请求Servlet"></form>
<form action="../servlet/Servlet" method="post"><input type="submit" value="以Post方式请求Servlet"></form>
</body>
</html>
