/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.DAO.cart;

import com.mywebsite.DAO.account.AccountAdminDAO;
import com.mywebsite.DAO.dao.Common;
import com.mywebsite.DAO.dao.DBContext;
import com.mywebsite.model.Account;
import com.mywebsite.model.cart.Cart;
import com.mywebsite.model.cart.Item;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.mywebsite.DAO.interfaces.IOrderCartDAO;

/**
 *
 * @author phanh
 */
public class OrderCartDAO extends DBContext implements IOrderCartDAO {

    @Override
    public void addOrder(Account account, Cart cart, int paymentMethodID, int companyShipID, String note) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String insertOrder = "INSERT INTO [dbo].[Orders]\n"
                    + "           ([paymentMethodID]\n"
                    + "           ,[companyShipID]\n"
                    + "           ,[status]\n"
                    + "           ,[totalMoney]\n"
                    + "           ,[orderDiscount]\n"
                    + "           ,[firstName]\n"
                    + "           ,[lastName]\n"
                    + "           ,[country]\n"
                    + "           ,[address]\n"
                    + "           ,[phone]\n"
                    + "           ,[orderNote]\n"
                    + "           ,[orderCreatedAt]\n"
                    + "           ,[orderUpdateAt]\n"
                    + "           ,[accountID])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ?, ?)";
            st = connection.prepareStatement(insertOrder);
            st.setInt(1, paymentMethodID);
            st.setInt(2, companyShipID);
            st.setInt(3, paymentMethodID == 1 ? 1 : 0);
            st.setDouble(4, cart.getTotalMoney());
            st.setDouble(5, 0);
            st.setString(6, account.getInformation().getFirstName());
            st.setString(7, account.getInformation().getLastName());
            st.setString(8, account.getInformation().getCountry().getCountryName());
            st.setString(9, account.getInformation().getAddress());
            st.setString(10, account.getInformation().getPhone());
            st.setString(11, note);
            st.setDate(12, Common.getCurrentDate());
            st.setDate(13, Common.getCurrentDate());
            st.setInt(14, account.getAccountID());

            st.executeUpdate();

            String selectNewOrder = "SELECT TOP (1) [orderID] FROM [website].[dbo].[Orders] ORDER BY [orderID] DESC";

            PreparedStatement st1 = connection.prepareStatement(selectNewOrder);
            rs = st1.executeQuery();

            if (rs.next()) {
                int orderID = rs.getInt(1);
                for (Item item : cart.getItems()) {
                    String insertOrderLine = "INSERT INTO [dbo].[OrderLines]\n"
                            + "           ([orderID]\n"
                            + "           ,[productID]\n"
                            + "           ,[unitPrice]\n"
                            + "           ,[discount]\n"
                            + "           ,[quantity]"
                            + "           ,[color])\n"
                            + "     VALUES\n"
                            + "           (?, ?, ?, ?, ?, ?)";
                    PreparedStatement st2 = connection.prepareStatement(insertOrderLine);
                    st2.setInt(1, orderID);
                    st2.setInt(2, item.getProduct().getProductID());
                    st2.setDouble(3, item.getUnitPrice());
                    st2.setDouble(4, item.getDiscount());
                    st2.setInt(5, item.getQuantity());
                    st2.setInt(6, item.getColor());
                    st2.executeUpdate();
                }
            }

            if (paymentMethodID == 1) {
                String updateQuantity = "UPDATE [dbo].[Products] SET [quantity] = quantity - ? , countBuy = countBuy + 1 WHERE productID = ?";

                for (Item item : cart.getItems()) {
                    PreparedStatement st3 = connection.prepareStatement(updateQuantity);
                    st3.setInt(1, item.getQuantity());
                    st3.setInt(2, item.getProduct().getProductID());
                    st3.executeUpdate();
                }

                String updateAmount = "UPDATE [dbo].[Accounts]\n"
                        + "   SET Amount = Amount - ?\n"
                        + " WHERE accountID = ?";
                PreparedStatement st4 = connection.prepareStatement(updateAmount);
                st4.setDouble(1, cart.getTotalMoney());
                st4.setInt(2, account.getAccountID());
                st4.executeUpdate();
            }

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
    }

}
