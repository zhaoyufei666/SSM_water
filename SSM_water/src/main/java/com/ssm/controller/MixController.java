package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Mix;
import com.ssm.entity.User;
import com.ssm.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class MixController {
    @Autowired
    UserServiceImpl userService;
    @RequestMapping("/selectAll")
    public Object selectAll(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                               @RequestParam(value = "pageSize", defaultValue = "5") int pageSize){
        PageHelper.startPage(pageNum, pageSize);
        List<Mix> list= userService.selectAll();
        PageInfo pageInfo=new PageInfo(list);
        return pageInfo;
    }
    @RequestMapping("/selectByUsername01")
    public Object selectByUsername01(@RequestParam(value = "username") String username,
    @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
    @RequestParam(value = "pageSize", defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Mix> list = userService.selectByUsername01(username);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }
}
