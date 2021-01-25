package com.ssm.dao;

import com.ssm.entity.Mix;
import com.ssm.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
@Mapper
public interface UserDao {
    @Select("select * from user")
    List<User> findAll();

    @Select("select * from user where username=#{username}")
    User selectByName(@Param("username") String username);

    @Update("update user set money=#{money} where username=#{username}")
    int changeMoney(@Param("money") int money, @Param("username") String username);

    @Insert("insert into user(username,password,money) values(#{username},#{password},#{money})")
    void register(@Param("username") String username, @Param("password") String password, @Param("money") int money);

    @Delete("delete from user where username=#{username}")
    void delete(@Param("username") String username);

    @Update("update user set password=#{password},money=#{money} where username=#{username}")
    void update(@Param("username") String username, @Param("password") String password, @Param("money") int money);

    @Insert("insert into information(verificationCode,totalTime,hotWater,coldWater) values(#{verificationCode},#{totalTime},#{hotWater},#{coldWater})")
    void insertInformation(@Param("verificationCode") String verificationCode,
                           @Param("totalTime") int totalTime,
                           @Param("hotWater") int hotWater,
                           @Param("coldWater") int coldWater);
    @Select("select verificationCode from user a,information b WHERE a.id=b.id and username=#{username}")
    String selectByName_all(@Param("username") String username);
    @Select("select hotWater from user a,information b WHERE a.id=b.id and username=#{username}")
    int selectHotWaterByName(@Param("username") String username);
    @Select("select coldWater from user a,information b WHERE a.id=b.id and username=#{username}")
    int selectColdWaterByName(@Param("username") String username);
    @Select("select totalTime from user a,information b WHERE a.id=b.id and username=#{username}")
    int selectTotalTimeWaterByName(@Param("username") String username);
    @Update("update user,information set user.money=#{money},information.hotWater=#{hotWater},information.totalTime=#{totalTime} where user.id=information.id and username=#{username}")
    void hotWater(@Param("money") int money,@Param("hotWater") int hotWater,@Param("totalTime") int totalTime,@Param("username") String username);
    @Update("update user,information set user.money=#{money},information.coldWater=#{coldWater},information.totalTime=#{totalTime} where user.id=information.id and username=#{username}")
    void coldWater(@Param("money") int money,@Param("coldWater") int hotWater,@Param("totalTime") int totalTime,@Param("username") String username);
    @Select("SELECT a.id,a.username,a.`password`,a.money,b.verificationCode,b.totalTime,b.hotWater,b.coldWater FROM user a,information b WHERE b.id=a.id")
    List<Mix> selectAll();
    @Select("select a.id,a.username,a.`password`,a.money,b.verificationCode,b.totalTime,b.hotWater,b.coldWater  from user a,information b WHERE a.id=b.id and username=#{username}")
    List<Mix> selectByUsername01(@Param("username") String username);
}
