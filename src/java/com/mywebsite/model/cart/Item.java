/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.model.cart;

import com.mywebsite.model.product.Product;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author phanh
 */
public class Item {
    private Product product;
    private double unitPrice;
    private double discount;
    private int quantity;
    private int color;

    public Item() {
    }

    public Item(Product product, double unitPrice, double discount, int quantity, int color) {
        this.product = product;
        this.unitPrice = unitPrice;
        this.discount = discount;
        this.quantity = quantity;
        this.color = color;
    }

    public int getColor() {
        return color;
    }

    public void setColor(int color) {
        this.color = color;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }
    
    public double getTotalMoney(){
        return ( unitPrice  * quantity )  ;
    }
    
    public String getUnitPriceFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(unitPrice);
    }
    
    public String getDiscountFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(discount);
    }
    
    public String getTotalMoneyFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(getTotalMoney());
    }
    
    public double getSubtotal(){
        return unitPrice * quantity;
    }

    public double getTax(){
        return 0.01;
    }
    
    public String getTaxPercent() {
        DecimalFormat f = new DecimalFormat("###.#%");
        return f.format(getTax());
        
    }
    
}
