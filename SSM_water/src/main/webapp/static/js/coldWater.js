function $(id) {
    return document.getElementById(id)
}
window.onload = function() {
        //点击开始建 开始计数
        var count2 = 0
        var timer2 = null //timer变量记录定时器setInterval的返回值
        $("start2").onclick = function() {
            timer2 = setInterval(function() {
                count2++;
                console.log(count2)
                // 需要改变页面上时分秒的值
                console.log($("id_S2"))
                $("id_S2").innerHTML = showNum2(count2 % 60)
                $("id_M2").innerHTML = showNum2(parseInt(count2 / 60) % 60)
                $("id_H2").innerHTML = showNum2(parseInt(count2 / 60 / 60))
            }, 1000)
        }
        $("pause2").onclick = function() {
            //取消定时器
            clearInterval(timer2)
        }
        //停止记数  数据清零  页面展示数据清零
        $("stop2").onclick = function() {
            //取消定时器
            $("pause2").onclick()
            // clearInterval(timer)
            var money2;
            if(count2<=60){
                money2=2;
                alert("本次消费共花费"+money2);
            }
            else {
                money2=2+parseInt(count2/60);
                alert("本次消费共花费"+money2);
            }
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