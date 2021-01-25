package com.ssm.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.User;
import com.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

//测试数据库的连接和springMvc的基本运行
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserServiceImpl userService;

    @RequestMapping(value = "/findAll")
    public List<User> findAll() {
        return userService.findAll();
    }

    @RequestMapping(value = "/selectByName")
    public User selectByName(String username) {
        return userService.selectByName(username);
    }

    @RequestMapping(value = "/changeMoney")
    public int changeMoney(int money, String username) {
        return userService.changeMoney(money, username);
    }

    @RequestMapping("/register")
    public void register(String username, String password, int money) {
        userService.register(username, password, money);
    }

    @RequestMapping("/delete")
    public String delete(String username) {
        userService.delete(username);
        return "DESTROY SUCCESSFUL!!!";
    }
    @RequestMapping("/update")
    public void update(@RequestParam(value = "username") String username,
                       @RequestParam(value = "password") String password,
                       @RequestParam(value = "aMoney") int money){
            userService.update(username, password, money);
    }
    //分页
    @RequestMapping("/findAll01")
    public Object findAll01(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                            @RequestParam(value = "pageSize", defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> list = userService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    //按名字查询
    @RequestMapping("/findAll02")
    public Object findAll02(@RequestParam(value = "username") String username,
                            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                            @RequestParam(value = "pageSize", defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> list = new ArrayList<>();
        list.add(userService.selectByName(username));
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }
}
