package com.mywebsite.DAO.interfaces;

import com.mywebsite.model.Account;
import java.util.HashMap;
import java.util.List;

public interface IAccountDAO {
    public List<Account> getAll();
    
    public Account checkLogin(String userName, String password);
    
    public int getTotalUser();
    
    public Account getAccountByID(int accountID);
    
    public List<Account> getAllForRegister();
    
    public HashMap<Account, Double> getTop5CustomerGratitude();
    
    public String getFormatDouble(double n);
    
    
}
