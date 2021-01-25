<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/26
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%----%>
<html>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
    <title>Title</title>
</head>
<body>
<%--通过session获得后端的数据--%>
<a>${sessionScope.msg}</a>
<a>${sessionScope.Money}</a>
<%--跳转主页面按钮--%>
<a href="${APP_PATH}/inM">点击返回</a>
</body>
</html>
