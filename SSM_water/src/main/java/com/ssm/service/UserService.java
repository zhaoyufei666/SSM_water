package com.ssm.service;

import com.ssm.entity.Mix;
import com.ssm.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    List<User> findAll();

    User selectByName(String username);

    int changeMoney(int money, String username);

    void register(String username, String password, int money);

    void delete(String username);

    void update(String username, String password, int money);

    void insertInformation();

    String selectByName_all(String username);
    void hotWater(int money,int hotWater,int totalTime,String username);
    void coldWater(int money,int coldWater,int totalTime,String username);
    List<Mix> selectAll();
    List<Mix> selectByUsername01(String username);
}
