package com.mywebsite.model.admin;

import com.mywebsite.model.Account;
import com.mywebsite.model.Information;
import java.sql.Date;

public class AccountAdmin extends Account{

    private Action action;

    public AccountAdmin() {
    }

    public AccountAdmin(int accountID, String userName, String password, double amount, String email, Date registerAt, Date lastLogin, Information information, Action action) {
        super(accountID, userName, password, amount, email, registerAt, lastLogin, information);
        this.action = action;
    }

    public Action getAction() {
        return action;
    }

    public void setAction(Action action) {
        this.action = action;
    }
    
}
