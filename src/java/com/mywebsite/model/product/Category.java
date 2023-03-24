/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.model.product;

import java.sql.Date;

/**
 *
 * @author phanh
 */
public class Category {
    private int categoryID;
    private String categoryName;
    private int categoryParentID;
    private String categoryMetaTitle;
    private Date categoryCreateAt;
    private Date categoryUpdateAt;

    public Category() {
    }

    public Category(int categoryID, String categoryName, int categoryParentID, String categoryMetaTitle, Date categoryCreateAt, Date categoryUpdateAt) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categoryParentID = categoryParentID;
        this.categoryMetaTitle = categoryMetaTitle;
        this.categoryCreateAt = categoryCreateAt;
        this.categoryUpdateAt = categoryUpdateAt;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getCategoryParentID() {
        return categoryParentID;
    }

    public void setCategoryParentID(int categoryParentID) {
        this.categoryParentID = categoryParentID;
    }

    public String getCategoryMetaTitle() {
        return categoryMetaTitle;
    }

    public void setCategoryMetaTitle(String categoryMetaTitle) {
        this.categoryMetaTitle = categoryMetaTitle;
    }

    public Date getCategoryCreateAt() {
        return categoryCreateAt;
    }

    public void setCategoryCreateAt(Date categoryCreateAt) {
        this.categoryCreateAt = categoryCreateAt;
    }

    public Date getCategoryUpdateAt() {
        return categoryUpdateAt;
    }

    public void setCategoryUpdateAt(Date categoryUpdateAt) {
        this.categoryUpdateAt = categoryUpdateAt;
    }
    
    
}
