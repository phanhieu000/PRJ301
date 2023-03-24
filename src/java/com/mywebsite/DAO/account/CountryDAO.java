/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.DAO.account;

import com.mywebsite.DAO.dao.DBContext;
import com.mywebsite.DAO.interfaces.ICountryDAO;
import com.mywebsite.model.Country;
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
public class CountryDAO extends DBContext implements ICountryDAO {

    @Override
    public List<Country> getAll() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {

            String sql = "SELECT [countryID]\n"
                    + "      ,[countryName]\n"
                    + "      ,[location]\n"
                    + "      ,[countryCreateAt]\n"
                    + "      ,[countryUpdateAt]\n"
                    + "  FROM [website].[dbo].[Countries]";

            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            List<Country> list = new ArrayList<>();
            while (rs.next()) {
                Country c = new Country(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (st != null) {
                try {
                    st.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

}
