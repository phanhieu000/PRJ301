package com.mywebsite.DAO.interfaces;

import com.mywebsite.model.product.Product;
import java.util.HashMap;
import java.util.List;

public interface IProductDAO {

    public List<Product> getAll();

    public List<Product> getProductByCategoryID(int categoryID);

    public Product getProductByID(int productID);

    public int getTotalProduct();

    public List<Product> getProductSaleDate();

    public List<Product> getListByPage(List<Product> list, int start, int end);
    
    public List<Product> get15ProductSameCategoryByProductID(int productID);
    
    public List<Product> getProductByProducerCheckBoxAndCategoryID(int [] producerIDs, int [] categoryID);
    
    public List<Product> getProductBySearch(int categoryID, String search);
    
    public List<Product> getProductFeatured();
    
    public List<Product> getProductByPrice(double from, double to);
    
    public double getRevenueInMonth();
    
    public String getRevenueInMonthFormat();
    
    public void insert(Product product);
    
    public int getLastProductID();
    
    public void delete(int productID);
    
    public void update(Product p);
    
    public HashMap<Integer, Double> getTotalRevenueForChart(int status);
    
    public int getCountSellerByCategoryID(int categoryID);
    
    public int getTotalProductSeller();
    
    public HashMap<String, Integer> getQuantityProductForChart();
    
    public HashMap<Integer, Integer> getSellerProductForChart(int categoryID, int year);
    
    public List<Product> getTop5ProductSellerByProducer(int producerID, int categoryID);
    

}
