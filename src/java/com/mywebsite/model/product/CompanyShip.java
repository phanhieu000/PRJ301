/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.model.product;

/**
 *
 * @author phanh
 */
public class CompanyShip {
    private int companyID;
    private String companyName;
    private double feeShipping;

    public CompanyShip() {
    }

    public CompanyShip(int companyID, String companyName, double feeShipping) {
        this.companyID = companyID;
        this.companyName = companyName;
        this.feeShipping = feeShipping;
    }

    public double getFeeShipping() {
        return feeShipping;
    }

    public void setFeeShipping(double feeShipping) {
        this.feeShipping = feeShipping;
    }

    public int getCompanyID() {
        return companyID;
    }

    public void setCompanyID(int companyID) {
        this.companyID = companyID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    
    
}
