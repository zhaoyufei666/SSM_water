package com.ssm.controller;

import com.ssm.entity.User;
import com.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
//登录界面
public class LoginController {
    @Autowired
    UserServiceImpl userService;
    @RequestMapping("/login")
    public Object judgeLogin(String username,
                        String password,
                       HttpSession session) {
        //通过前端传入的username调用selectByName,查询到user表中的User对象
        User user=userService.selectByName(username);
        //若user为空则，输入的账号为空
        if(user!=null){
            //管理员判断
            if (username.equals("zyf") && password.equals("123")){
                session.setAttribute("msg",username);
                return "list";
            }
            //普通用户判断
             if (user.getPassword().equals(password)){
                 //账号密码都正确放入将user对象session中，跳转到主页面
                 session.setAttribute("user",user.getUsername());
                 return "main";
             }
        }
        //密码错误&用户名不存在
       String msg= "密码错误&用户名不存在";
        session.setAttribute("msg",msg);
        return "login";
    }
}
