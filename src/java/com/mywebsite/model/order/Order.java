/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.model.order;

import com.mywebsite.model.Account;
import com.mywebsite.model.Payment;
import com.mywebsite.model.product.CompanyShip;
import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

/**
 *
 * @author phanh
 */
public class Order {


    private int orderID;
    private Account account;
    private Payment payment;
    private CompanyShip companyShip;
    private int status;
    private double totalMoney;
    private double orderDiscount;
    private String firstName;
    private String lastName;
    private String country;
    private String address;
    private String phone;
    private String orderNote;
    private Date orderCreateAt;
    private Date orderUpdateAt;

    public Order() {
    }

    public Order(int orderID, Account account, Payment payment, CompanyShip companyShip, int status, double totalMoney, double orderDiscount, String firstName, String lastName, String country, String address, String phone, String orderNote, Date orderCreateAt, Date orderUpdateAt) {
        this.orderID = orderID;
        this.account = account;
        this.payment = payment;
        this.companyShip = companyShip;
        this.status = status;
        this.totalMoney = totalMoney;
        this.orderDiscount = orderDiscount;
        this.firstName = firstName;
        this.lastName = lastName;
        this.country = country;
        this.address = address;
        this.phone = phone;
        this.orderNote = orderNote;
        this.orderCreateAt = orderCreateAt;
        this.orderUpdateAt = orderUpdateAt;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    


    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public double getOrderDiscount() {
        return orderDiscount;
    }

    public void setOrderDiscount(double orderDiscount) {
        this.orderDiscount = orderDiscount;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOrderNote() {
        return orderNote;
    }

    public void setOrderNote(String orderNote) {
        this.orderNote = orderNote;
    }

    public Date getOrderCreateAt() {
        return orderCreateAt;
    }

    public void setOrderCreateAt(Date orderCreateAt) {
        this.orderCreateAt = orderCreateAt;
    }

    public Date getOrderUpdateAt() {
        return orderUpdateAt;
    }

    public void setOrderUpdateAt(Date orderUpdateAt) {
        this.orderUpdateAt = orderUpdateAt;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public CompanyShip getCompanyShip() {
        return companyShip;
    }

    public void setCompanyShip(CompanyShip companyShip) {
        this.companyShip = companyShip;
    }

    public String getFullName() {
        return firstName + " " + lastName;
    }

    public String getTotalFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(totalMoney);
    }

    public String getCreateTime() {
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        return f.format(orderCreateAt);
    }
    
    public double getTotalHaveVAT() {
        return totalMoney +  getVAT();
    }
    
    public String getTotalHaveVATFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(getTotalHaveVAT());
    }
    
    public double getVAT(){
        return (totalMoney * 0.08);
    }
    
    public String getVATFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(getVAT());
    }
    
    public String getDateFormat(){
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        return f.format(orderCreateAt);
    }
    

}
