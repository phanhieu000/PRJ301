package com.mywebsite.model.order;

import com.mywebsite.model.product.Product;
import java.text.NumberFormat;
import java.util.Locale;

public class OrderLine {

    private Order order;
    private double unitPrice;
    private double discount;
    private int quantity;
    private String color;
    private Product product;

    public OrderLine() {
    }

    public OrderLine(Order order, double unitPrice, double discount, int quantity, String color, Product product) {
        this.order = order;
        this.unitPrice = unitPrice;
        this.discount = discount;
        this.quantity = quantity;
        this.color = color;
        this.product = product;
    }


    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getSubTotal() {
        return unitPrice * quantity;
    }
    
    public String getSubTotalFormat(){
        Locale vn = new Locale("vi", "VN");
        NumberFormat f = NumberFormat.getInstance(vn);
        return f.format(getSubTotal());
    }

}
