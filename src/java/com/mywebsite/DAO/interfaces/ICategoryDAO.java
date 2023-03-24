/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.DAO.interfaces;

import com.mywebsite.model.product.Category;
import java.util.List;

/**
 *
 * @author phanh
 */
public interface ICategoryDAO {

    public List<Category> getAll();

    public List<Category> getSubcategoryApple(String categoryName);

    public Category getCategoryByID(int categoryID);

    public List<Category> getAllAndSubcategory();

    public void insert(Category c);

    public void insertSubCategory(Category c);
    
    public void delete(int categoryID);

}
