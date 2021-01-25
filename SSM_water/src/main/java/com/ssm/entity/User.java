package com.ssm.entity;

public class User {
    private int id;
    private String username;
    private String password;
    private int money;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
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

    public User(int id, String username, String password, int money) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.money = money;
    }

    public User() {
    }

}
