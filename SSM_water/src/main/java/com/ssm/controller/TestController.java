package com.ssm.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
//测试类，无意义
@RestController
public class TestController {
    @RequestMapping("/test")
    public String test(){
        return "test";
    }
}
