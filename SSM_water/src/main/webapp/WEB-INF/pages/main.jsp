<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/25
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%----%>
<html>
<head>
    <title>Title</title>
    <!--引入jQuery-->
    <script src="static/jQuery/js/jquery-3.5.1.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<%
    String name = (String) session.getAttribute("user");
%>
<body>
<div class="container">
    <%--获得session中用户的名字--%>
    欢迎用户:<a id="name">${sessionScope.user}</a>
    <button id="buttonVerificationCode" class="btn-success">获取打水码</button>
    <script>
        $(function () {
            $("#buttonVerificationCode").on("click", function () {
                $.get("getVerificationCode", {
                    username: $("#select_name").val()
                }, function (data) {
                    alert("您的打水码为"+data);
                });
            });
        });
    </script>
        <a>${sessionScope.ERROR01}</a>
        <form class="form-inline" action="judgeVerificationCode">
            <%--获得Java中name的值并赋值给这个username--%>
            <input type="hidden" name="username" value="<%=name%>"/>
            <div class="form-group">
                <label class="sr-only" for="exampleInputAmount">请输入打水码</label>
                <div class="input-group">
                    <div class="input-group-addon"></div>
                    <input type="text" class="form-control"  name="verificationCode" placeholder="请输入打水码">
                    <div class="input-group-addon"></div>
                </div>
            </div>
            <input type="submit" class="btn btn-primary" value="选择冷热水"/>
        </form>
    <form class="form-inline" action="Money/decrease">
        <%--获得Java中name的值并赋值给这个username--%>
        <input type="hidden" name="username" value="<%=name%>"/>
        <div class="form-group">
            <label class="sr-only" for="exampleInputAmount">请输入打水金额</label>
            <div class="input-group">
                <div class="input-group-addon">￥</div>
                <input type="text" class="form-control" id="exampleInputAmount" name="aMoney" placeholder="请输入打水金额">
                <div class="input-group-addon">.00</div>
            </div>
        </div>
        <input type="submit" class="btn btn-primary" value="点击打水"/>
    </form>
    <%--
<form action="Money/decrease">
    获得Java中name的值并赋值给这个username
<input type="hidden" name="username" value="<%=name%>" />
    <input type="number" name="aMoney" />
    <input type="submit" value="打水" class="btn-primary"/>
</form>--%>
    <!--
<button id="button_decrease">打水</button>
-->
    <form class="form-inline" action="Money/increase">
        <%--获得Java中name的值并赋值给这个username--%>
        <input type="hidden" name="username" value="<%=name%>"/>
        <div class="form-group">
            <label class="sr-only" for="exampleInputAmount">请输入充值金额</label>
            <div class="input-group">
                <div class="input-group-addon">￥</div>
                <input type="text" class="form-control" id="exampleInputAmount01" name="aMoney" placeholder="请输入充值金额">
                <div class="input-group-addon">.00</div>
            </div>
        </div>
        <input type="submit" class="btn btn-primary" value="点击充值"/>
    </form>
    <%--
<form action="Money/increase">
    <input type="hidden" name="username" value="<%=name%>" />
    <input type="number" name="aMoney" />
    <input type="submit" value="充值" class="btn-primary"/>
    --%>
    <!--
<button id="button_increase">充值</button>
    -->
    </form>
    <form action="selectSurplus">
        <input type="hidden" name="username" value="<%=name%>" id="select_name"/>

        <!--
        <button id="button_select" >查询我的余额</button>
        -->
        <input type="submit" value="查询我的余额" class="btn-primary">
    </form>
    <form action="user/delete">
        <input type="hidden" name="username" value="<%=name%>"/>
        <input type="submit" value="注销当前用户" class="btn-primary">
    </form>
</div>
<script src="static/js/main.js"></script>
</body>
</html>
