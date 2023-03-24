/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.DAO.interfaces;

import com.mywebsite.model.admin.AccountAdmin;
import java.util.List;

/**
 *
 * @author phanh
 */
public interface IAccountAdminDAO {
    public AccountAdmin checkLogin(String userName, String Password);
    
    public List<AccountAdmin> getAll();
    
    public boolean changePassword(AccountAdmin account);
    
    public boolean update(AccountAdmin account);
    
    public void updateAvatar(int accountID, String avatar);
}
