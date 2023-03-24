/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.DAO.interfaces;

import com.mywebsite.model.Account;
import com.mywebsite.model.product.ProductReview;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author phanh
 */
public interface IProductReviewDAO {
    public List<ProductReview> getAll();
    
    public List<ProductReview> getReviewByProductID(int productID);
    
    public void insert(Account account,int productID, int star, String content);
    
    public HashMap<Integer, Integer> getDataForChart(int star, int year); 
    
}
