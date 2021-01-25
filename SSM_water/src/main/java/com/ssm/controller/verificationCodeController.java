package com.ssm.controller;

import com.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class verificationCodeController {
    @Autowired
    UserServiceImpl userService;

    @RequestMapping("/getVerificationCode")
    @ResponseBody
    public String getVerificationCode(String username) {
        return userService.selectByName_all(username);
    }
    @RequestMapping("/judgeVerificationCode")
    public String judgeVerificationCode(String username,String verificationCode,HttpSession session){
        if (verificationCode.equals(userService.selectByName_all(username))){
            return "hotWater";
        }
        session.setAttribute("ERROR01","打水码错误");
            return "main";
    }
}
