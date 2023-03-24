/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.model.product;

/**
 *
 * @author phanh
 */
public class ProductImage {
    private int productID;
    private String imageFirst;
    private String imageSecond;
    private String imageThree;
    private String imageFour;
    private String imageFive;

    public ProductImage() {
    }

    public ProductImage(int productID, String imageFirst, String imageSecond, String imageThree, String imageFour, String imageFive) {
        this.productID = productID;
        this.imageFirst = imageFirst;
        this.imageSecond = imageSecond;
        this.imageThree = imageThree;
        this.imageFour = imageFour;
        this.imageFive = imageFive;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getImageFirst() {
        return imageFirst;
    }

    public void setImageFirst(String imageFirst) {
        this.imageFirst = imageFirst;
    }

    public String getImageSecond() {
        return imageSecond;
    }

    public void setImageSecond(String imageSecond) {
        this.imageSecond = imageSecond;
    }

    public String getImageThree() {
        return imageThree;
    }

    public void setImageThree(String imageThree) {
        this.imageThree = imageThree;
    }

    public String getImageFour() {
        return imageFour;
    }

    public void setImageFour(String imageFour) {
        this.imageFour = imageFour;
    }

    public String getImageFive() {
        return imageFive;
    }

    public void setImageFive(String imageFive) {
        this.imageFive = imageFive;
    }
    
    
}
