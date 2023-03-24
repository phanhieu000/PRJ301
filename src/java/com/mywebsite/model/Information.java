package com.mywebsite.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.ZoneId;

public class Information {

    private int accountID;
    private String firstName;
    private String lastName;
    private String avatar;
    private String address;
    private Date birthDay;
    private String phone;
    private int gender;
    private String status;
    private Country country;

    public Information() {
    }

    public Information(int accountID, String firstName, String lastName, String avatar, String address, Date birthDay, String phone, int gender, String status, Country country) {
        this.accountID = accountID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.avatar = avatar;
        this.address = address;
        this.birthDay = birthDay;
        this.phone = phone;
        this.gender = gender;
        this.status = status;
        this.country = country;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getFullName() {
        if(firstName == null || firstName.isEmpty() && lastName == null || lastName.isEmpty()){
            return "";
        }
        return firstName + " " + lastName;
    }


    public int getAge() {
        LocalDate birthDate = LocalDateTime.ofInstant(Instant.ofEpochMilli(birthDay.getTime()), ZoneId.systemDefault()).toLocalDate();
        LocalDate currentDate = LocalDate.now();
        return Period.between(birthDate, currentDate).getYears();
    }

    public String getDate() {
        java.util.Date utilDate = new java.util.Date(birthDay.getTime());
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        return f.format(utilDate);
    }

    public String getLocation() {
        if (country.getCountryName() == null || country.getCountryName().equals("")) {
            return address;
        }else if(address == null || address.equals("")){
            return country.getCountryName();
        }else {
            return address + ", " + country.getCountryName();
        }
    }

}
