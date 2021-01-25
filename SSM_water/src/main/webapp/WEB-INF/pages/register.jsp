<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/25
  Time: 11:35s
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%----%>
<html>
<head>
    <title>Title</title>
    <!--引入jQuery-->
    <script src="static/jQuery/js/jquery-3.5.1.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="static/bootstrap/js/bootstrap.min.js" ></script>
    <script src="static/js/register.js"></script>
</head>
<body>
<%--获得session的数据--%>
<%--
<a>${sessionScope.msg}</a>
<form action="register">
<input type="text" id="register_username" required="required" name="username" />
<br>
<input type="password" id="register_password" required="required" name="password"/>
<br>
    <input type="submit" value="register" class="btn btn-primary" />
</form>--%>
<div class="container">
    <form action="register" method="get">
        <a>${sessionScope.msg}</a>
        <div class="form-group">
            <label for="username">USERNAME</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="username"/>
        </div>
        <div class="form-group">
            <label for="password">PASSWORD</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password" />
        </div>
        <input type="submit" class="btn btn-success" value="注册" />
    </form>
    </div>
</body>
</html>
