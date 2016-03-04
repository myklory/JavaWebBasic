# JSP指令与动作

标签（空格分隔）： JavaWeb

---
[TOC]

##**1. include指令**
include指令可以包含其它页面,将其他页面的内容显示到当前页面上,语法如下:
```jsp
<%@include file="需要包含的文件" />
```

##**2. include动作**

语法:
```jsp
<jsp:include page="URL" flush="true|false" />
```
URL:要包含的页面

flush:是否从缓冲区读取页面

从效果上看include指令和include动作没有任何区别,但是他们在处理方式上还是有区别
##**3. include动作和指令的区别**
|  区别 |include指令|jsp:include动作|
|--|--|--|
|语法格式|<%@include file=".." %> | &lt;jsp:include page=".."/> |
|发生作用的时间|页面转换期间|请求期间|
|包含的内容|文件实际内容|页面的输出|
|转换成的Servlet|主页面和包含页面转换成一个Servlet|主页面和包含页面转换成独立的页面|
|编译时间|较慢--资源必须被解析|较快|
|执行时间|稍快|较慢--每次资源必须被解析|

##**4. forward动作**
实现页面的跳转.
语法:
```jsp
<jsp:forward page="URL"/>
```
等同于:
```jsp
request.getRequestDispatcher("/url").forward(resquest,response);
```
##**5. param动作**

语法:
```jsp
<jsp:param name="参数名" value="值" />
```
通常与&lt;jsp:forward>一起使用,作为其的子标签,用法
```jsp
<jsp:forward page="user.jsp">
    <jsp:param name="eamil" value="aa@bb.com" />
</jsp:forward>
```

