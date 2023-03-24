package com.mywebsite.model;

import java.sql.Date;
import java.text.NumberFormat;
import java.util.Locale;

public class Account {
    private int accountID;
    private String userName;
    private String password;
    private double amount;
    private String email;
    private Date registerAt;
    private Date lastLogin;
    private Information information;

    public Account() {
    }

    public Account(int accountID, String userName, String password, double amount, String email, Date registerAt, Date lastLogin, Information information) {
        this.accountID = accountID;
        this.userName = userName;
        this.password = password;
        this.amount = amount;
        this.email = email;
        this.registerAt = registerAt;
        this.lastLogin = lastLogin;
        this.information = information;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getRegisterAt() {
        return registerAt;
    }

    public void setRegisterAt(Date registerAt) {
        this.registerAt = registerAt;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public Information getInformation() {
        return information;
    }

    public void setInformation(Information information) {
        this.information = information;
    }
    
    public String getAmountFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(amount);
    }
    
}
