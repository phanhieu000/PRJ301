
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.DAO.interfaces;

import com.mywebsite.model.order.Order;
import com.mywebsite.model.order.OrderLine;

import java.util.List;

/**
 *
 * @author phanh
 */
public interface IOrderDAO{
    public List<Order> getAll();
    
    public List<OrderLine> getOrderLineByOrderID(int orderID);
    
    public List<OrderLine> getOrderLineByAccountID(int accountID);
    
    public Order getOrderByOrderID(int orderID);
    
    public void upadte(int orderID, int status);
    
    public void delete(int orderID);
    
    public List<OrderLine> getListByPage(List<OrderLine> list, int start, int end);
}
