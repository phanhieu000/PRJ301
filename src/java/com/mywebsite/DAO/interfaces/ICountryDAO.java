/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.DAO.interfaces;

import com.mywebsite.model.Country;
import java.util.List;

/**
 *
 * @author phanh
 */
public interface ICountryDAO {
    public List<Country> getAll();
}