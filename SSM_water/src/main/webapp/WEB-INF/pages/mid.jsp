<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/12/15
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%----%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a id="username">${sessionScope.user}</a>
<script>
    $(function () {
        $.get("getVerificationCode", {
            username: $("#username").val()
        }, function (data) {
alert(data);
        });
    });
</script>
<a>${sessionScope.msg}</a>
<a>${sessionScope.verificationCode}</a>
<a href="inWater">点击进入打水界面</a>
</body>
</html>
