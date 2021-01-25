package com.ssm.controller;

import com.ssm.entity.User;
import com.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Money")
public class MoneyController {
    @Autowired
    UserServiceImpl userService;
    @RequestMapping("/decrease")
    //打水获得打水的对象username和打水的金额aMoney
    public String decrease(String username,int aMoney, HttpSession session){
        //通过username查询到数据库中的User对象
       User user=userService.selectByName(username);
        int Money=user.getMoney();
        //当Money不够打水金额时，将原本金额放入session中
        if ((Money-aMoney)<=-1){
            session.setAttribute("msg","余额不足");
            session.setAttribute("Money",Money);
            return "last";
        }
        //当Money够打水金额时，扣除金额放入session中，跳转界面
       int changedMoney=Money-aMoney;
       userService.changeMoney(changedMoney,username);
       session.setAttribute("msg","接水成功");
        session.setAttribute("Money",changedMoney);
        return "last";
    }
    //充值界面
    @RequestMapping("/increase")
    public String increase(String username,int aMoney,HttpSession session){
        //通过username查询到数据库中的User对象
        User user=userService.selectByName(username);
        //将充值金额和本来的钱数相加，update数据库，放入session，跳转界面
        int changedMoney=user.getMoney()+aMoney;
        userService.changeMoney(changedMoney,username);
        session.setAttribute("msg","充值成功");
        session.setAttribute("Money",changedMoney);
        return "last";
    }
}
