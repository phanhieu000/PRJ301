package com.mywebsite.model.admin;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Action {

    private int adminID;
    private String adminRole;
    private boolean insertProduct;
    private boolean updateProduct;
    private boolean deleteProduct;
    private boolean viewProduct;
    private boolean updateAccount;
    private boolean deleteAccount;
    private boolean viewAccount;
    private boolean addAction;
    private Date dateStartAt;
    private Date dateEndAt;

    public Action() {
    }

    public Action(int adminID, String adminRole, boolean insertProduct, boolean updateProduct, boolean deleteProduct, boolean viewProduct, boolean updateAccount, boolean deleteAccount, boolean viewAccount, boolean addAction, Date dateStartAt, Date dateEndAt) {
        this.adminID = adminID;
        this.adminRole = adminRole;
        this.insertProduct = insertProduct;
        this.updateProduct = updateProduct;
        this.deleteProduct = deleteProduct;
        this.viewProduct = viewProduct;
        this.updateAccount = updateAccount;
        this.deleteAccount = deleteAccount;
        this.viewAccount = viewAccount;
        this.addAction = addAction;
        this.dateStartAt = dateStartAt;
        this.dateEndAt = dateEndAt;
    }

    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    public String getAdminRole() {
        return adminRole;
    }

    public void setAdminRole(String adminRole) {
        this.adminRole = adminRole;
    }

    public boolean isInsertProduct() {
        return insertProduct;
    }

    public void setInsertProduct(boolean insertProduct) {
        this.insertProduct = insertProduct;
    }

    public boolean isUpdateProduct() {
        return updateProduct;
    }

    public void setUpdateProduct(boolean updateProduct) {
        this.updateProduct = updateProduct;
    }

    public boolean isDeleteProduct() {
        return deleteProduct;
    }

    public void setDeleteProduct(boolean deleteProduct) {
        this.deleteProduct = deleteProduct;
    }

    public boolean isViewProduct() {
        return viewProduct;
    }

    public void setViewProduct(boolean viewProduct) {
        this.viewProduct = viewProduct;
    }

    public boolean isUpdateAccount() {
        return updateAccount;
    }

    public void setUpdateAccount(boolean updateAccount) {
        this.updateAccount = updateAccount;
    }

    public boolean isDeleteAccount() {
        return deleteAccount;
    }

    public void setDeleteAccount(boolean deleteAccount) {
        this.deleteAccount = deleteAccount;
    }

    public boolean isViewAccount() {
        return viewAccount;
    }

    public void setViewAccount(boolean viewAccount) {
        this.viewAccount = viewAccount;
    }

    public boolean isAddAction() {
        return addAction;
    }

    public void setAddAction(boolean addAction) {
        this.addAction = addAction;
    }

    public Date getDateStartAt() {
        return dateStartAt;
    }

    public void setDateStartAt(Date dateStartAt) {
        this.dateStartAt = dateStartAt;
    }

    public Date getDateEndAt() {
        return dateEndAt;
    }

    public void setDateEndAt(Date dateEndAt) {
        this.dateEndAt = dateEndAt;
    }
    
    public String getStringInsertProduct() {
        return "Insert Products";
    }

    public String getStringUpdateProduct() {
        return "Update Products";
    }

    public String getStringDeleteProduct() {
        return "Delete Products";
    }

    public String getStringViewProduct() {
        return "View Products";
    }

    public String getStringUpdateAccount() {
        return "Update Accounts";
    }

    public String getStringDeleteAccount() {
        return "Delete Accounts";
    }

    public String getStringViewAccount() {
        return "View Accounts";
    } 

    public String getStringAddAction() {
        return "Add Actions";
    }
    
    public String getStartDate(){
        java.util.Date utilDate = new java.util.Date(dateStartAt.getTime());
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        return f.format(utilDate);
    }
    
    public String getEndDate(){
        java.util.Date utilDate = new java.util.Date(dateEndAt.getTime());
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        return f.format(utilDate);
    }

    
    
}
