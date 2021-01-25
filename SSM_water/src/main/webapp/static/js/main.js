$(function () {
    var NAME=$("#name").val();
    $("#button_decrease").on("click",function () {
        console.log(NAME);
        $.post("Money/decrease",{
            username:NAME
        },function (data) {
            alert(data);
        });
    });
    $("#button_increase").on("click",function () {
        $.post("Money/increase",{
            username:NAME
        },function (data) {
            alert(data);
        });
    });
    $("#button_select").on("click",function () {
        $.post("user/selectByName",{
            username:NAME
        },function (data) {
            alert(data);
        });
    });



});