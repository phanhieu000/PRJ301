/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.DAO.interfaces;

import com.mywebsite.model.product.Producer;
import java.util.List;

/**
 *
 * @author phanh
 */
public interface IProducerDAO {

    public List<Producer> getAll();

    public List<Producer> getProducerByCategoryID(int [] categoryID);
    
    public List<Producer> getProducerByACategoryID(int categoryID);

    public void insert(Producer p, int categoryID);
    
    public void delete(int producerID);
 
}
