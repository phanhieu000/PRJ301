package com.mywebsite.model.product;

public class ProductColor {
    private int productID;
    private String colorFirst;
    private String colorSecond;
    private String colorThree;
    private String colorFour;
    private String colorFive;

    public ProductColor() {
    }

    public ProductColor(int productID, String colorFirst, String colorSecond, String colorThree, String colorFour, String colorFive) {
        this.productID = productID;
        this.colorFirst = colorFirst;
        this.colorSecond = colorSecond;
        this.colorThree = colorThree;
        this.colorFour = colorFour;
        this.colorFive = colorFive;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getColorFirst() {
        return colorFirst;
    }

    public void setColorFirst(String colorFirst) {
        this.colorFirst = colorFirst;
    }

    public String getColorSecond() {
        return colorSecond;
    }

    public void setColorSecond(String colorSecond) {
        this.colorSecond = colorSecond;
    }

    public String getColorThree() {
        return colorThree;
    }

    public void setColorThree(String colorThree) {
        this.colorThree = colorThree;
    }

    public String getColorFour() {
        return colorFour;
    }

    public void setColorFour(String colorFour) {
        this.colorFour = colorFour;
    }

    public String getColorFive() {
        return colorFive;
    }

    public void setColorFive(String colorFive) {
        this.colorFive = colorFive;
    }


    
}
