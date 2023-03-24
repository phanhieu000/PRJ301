/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.model.product;

import com.mywebsite.model.Account;
import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author phanh
 */
public class ProductReview {
    private int reviewID;
    private int productID;
    private String content;
    private int rate;
    private Date reviewCreateAt;
    private Date reivewUpdateAt;
    private Account account;
    public ProductReview() {
    }

    public ProductReview(int reviewID, int productID, String content, int rate, Date reviewCreateAt, Date reivewUpdateAt, Account account) {
        this.reviewID = reviewID;
        this.productID = productID;
        this.content = content;
        this.rate = rate;
        this.reviewCreateAt = reviewCreateAt;
        this.reivewUpdateAt = reivewUpdateAt;
        this.account = account;
    }
    

    public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public Date getReviewCreateAt() {
        return reviewCreateAt;
    }

    public void setReviewCreateAt(Date reviewCreateAt) {
        this.reviewCreateAt = reviewCreateAt;
    }

    public Date getReivewUpdateAt() {
        return reivewUpdateAt;
    }

    public void setReivewUpdateAt(Date reivewUpdateAt) {
        this.reivewUpdateAt = reivewUpdateAt;
    }
    
    public String getReviewTime(){
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        return f.format(reviewCreateAt);
    }
    
}
