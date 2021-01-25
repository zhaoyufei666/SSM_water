package com.ssm.service.impl;

import com.ssm.dao.UserDao;
import com.ssm.entity.Mix;
import com.ssm.entity.User;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao dao;

    @Override
    public List<User> findAll() {
        return dao.findAll();
    }

    @Override
    public User selectByName(String username) {
        return dao.selectByName(username);
    }

    @Override
    public int changeMoney(int money, String username) {
        return dao.changeMoney(money, username);
    }

    @Override
    public void register(String username, String password, int money) {
        dao.register(username, password, money);
    }

    @Override
    public void delete(String username) {
        dao.delete(username);
    }

    @Override
    public void update(String username, String password, int money) {
        dao.update(username, password, money);
    }

    @Override
    public void insertInformation() {
        String verificationCode;
        int totalTime;
        int hotWater;
        int coldWater;
        int num = (int) (Math.random() * 1000);
        verificationCode = String.valueOf(num);
        totalTime = 0;
        hotWater = 0;
        coldWater = 0;
        dao.insertInformation(verificationCode, totalTime, hotWater, coldWater);
    }

    @Override
    public String selectByName_all(String username) {
        return dao.selectByName_all(username);
    }

    @Override
    public void hotWater(int money, int hotWater, int totalTime, String username) {
        int lastHotWater = dao.selectHotWaterByName(username) + hotWater;
        int lastTotalTime = dao.selectTotalTimeWaterByName(username) + totalTime;
        dao.hotWater(money, lastHotWater, lastTotalTime, username);
    }

    @Override
    public void coldWater(int money, int coldWater, int totalTime, String username) {
        int lastColdWater = dao.selectColdWaterByName(username) + coldWater;
        int lastTotalTime = dao.selectTotalTimeWaterByName(username) + totalTime;
        //dao.coldWater(money, coldWater, totalTime, username);
        dao.coldWater(money, lastColdWater, lastTotalTime, username);
    }

    @Override
    public List<Mix> selectAll() {
        return dao.selectAll();
    }

    @Override
    public List<Mix> selectByUsername01(String username) {
        return dao.selectByUsername01(username);
    }

}
