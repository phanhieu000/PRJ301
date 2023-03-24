/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.model;

import java.sql.Date;

/**
 *
 * @author phanh
 */
public class Country {

    private int countryID;
    private String countryName;
    private String location;

    public Country() {
    }

    public Country(int countryID, String countryName, String location) {
        this.countryID = countryID;
        this.countryName = countryName;
        this.location = location;
        
    }

    public int getCountryID() {
        return countryID;
    }

    public void setCountryID(int countryID) {
        this.countryID = countryID;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    
}
