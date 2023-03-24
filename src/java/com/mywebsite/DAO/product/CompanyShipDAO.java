/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.DAO.product;

import com.mywebsite.DAO.account.AccountAdminDAO;
import com.mywebsite.DAO.dao.DBContext;
import com.mywebsite.DAO.interfaces.ICompanyShipDAO;
import com.mywebsite.model.product.CompanyShip;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phanh
 */
public class CompanyShipDAO extends DBContext implements ICompanyShipDAO {

    @Override
    public List<CompanyShip> getAll() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT [companyID]\n"
                    + "      ,[companyName]\n"
                    + "      ,[feeShipping]\n"
                    + "  FROM [website].[dbo].[CompanyShip]";

            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            List<CompanyShip> list = new ArrayList<>();
            while (rs.next()) {
                CompanyShip cs = new CompanyShip(rs.getInt(1), rs.getString(2), rs.getDouble(3));
                list.add(cs);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        } 
        return null;
    }

}
