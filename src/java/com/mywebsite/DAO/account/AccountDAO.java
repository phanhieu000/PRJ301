/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.DAO.account;

import com.mywebsite.DAO.dao.DBContext;
import com.mywebsite.DAO.interfaces.IAccountDAO;
import com.mywebsite.model.Account;
import com.mywebsite.model.Country;
import com.mywebsite.model.Information;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

public class AccountDAO extends DBContext implements IAccountDAO {

    @Override
    public List<Account> getAll() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT a.[accountID]\n"
                    + "                         ,a.[userName]\n"
                    + "                         ,a.[password]\n"
                    + "                         ,a.[Amount]\n"
                    + "                         ,a.[email]\n"
                    + "                         ,a.[registeredAt]\n"
                    + "                         ,a.[lastLogin]\n"
                    + "                         ,i.[firstName]\n"
                    + "                         ,i.[lastName]\n"
                    + "                         ,i.[avatar]\n"
                    + "                         ,i.[address]\n"
                    + "                         ,i.[countryID]\n"
                    + "                         ,ct.[countryName] \n"
                    + "                         ,ct.[location]\n"
                    + "                         ,i.[birthday]\n"
                    + "                         ,i.[phone]\n"
                    + "                         ,i.[gender]\n"
                    + "                         ,i.[status]\n"
                    + "         FROM [dbo].[Accounts] a inner join [dbo].Informations i\n"
                    + "         ON a.accountID = i.accountID  inner join [dbo].Countries ct\n"
                    + "		ON i.countryID = ct.countryID\n"
                    + "         WHERE a.accountID NOT IN (\n"
                    + "                                     (SELECT a.[accountID]\n"
                    + "                                         FROM [dbo].[Accounts] a inner join [dbo].Informations i\n"
                    + "                                         ON a.accountID = i.accountID inner join [dbo].Countries ct\n"
                    + "                                         ON i.countryID = ct.countryID inner join [dbo].ADMIN_Action aa\n"
                    + "                                         ON a.accountID = aa.accountID inner join [dbo].Actions ac\n"
                    + "                                         ON aa.adminID = ac.adminID) )";

            st = connection.prepareStatement(sql);

            rs = st.executeQuery();

            List<Account> list = new ArrayList<>();
            while (rs.next()) {
                Country country = new Country(rs.getInt("countryID"), rs.getString("countryName"), rs.getString("location"));

                Information information = new Information(rs.getInt("accountID"), rs.getString("firstName"), rs.getString("lastName"),
                        rs.getString("avatar"), rs.getString("address"),
                        rs.getDate("birthday"), rs.getString("phone"), rs.getInt("gender"), rs.getString("status"), country);

                Account a = new Account(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getDate("registeredAt"), rs.getDate("lastLogin"), information);

                list.add(a);
            }
            return list;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Account checkLogin(String userName, String password) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT a.[accountID]\n"
                    + "                         ,a.[userName]\n"
                    + "                         ,a.[password]\n"
                    + "                         ,a.[Amount]\n"
                    + "                         ,a.[email]\n"
                    + "                         ,a.[registeredAt]\n"
                    + "                         ,a.[lastLogin]\n"
                    + "                         ,i.[firstName]\n"
                    + "                         ,i.[lastName]\n"
                    + "                         ,i.[avatar]\n"
                    + "                         ,i.[address]\n"
                    + "                         ,i.[countryID]\n"
                    + "                         ,ct.[countryName] \n"
                    + "                         ,ct.[location]\n"
                    + "                         ,i.[birthday]\n"
                    + "                         ,i.[phone]\n"
                    + "                         ,i.[gender]\n"
                    + "                         ,i.[status]\n"
                    + "         FROM [dbo].[Accounts] a inner join [dbo].Informations i\n"
                    + "         ON a.accountID = i.accountID  inner join [dbo].Countries ct\n"
                    + "		ON i.countryID = ct.countryID\n"
                    + "         WHERE a.userName = ? AND a.password = ?";

            st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            rs = st.executeQuery();

            if (rs.next()) {
                Country country = new Country(rs.getInt("countryID"), rs.getString("countryName"), rs.getString("location"));

                Information information = new Information(rs.getInt("accountID"), rs.getString("firstName"), rs.getString("lastName"),
                        rs.getString("avatar"), rs.getString("address"),
                        rs.getDate("birthday"), rs.getString("phone"), rs.getInt("gender"), rs.getString("status"), country);

                Account a = new Account(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getDate("registeredAt"), rs.getDate("lastLogin"), information);

                return a;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public int getTotalUser() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {

            String sql = "SELECT COUNT(a.accountID) as 'TotalUsers'\n"
                    + "FROM [website].[dbo].[Accounts] a\n"
                    + "WHERE a.accountID NOT IN (\n"
                    + "                           (SELECT a.[accountID]\n"
                    + "                            FROM [dbo].[Accounts] a inner join [dbo].Informations i\n"
                    + "                            ON a.accountID = i.accountID inner join [dbo].Countries ct\n"
                    + "                            ON i.countryID = ct.countryID inner join [dbo].ADMIN_Action aa\n"
                    + "                            ON a.accountID = aa.accountID inner join [dbo].Actions ac\n"
                    + "                            ON aa.adminID = ac.adminID) )";

            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt("TotalUsers");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    @Override
    public Account getAccountByID(int accountID) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT a.[accountID]\n"
                    + "                         ,a.[userName]\n"
                    + "                         ,a.[password]\n"
                    + "                         ,a.[Amount]\n"
                    + "                         ,a.[email]\n"
                    + "                         ,a.[registeredAt]\n"
                    + "                         ,a.[lastLogin]\n"
                    + "                         ,i.[firstName]\n"
                    + "                         ,i.[lastName]\n"
                    + "                         ,i.[avatar]\n"
                    + "                         ,i.[address]\n"
                    + "                         ,i.[countryID]\n"
                    + "                         ,ct.[countryName] \n"
                    + "                         ,ct.[location]\n"
                    + "                         ,i.[birthday]\n"
                    + "                         ,i.[phone]\n"
                    + "                         ,i.[gender]\n"
                    + "                         ,i.[status]\n"
                    + "         FROM [dbo].[Accounts] a inner join [dbo].Informations i\n"
                    + "         ON a.accountID = i.accountID  inner join [dbo].Countries ct\n"
                    + "		ON i.countryID = ct.countryID\n"
                    + "         WHERE a.accountID = ?";

            st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            rs = st.executeQuery();

            if (rs.next()) {
                Country country = new Country(rs.getInt("countryID"), rs.getString("countryName"), rs.getString("location"));

                Information information = new Information(rs.getInt("accountID"), rs.getString("firstName"), rs.getString("lastName"),
                        rs.getString("avatar"), rs.getString("address"),
                        rs.getDate("birthday"), rs.getString("phone"), rs.getInt("gender"), rs.getString("status"), country);

                Account a = new Account(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getDate("registeredAt"), rs.getDate("lastLogin"), information);

                return a;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getLastAccountID() {
        try {

            String sql = "SELECT accountID FROM [dbo].[Accounts] ORDER BY accountID DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void insert(Account a) {
        try {

            String sql = "INSERT INTO [dbo].[Accounts]\n"
                    + "           ([userName]\n"
                    + "           ,[password]\n"
                    + "           ,[Amount]\n"
                    + "           ,[email]\n"
                    + "           ,[registeredAt]\n"
                    + "           ,[lastLogin])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUserName());
            st.setString(2, a.getPassword());
            st.setDouble(3, 0.0);
            st.setString(4, a.getEmail());
            st.setDate(5, a.getRegisterAt());
            st.setDate(6, a.getLastLogin());
            st.executeUpdate();

            String sql2 = "SELECT accountID FROM [dbo].[Accounts] ORDER BY accountID DESC";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            ResultSet rs = st2.executeQuery();
            if (rs.next()) {
                String sql1 = "INSERT INTO [dbo].[Informations]\n"
                        + "           ([accountID]\n"
                        + "           ,[countryID]\n"
                        + "           ,[firstName]\n"
                        + "           ,[lastName]\n"
                        + "           ,[avatar]\n"
                        + "           ,[address]\n"
                        + "           ,[birthday]\n"
                        + "           ,[phone]\n"
                        + "           ,[gender]\n"
                        + "           ,[status])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?)";
                PreparedStatement st1 = connection.prepareStatement(sql1);
                st1.setInt(1, rs.getInt(1));
                st1.setInt(2, a.getInformation().getCountry().getCountryID());
                st1.setString(3, a.getInformation().getFirstName());
                st1.setString(4, a.getInformation().getLastName());
                st1.setString(5, a.getInformation().getAvatar());
                st1.setString(6, a.getInformation().getAddress());
                st1.setDate(7, a.getInformation().getBirthDay());
                st1.setString(8, a.getInformation().getPhone());
                st1.setInt(9, a.getInformation().getGender());
                st1.setString(10, a.getInformation().getStatus());
                st1.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public List<Account> getAllForRegister() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT a.[accountID]\n"
                    + "                         ,a.[userName]\n"
                    + "                         ,a.[password]\n"
                    + "                         ,a.[Amount]\n"
                    + "                         ,a.[email]\n"
                    + "                         ,a.[registeredAt]\n"
                    + "                         ,a.[lastLogin]\n"
                    + "                         ,i.[firstName]\n"
                    + "                         ,i.[lastName]\n"
                    + "                         ,i.[avatar]\n"
                    + "                         ,i.[address]\n"
                    + "                         ,i.[countryID]\n"
                    + "                         ,ct.[countryName] \n"
                    + "                         ,ct.[location]\n"
                    + "                         ,i.[birthday]\n"
                    + "                         ,i.[phone]\n"
                    + "                         ,i.[gender]\n"
                    + "                         ,i.[status]\n"
                    + "         FROM [dbo].[Accounts] a inner join [dbo].Informations i\n"
                    + "         ON a.accountID = i.accountID  inner join [dbo].Countries ct\n"
                    + "		ON i.countryID = ct.countryID\n";

            st = connection.prepareStatement(sql);

            rs = st.executeQuery();

            List<Account> list = new ArrayList<>();
            while (rs.next()) {
                Country country = new Country(rs.getInt("countryID"), rs.getString("countryName"), rs.getString("location"));

                Information information = new Information(rs.getInt("accountID"), rs.getString("firstName"), rs.getString("lastName"),
                        rs.getString("avatar"), rs.getString("address"),
                        rs.getDate("birthday"), rs.getString("phone"), rs.getInt("gender"), rs.getString("status"), country);

                Account a = new Account(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getDate("registeredAt"), rs.getDate("lastLogin"), information);

                list.add(a);
            }
            return list;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public HashMap<Account, Double> getTop5CustomerGratitude() {
        try {

            String sql = "SELECT TOP(5) [accountID], SUM(totalMoney) as 'totalMoney'\n"
                    + "     FROM [website].[dbo].[Orders]\n"
                    + "     GROUP BY [accountID], orderCreatedAt, [status]\n"
                    + "     HAVING MONTH(orderCreatedAt) = MONTH(GETDATE()) and [status] = 1\n"
                    + "     ORDER BY SUM(totalMoney) DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            HashMap<Account, Double> map = new HashMap<>();
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = getAccountByID(rs.getInt(1));
                double money = rs.getDouble(2);
                map.put(a, money);
            }
            return map;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public String getFormatDouble(double n) {
        Locale vn = new Locale("vi", "VN");
        NumberFormat f = NumberFormat.getInstance(vn);
        return f.format(n);
    }

}
