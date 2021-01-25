<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/24
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%----%>
<html>
<head>
    <title>Title</title>
    <!--引入jQuery-->
    <script src="static/jQuery/js/jquery-3.5.1.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件id="login_username" -->
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件id="login_password" -->
    <script src="static/bootstrap/js/bootstrap.min.js" ></script>
</head>
<body>
<%--
<a>${sessionScope.msg}</a>
<form action="login">
<input type="text"  required="required" name="username" />
<br>
<input type="password"  required="required" name="password"/>
<br>
    <input type="submit" value="login" class="btn btn-primary" />
</form>
<a href="inR" >还没有账号注册一个</a>
--%>
<div>
    <h5>用户饮水管理系统</h5>
</div>
<div class="container">
<form action="login" method="get">
    <a>${sessionScope.msg}</a>
    <div class="form-group">
        <label for="username">USERNAME</label>
        <input type="text" class="form-control" id="username" name="username" placeholder="username"/>
    </div>
    <div class="form-group">
        <label for="password">PASSWORD</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Password" />
    </div>
    <div class="checkbox">
        <a href="inR" >还没有账号注册一个</a>
    </div>
    <input type="submit" class="btn btn-success" value="登录" />
</form>
</div>
</body>
</html>
