package com.ssm.controller;

import com.ssm.entity.User;
import com.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class WaterController {
    @Autowired
    UserServiceImpl userService;
    @RequestMapping("/hotWater")
    public String hotWater(String username, int money, int totalTime, HttpSession session){
        int hotWater=money;
        User user=userService.selectByName(username);
        int Money=user.getMoney();
        //当Money不够打水金额时，将原本金额放入session中
        if ((Money-money)<=-1){
            session.setAttribute("msg","余额不足");
            session.setAttribute("Money",Money);
           // return "last";
        }
        //当Money够打水金额时，扣除金额放入session中，跳转界面
        int changedMoney=Money-money;
       // userService.changeMoney(changedMoney,username);
        userService.hotWater(changedMoney,hotWater,totalTime,username);
        session.setAttribute("msg","接水成功");
        session.setAttribute("Money",changedMoney);
       // return "last";
        return "main";
    }
    @RequestMapping("/coldWater")
    public String coldWater(String username, int money, int totalTime, HttpSession session){
        int coldWater=money;
        User user=userService.selectByName(username);
        int Money=user.getMoney();
        //当Money不够打水金额时，将原本金额放入session中
        if ((Money-money)<=-1){
            session.setAttribute("msg","余额不足");
            session.setAttribute("Money",Money);
            // return "last";
        }
        //当Money够打水金额时，扣除金额放入session中，跳转界面
        int changedMoney=Money-money;
        // userService.changeMoney(changedMoney,username);
        userService.coldWater(changedMoney,coldWater,totalTime,username);
        session.setAttribute("msg","接水成功");
        session.setAttribute("Money",changedMoney);
        // return "last";
        // return "";
        return "main";
    }
}
