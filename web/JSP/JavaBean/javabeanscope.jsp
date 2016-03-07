<%@ page import="com.javabean.Users" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘英明
  Date: 2016/3/3
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JavaBean作用范围</title>
</head>
<body>
<h1>JavaBean作用范围</h1>
<br>
<h2>1.page作用域</h2>
<!--前面已经声明了user对象,需要再次使用时只用再声明一次即可-->
<!--这里使用的是page范围,在前一页赋的值在这一页已经不可用了-->
<!--1.page作用域-->
<jsp:useBean id="user" class="com.javabean.Users" scope="page" />
<!--user已经是一个新的对象,可以直接给它赋值-->
<%
    user.setUsername("admin");
%>
<!--使用传统表达式方式获取用户名和密码-->
用户名: <%=user.getUsername()%><br>
密码: <%=user.getPassword()%><br>

<h2>2.session作用域</h2>
<!--2.session作用域测试-->
<jsp:useBean id="usersession" class="com.javabean.Users" scope="session" />
<!--使用表达式方式显示-->
用户名: <%=usersession.getUsername()%><br>
密码: <%=usersession.getPassword()%><br>
<!--使用getProperty方式显示-->
用户名: <jsp:getProperty name="usersession" property="username"/><br>
密码: <jsp:getProperty name="usersession" property="password"/><br>
<!--使用session.getAttribute方式显示-->
用户名: <%=((Users)session.getAttribute("usersession")).getUsername()%><br>
密码: <%=((Users)session.getAttribute("usersession")).getPassword()%><br>

<h2>3.application作用域</h2>
<!--2.session作用域测试-->
<jsp:useBean id="userapplication" class="com.javabean.Users" scope="application" />
<!--使用application.getAttribute方式显示-->
用户名: <%=((Users)application.getAttribute("userapplication")).getUsername()%><br>
密码: <%=((Users)application.getAttribute("userapplication")).getPassword()%><br>

<h2>4.request作用域</h2>
<!--2.request作用域-->
<jsp:useBean id="userrequest" class="com.javabean.Users" scope="request" />
<!--使用application.getAttribute方式显示-->
用户名: <%=((Users)request.getAttribute("userrequest")).getUsername()%><br>
密码: <%=((Users)request.getAttribute("userrequest")).getPassword()%><br>
</body>
</html>
