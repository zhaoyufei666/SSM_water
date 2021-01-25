package com.ssm.controller;

import com.ssm.entity.User;
import com.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@Controller
public class RegisterController {
    @Autowired
    UserServiceImpl userService;
//注册界面
    @RequestMapping("/register")
    public String register(String username,
                           String password,
                           HttpSession session) {
        //如果用户名未重复
        if (userService.selectByName(username) == null) {
            //注册送5元
            userService.register(username, password, 5);
            userService.insertInformation();
           // User user=new User(username,password,5);
            session.setAttribute("user",username);
            //将user放入session中，跳转主页面
            return "main";
        }
        else {
            //用户名重复，跳转登录界面
            String msg="用户名已存在";
            session.setAttribute("msg",msg);
            return "register";
        }
    }
}
