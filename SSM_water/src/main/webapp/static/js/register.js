$(function () {
    $("#button_register").on("click",{
        username:$("#register_username").val(),
        password:$("#register_password").val()
    },function () {
        $.get("register",function (data) {
            if (data==="success"){
                window.location.href="main.jsp";
            }
            else {
                alert("用户名重复");
            }
        });
    });
});