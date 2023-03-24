/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.DAO.interfaces;

import com.mywebsite.model.Account;
import com.mywebsite.model.cart.Cart;

/**
 *
 * @author phanh
 */
public interface IOrderCartDAO {
    public void addOrder(Account account, Cart cart, int paymentMethodID, int companyShipID, String note);
}
