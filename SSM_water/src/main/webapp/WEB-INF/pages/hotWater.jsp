<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%----%>
<html>
<head>
    <title>Title</title>
    <script src="static/jQuery/js/jquery-3.5.1.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <style>
        #div2 {
            width: 300px;
            height: 400px;
            background: red;
            margin: 100px auto;
            text-align: center;
        }

        #count2 {
            width: 200px;
            height: 150px;
            line-height: 150px;
            margin: auto;
            font-size: 40px;
        }

        #div2 input {
            width: 150px;
            height: 40px;
            background: orange;
            font-size: 25px;
            margin-top: 20px
        }
    </style>
</head>
<body>
<%
    String name = (String) session.getAttribute("user");
%>
<center>欢迎用户:<a>${sessionScope.user}</a></center>
<!--热水单价一分钟2元/分钟，冷水一元/分钟，超过一分钟统一按照1元一分钟-->
<div id="div2">
    <h2>热水</h2>
    <div id="count2">
        <span id="id_H2">00</span>
        <span id="id_M2">00</span>
        <span id="id_S2">00</span>
    </div>
    <input id="start2" type="button" value="开始">
    <input id="pause2" type="button" value="暂停">
    <input id="stop2" type="button" value="停止">
</div>
<!--///////////////////////////////////////////////////////////////////////-->
<center>
    <a href="inWater1">冷水</a>
</center>
</body>
<form action="hotWater">
    <input type="hidden" name="username" value="<%=name%>" id="username_hotWater"/>
    <input type="hidden" id="main" name="money"/>
    <input type="hidden" id="main2" name="totalTime"/>
    <input type="submit" value="返回主页面" />
</form>
<script>
    function $(id) {
        return document.getElementById(id)
    }
    window.onload = function () {
        //点击开始建 开始计数
        var money2;
        var count2 = 0
        var timer2 = null //timer变量记录定时器setInterval的返回值
        $("start2").onclick = function () {
            timer2 = setInterval(function () {
                count2++;
                console.log(count2)
                // 需要改变页面上时分秒的值
                console.log($("id_S2"))
                $("id_S2").innerHTML = showNum2(count2 % 60)
                $("id_M2").innerHTML = showNum2(parseInt(count2 / 60) % 60)
                $("id_H2").innerHTML = showNum2(parseInt(count2 / 60 / 60))
            }, 1000)
        }
        $("pause2").onclick = function () {
            //取消定时器
            clearInterval(timer2)
        }
        //停止记数  数据清零  页面展示数据清零
        $("stop2").onclick = function () {
            //取消定时器
            $("pause2").onclick()
            // clearInterval(timer)
            if (count2 <= 60) {
                money2 = 2;
                alert("本次消费共花费" + money2);
                document.getElementById("main").value=money2;
            } else {
                money2 =1+parseInt(count2 / 60);
                alert("本次消费共花费" + money2);
                document.getElementById("main").value=money2;
            }
            document.getElementById("main2").value=count2;
            //  request(money2,count2,username);
            //数据清零  总秒数清零
            count2 = 0
            //页面展示数据清零
            $("id_S2").innerHTML = "00"
            $("id_M2").innerHTML = "00"
            $("id_H2").innerHTML = "00"
        }

        //封装一个处理单位数字的函数
        function showNum2(num2) {
            if (num2 < 10) {
                return '0' + num2
            }
            return num2
        }
    }
</script>
<script>
    $(function () {
        $("#stop2").on("click", function () {
            $.get("hotWater", {
                username: $("#username_hotWater"),
                money: $("#main").val(),
                totalTime: $("#main2").val()
            })
        });
    });
</script>
</html>
