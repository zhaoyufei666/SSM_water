package com.ssm.entity;

public class Mix {
    private int id;
    private String username;
    private String password;
    private int money;
    private String verificationCode;
    private int totalTime;
    private int hotWater;
    private int coldWater;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public int getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(int totalTime) {
        this.totalTime = totalTime;
    }

    public int getHotWater() {
        return hotWater;
    }

    public void setHotWater(int hotWater) {
        this.hotWater = hotWater;
    }

    public int getColdWater() {
        return coldWater;
    }

    public void setColdWater(int coldWater) {
        this.coldWater = coldWater;
    }

    public Mix() {
    }

    public Mix(int id, String username, String password, int money, String verificationCode, int totalTime, int hotWater, int coldWater) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.money = money;
        this.verificationCode = verificationCode;
        this.totalTime = totalTime;
        this.hotWater = hotWater;
        this.coldWater = coldWater;
    }
}
