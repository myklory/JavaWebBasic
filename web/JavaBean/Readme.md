# JavaBean

标签（空格分隔）： JavaWeb

---
[TOC]
##**1. Jsp动作**
JSP动作元素（action elements）,动作元素为请求处理阶段提供信息。动作元素遵循XML元素语法，有一个包含元素名的开始标签，可以有属性、可选的内容、与开始标签匹配的结束标签。
###**1.2 Jsp动作元素分类**
第一类是与存取JavaBean有关的，包括：

    <jsp:useBean><jsp:setProperty><jsp:getProperty>
    
第二类是JSP1.2就开始有的基本元素，包括6个动作元素

    <jsp:include><jsp:forward><jsp:param><jsp:plugin><jsp:params><jsp:fallback>
    
第三类是JSP2.0新增加的元素，主要与JSP Document有关，包括六个元素

    <jsp:root><jsp:declaration><jsp:scriptlet><jsp:expression><jsp:text><jsp:output>
    
第四类是JSP2.0新增加的动作元素，主要是用来动态生成XML元素标签的值，包括三个动作

    <jsp:attribute><jsp:body><jsp:element>
    
第五类是JSP2.0新增的动作元素，主要是用在Tag File中，有2个元素

    <jsp:invoke><jsp:dobody>
##**2. JavaBean**
JavaBean是一个普通的Java类。它有四个设计原则：

1.它是一个私有类

2.有一个无参的公有构造方法

3.属性是私有的

4.属性有Setter和Getter方法
###**2.1 在JSP中使用JavaBean**
和创建普通Java类一样在src目录下创建一个JavaBean类：
```java
package com.javabean;

/**
 * Created by myklory on 2016/3/3.
 */
public class Users { //规则1：这个类是公共的
    private String username;    //规则2：属性私有化
    private String password;
    
    //规则3:公有的无参构造方法
    public Users(){
        
    }
    
    //规则4:属性有Getter和Setter方法
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

```
####**2.1.1 普通方式调用**
普通方式调用和Java类的使用一致,在JSP中新建Users对象,再使用对象:
```jsp
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
```
####**2.1.2 使用JSP动作元素调用**
使用&lt;jsp:useBeans>调用Users类,基本语法如下:
```jsp
<!--javaBean动作元素创建Users实例,这里不需要导入包,可直接创建, 创建完成后可以在整个页面使用user对象-->
<%--<jsp:useBean id="标识符" class"JAVA类名" scope="作用范围" />--%>
<jsp:useBean id="user" class="com.javabean.Users" scope="page" />
```
####**2.1.3 setProperty**
创建实例之后就可以为user进行赋值,一共有4种方式,具体使用如下:
```jsp
<!--javaBean动作元素创建Users实例,这里不需要导入包,可直接创建, 创建完成后可以在整个页面使用user对象-->
<%--<jsp:useBean id="标识符" class"JAVA类名" scope="作用范围" />--%>
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

<h1>使用useBean动作元素创建JavaBean的实例</h1>
<br>
用户名: <%=user.getUsername()%><br>
密码: <%=user.getPassword()%><br>
```
####**2.1.4 getProperty**
使用getProperty获取指定javabean对象的属性值:
```jsp
<!--使用传统表达式方式获取用户名和密码-->
用户名: <%=user.getUsername()%><br>
密码: <%=user.getPassword()%><br>

<!--使用jsp:getProperty获取用户名和密码-->
用户名: <jsp:getProperty name="user" property="username"/><br>
密码: <jsp:getProperty name="user" property="password"/><br>
```
####**2.2 scope作用域**
JavaBean一共有4种作用域范围:page,request,session,application.

根据名字就可知分别在当前页面,当前请求,当前session,当前应用范围内有效.

具体使用是先在创建JavaBean对象时在scope属性中指明作用范围,在需要使用此对象的地方再次使用相同方式声明JavaBean对象. 如果超出作用范围就会生成一个新的对象.

创建JavaBean对象:
```jsp
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
```
使用声明的JavaBean对象:
```jsp
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
<!--3.session作用域测试-->
<jsp:useBean id="userapplication" class="com.javabean.Users" scope="application" />
<!--使用application.getAttribute方式显示-->
用户名: <%=((Users)application.getAttribute("userapplication")).getUsername()%><br>
密码: <%=((Users)application.getAttribute("userapplication")).getPassword()%><br>

<h2>4.request作用域</h2>
<!--4.request作用域-->
<jsp:useBean id="userrequest" class="com.javabean.Users" scope="request" />
<!--使用application.getAttribute方式显示-->
用户名: <%=((Users)request.getAttribute("userrequest")).getUsername()%><br>
密码: <%=((Users)request.getAttribute("userrequest")).getPassword()%><br>
```

