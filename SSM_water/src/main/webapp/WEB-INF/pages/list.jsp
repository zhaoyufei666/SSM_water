<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/12/10
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%----%>
<html>
<head>
    <title>Title</title>
    <!--引入jQuery-->
    <script src="static/jQuery/js/jquery-3.5.1.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件id="login_username" -->
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件id="login_password" -->
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div>
    <a>欢迎管理员</a>
    <a>${sessionScope.msg}</a>
</div>
<%--    ------------查找框----------------%>
<div class="col-lg-4">
    <div class="input-group">
        <input type="text" class="form-control" placeholder="测试中莫得点击" id="search_username">
        <span class="input-group-btn">
                        <%-- 查找按钮 --%>
                        <button class="btn btn-primary glyphicon glyphicon-search" type="button"
                                id="search_button">Search</button>
                    </span>
    </div><!-- 查找的js -->
    <script>
        $(function () {
            $("#search_button").on("click", function () {
                $.get("selectByUsername01", {
                    username: $("#search_username").val()
                }, function (data) {
                    console.log(data.list);
                    build_emps_table(data.list);
                });
            });
            //遍历输出list
            function build_emps_table(list) {
                //清空数据
                $("#myTable tbody").empty();
                $.each(list, function (index, item) {
                    var usernameTd = $("<td></td>").append(item.username);
                    var passwordTd = $("<td></td>").append(item.password);
                    var moneyTd = $("<td></td>").append(item.money);
                    var verificationCodeTd=$("<td></td>").append(item.verificationCode);
                    var totalTimeTd=$("<td></td>").append(item.totalTime);
                    var hotWaterTd=$("<td></td>").append(item.hotWater);
                    var coldWaterTd=$("<td></td>").append(item.coldWater);
                    var editTd= $("<button></button>").addClass("btn btn-info btn-sm edit_btn").append($("<span></span>")).append("edit");
                    editTd.attr("edit_username",item.username).attr("data-toggle","modal").attr("data-target","#myModal");
                    var btnTd=$("<td></td>").append(editTd);
                    $("<tr></tr>")
                        .append(usernameTd)
                        .append(passwordTd)
                        .append(moneyTd)
                        .append(verificationCodeTd)
                        .append(totalTimeTd)
                        .append(hotWaterTd)
                        .append(coldWaterTd)
                        .append(btnTd)
                        .appendTo("#myTable tbody");
                });
            }
        });
    </script>
</div><!-- /.col-lg-6 -->
<%--
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">开始演示模态框</button>--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">请修改用户信息</h4>
            </div>
            <div class="modal-body">
                </label><input type="text" id="Cusername" placeholder="USERNAME" />
                </label><input type="number" id="Cpassword" placeholder="PASSWORD" />
               </label><input type="number" id="Cmoney" placeholder="MONEY" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="ChangeUser">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div>
<!-- 模态框的js -->
<script>
    $(function () {
   $("#ChangeUser").on("click",function () {
$.get("user/update",{
    username:$("#Cusername").val(),
    password:$("#Cpassword").val(),
    aMoney:$("#Cmoney").val()
},function () {
alert("修改成功");
})
   });
    });
</script>
<div>
    <table class="table" id="myTable">
        <thead>
        <tr>
            <th>username</th>
            <th>password</th>
            <th>money</th>
            <th>verificationCode</th>
            <th>totalTime</th>
            <th>hotWater</th>
            <th>coldWater</th>
            <th>edit</th>
        </tr>
        </thead>
        <tbody>
        <!--用户信息-->
        </tbody>
    </table>
</div>
<%-- 显示分页信息 --%>
<div class="row">
    <%-- 分页文字信息 --%>
    <div class="col-md-6" id="page_info_area"></div>

    <%-- 分页条信息 --%>
    <div class="col-md-6" id="page_nav_area"></div>
</div>
<script>
    $(function () {
        $.get("user/findAll01", function (data) {
            console.log(data);
            //去首页
            to_page(1);
        });

        //实现页面跳转，想跳到第几页就传参数
        function to_page(page) {
            $.get("selectAll",
                {pageNum: page},
                function (data) {
                    // 1、解析并显示员工数据
                    build_emps_table(data.list);
                    // 2、解析并显示分页信息
                    build_page_info(data);
                    // 3、解析并显示分页条
                    build_page_nav(data);
                });
        }

        //遍历list输出用户信息
        function build_emps_table(list) {
            //清空数据
            $("#myTable tbody").empty();
            $.each(list, function (index, item) {
                var usernameTd = $("<td></td>").append(item.username);
                var passwordTd = $("<td></td>").append(item.password);
                var moneyTd = $("<td></td>").append(item.money);
                var verificationCodeTd=$("<td></td>").append(item.verificationCode);
                var totalTimeTd=$("<td></td>").append(item.totalTime);
                var hotWaterTd=$("<td></td>").append(item.hotWater);
                var coldWaterTd=$("<td></td>").append(item.coldWater);
                var editTd= $("<button></button>").addClass("btn btn-info btn-sm edit_btn").append($("<span></span>")).append("edit");
                editTd.attr("edit_username",item.username).attr("data-toggle","modal").attr("data-target","#myModal");
                var btnTd=$("<td></td>").append(editTd);
                $("<tr></tr>")
                    .append(usernameTd)
                    .append(passwordTd)
                    .append(moneyTd)
                    .append(verificationCodeTd)
                    .append(totalTimeTd)
                    .append(hotWaterTd)
                    .append(coldWaterTd)
                    .append(btnTd)
                    .appendTo("#myTable tbody");
            });
        }

        //分页按钮
        function build_page_nav(data) {
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");


            //构建首页和上一页的标签
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            //如果没有上一页，就设置首页和上一页的按钮不可用
            if (data.hasPreviousPage == false) {
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            } else {
                //如果有上一页，才绑定单击事件
                //为首页标签添加单击事件
                firstPageLi.click(function () {
                    to_page(1);
                });
                //为上一页标签添加单击事件
                prePageLi.click(function () {
                    to_page(data.pageNum - 1);
                });
            }


            //下一页和尾页
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
            //如果没有下一页，就设置下一页和尾页按钮不可用
            if (data.hasNextPage == false) {
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            } else {
                //如果有下一页，才绑定单击事件
                //为下一页标签添加单击事件
                nextPageLi.click(function () {
                    to_page(data.pageNum + 1);
                });
                //为尾页标签添加单击事件
                lastPageLi.click(function () {
                    to_page(data.pages);
                });
            }


            //添加首页和前一页到ul标签中
            ul.append(firstPageLi).append(prePageLi);

            //遍历，给ul中添加页码
            $.each(data.navigatepageNums, function (index, item) {

                var numLi = $("<li></li>").append($("<a></a>").append(item));

                //绑定单击事件，点击页码进行跳转
                numLi.click(function () {
                    to_page(item);
                })

                //当前页数高亮显示
                if (data.pageNum == item) {
                    numLi.addClass("active");
                }

                ul.append(numLi);
            })

            //添加下一页和尾页到ul标签中
            ul.append(nextPageLi).append(lastPageLi);

            //把ul添加到nav标签中
            var navEle = $("<nav></nav>").append(ul).appendTo("#page_nav_area");

        }

        // 3、解析并显示分页文字信息
        function build_page_info(data) {
            //清空分页文字信息，如果不清空，当页面刷新的时候新的数据不会覆盖旧数据，造成页面混乱
            $("#page_info_area").empty();

            $("#page_info_area").append("当前第" + data.pageNum + "/" +
                data.pages + "页，共" +
                data.total + "条记录。");

            // 赋值总记录数，方便后面调用
            totalRecordCount = data.total;
            //赋值当前页数，方便后面调用
            currentPage = data.pageNum;
        }
    });
</script>
</body>
</html>
