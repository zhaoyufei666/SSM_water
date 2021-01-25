package com.ssm.entity;

public class Information {
    private int id;
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

    public Information(int id, String verificationCode, int totalTime, int hotWater, int coldWater) {
        this.id = id;
        this.verificationCode = verificationCode;
        this.totalTime = totalTime;
        this.hotWater = hotWater;
        this.coldWater = coldWater;
    }

    public Information() {
    }
}
