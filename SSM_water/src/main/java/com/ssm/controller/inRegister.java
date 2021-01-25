package com.ssm.controller;

import com.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class inRegister {
    //用于页面跳转到注册界面
    @RequestMapping("/inR")
    public String inR(){
        return "register";
    }
    //用于页面跳转到主页面
    @RequestMapping("/inM")
    public String inM(){
        return "main";
    }
    @RequestMapping("/inL")
    public String inL(){
        return "login";
    }
    @RequestMapping("/inlist")
    public String inlist(){
        return "list";
    }
    //跳转到打热水界面
    @RequestMapping("/inWater")
    public String inWater(){
        return "hotWater";
    }
    //跳转到打冷水界面
    @RequestMapping("/inWater1")
    public String inWater1(){
        return "coldWater";
    }
    //查询还剩多少钱，并放入session中
    @Autowired
    UserServiceImpl userService;
    @RequestMapping("/selectSurplus")
    public String selectSurplus(String username,HttpSession session){
        session.setAttribute("msg","还剩");
        session.setAttribute("Money",userService.selectByName(username).getMoney());
        return "last";
    }
}
