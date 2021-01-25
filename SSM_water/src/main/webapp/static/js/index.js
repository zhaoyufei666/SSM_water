$(function () {
$("#button_test").on("click",{
    username:$("#login_username").val(),
    password:$("#login_password").val()
},function () {
$.get("login",function (data) {
if (data==="success"){
    window.location.href="main.jsp";
}
else {
    alert("用户名或密码错误");
}
});
});
});