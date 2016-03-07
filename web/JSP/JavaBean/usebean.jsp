<%--
  Created by IntelliJ IDEA.
  User: 刘英明
  Date: 2016/3/3
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>使用useBean动作元素创建JavaBean的实例</title>
</head>
<body>
<h1>使用useBean动作元素创建JavaBean的实例</h1>
<h2>Page作用域</h2>
<!--javaBean动作元素创建Users实例,这里不需要导入包,可直接创建, 创建完成后可以在整个页面使用user对象-->
<%--<jsp:useBean id="标识符" class"JAVA类名" scope="作用范围" />--%>
<%--其中作用范围有4种,分别是page--当前页,Request--当前请求,session--当前session,application--当前应用--%>
<jsp:useBean id="user" class="com.javabean.Users" scope="page" />

<!--为user赋值一共有4种方法,都是调用jsp:setProperty实现-->
<!--方法1:根据提交的表单自动为user赋值,此方法会对表单有的所有属性进行赋值,表单名需要与属性名一样-->
<%--<jsp:setProperty name="user" property="*" /> --%>
<%--<jsp:setProperty name="实例名" property="*" /> --%>

<!--方法2:根据提交的表单为user指定属性赋值-->
<%--<jsp:setProperty name="实例名" property="属性名" /> --%>
<%--<jsp:setProperty name="user" property="username" />--%>

<!--方法3:不通过表单,手工为属性赋值-->
<%--<jsp:setProperty name="实例名" property="属性名" value="值" /> --%>
<jsp:setProperty name="user" property="password" value="888888"/>

<!--方法4:根据request对象为属性赋值,同方法3一致-->
<%--<jsp:setProperty name="实例名" property="属性名" param="request对象中是参数名" /> --%>
<jsp:setProperty name="user" property="username" param="username" />


<br>
<!--使用传统表达式方式获取用户名和密码-->
用户名: <%=user.getUsername()%><br>
密码: <%=user.getPassword()%><br>

<!--使用jsp:getProperty获取用户名和密码-->
用户名: <jsp:getProperty name="user" property="username"/><br>
密码: <jsp:getProperty name="user" property="password"/><br>

<h2>session作用域</h2>
<!--session作用域-->
<jsp:useBean id="usersession" class="com.javabean.Users" scope="session"/>
<jsp:setProperty name="usersession" property="*"/>
<!--使用jsp:getProperty获取用户名和密码-->
用户名: <jsp:getProperty name="usersession" property="username"/><br>
密码: <jsp:getProperty name="usersession" property="password"/><br>

<h2>application作用域</h2>
<!--application作用域-->
<jsp:useBean id="userapplication" class="com.javabean.Users" scope="application"/>
<jsp:setProperty name="userapplication" property="*"/>
<!--使用jsp:getProperty获取用户名和密码-->
用户名: <jsp:getProperty name="userapplication" property="username"/><br>
密码: <jsp:getProperty name="userapplication" property="password"/><br>

<h2>request作用域</h2>
<!--request作用域, 只在当前请求中有效-->
<jsp:useBean id="userrequest" class="com.javabean.Users" scope="request"/>
<jsp:setProperty name="userrequest" property="*"/>
<!--使用jsp:getProperty获取用户名和密码-->
用户名: <jsp:getProperty name="userrequest" property="username"/><br>
密码: <jsp:getProperty name="userrequest" property="password"/><br>
<!--request作用域可以使用request转发使用请求转到下一页面-->
<%
    /*request.getRequestDispatcher("javabeanscope.jsp").forward(request,response);*/
%>

<a href="javabeanscope.jsp">scope作用范围测试</a>
</body>
</html>
