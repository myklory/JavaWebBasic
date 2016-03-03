<%--
  Created by IntelliJ IDEA.
  User: 刘英明
  Date: 2016/3/3
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JavaBean测试登陆</title>
</head>
<body>
<h1>JavaBean测试登陆</h1>
<form action="usebean.jsp">
    <table>
        <tr>
            <td>用户名</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="text" name="password"></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="登录"></td>
        </tr>
    </table>
</form>
</body>
</html>
