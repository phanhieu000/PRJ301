package com.mywebsite.DAO.product;

import com.mywebsite.DAO.dao.Common;
import com.mywebsite.DAO.dao.DBContext;
import com.mywebsite.DAO.interfaces.IProductReviewDAO;
import com.mywebsite.model.Account;
import com.mywebsite.model.Country;
import com.mywebsite.model.Information;
import com.mywebsite.model.product.ProductReview;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ProductReviewDAO extends DBContext implements IProductReviewDAO {

    @Override
    public List<ProductReview> getAll() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {

            String sql = "SELECT pr.[reviewID]\n"
                    + "      ,pr.[productID]\n"
                    + "      ,pr.[accountID]\n"
                    + "      ,pr.[content]\n"
                    + "      ,pr.[rating]\n"
                    + "      ,pr.[reviewCreateAt]\n"
                    + "      ,pr.[reviewUpDATEAt]\n"
                    + "      ,a.[accountID]\n"
                    + "      ,a.[userName]\n"
                    + "      ,a.[password]\n"
                    + "      ,a.[Amount]\n"
                    + "      ,a.[email]\n"
                    + "      ,a.[registeredAt]\n"
                    + "      ,a.[lastLogin]\n"
                    + "      ,i.[firstName]\n"
                    + "      ,i.[lastName]\n"
                    + "      ,i.[avatar]\n"
                    + "      ,i.[address]\n"
                    + "      ,i.[countryID]\n"
                    + "      ,ct.[countryName] \n"
                    + "      ,ct.[location]\n"
                    + "      ,i.[birthday]\n"
                    + "      ,i.[phone]\n"
                    + "      ,i.[gender]\n"
                    + "      ,i.[status]\n"
                    + "  FROM [website].[dbo].[ProductReview] pr inner join [website].[dbo].Accounts a\n"
                    + "  ON pr.accountID = a.accountID inner join [dbo].Informations i\n"
                    + "  ON a.accountID = i.accountID  inner join [dbo].Countries ct\n"
                    + "  ON i.countryID = ct.countryID";

            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            List<ProductReview> list = new ArrayList<>();
            while (rs.next()) {
                Country country = new Country(rs.getInt("countryID"), rs.getString("countryName"), rs.getString("location"));

                Information information = new Information(rs.getInt("accountID"), rs.getString("firstName"), rs.getString("lastName"),
                        rs.getString("avatar"), rs.getString("address"),
                        rs.getDate("birthday"), rs.getString("phone"), rs.getInt("gender"), rs.getString("status"), country);

                Account account = new Account(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getDate("registeredAt"), rs.getDate("lastLogin"), information);

                ProductReview pr = new ProductReview(rs.getInt("reviewID"), rs.getInt("productID"), rs.getString("content"),
                        rs.getInt("rating"), rs.getDate("reviewCreateAt"), rs.getDate("reviewUpDATEAt"), account);

                list.add(pr);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductReview> getReviewByProductID(int productID) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {

            String sql = "SELECT pr.[reviewID]\n"
                    + "      ,pr.[productID]\n"
                    + "      ,pr.[accountID]\n"
                    + "      ,pr.[content]\n"
                    + "      ,pr.[rating]\n"
                    + "      ,pr.[reviewCreateAt]\n"
                    + "      ,pr.[reviewUpDATEAt]\n"
                    + "      ,a.[accountID]\n"
                    + "      ,a.[userName]\n"
                    + "      ,a.[password]\n"
                    + "      ,a.[Amount]\n"
                    + "      ,a.[email]\n"
                    + "      ,a.[registeredAt]\n"
                    + "      ,a.[lastLogin]\n"
                    + "      ,i.[firstName]\n"
                    + "      ,i.[lastName]\n"
                    + "      ,i.[avatar]\n"
                    + "      ,i.[address]\n"
                    + "      ,i.[countryID]\n"
                    + "      ,ct.[countryName] \n"
                    + "      ,ct.[location]\n"
                    + "      ,i.[birthday]\n"
                    + "      ,i.[phone]\n"
                    + "      ,i.[gender]\n"
                    + "      ,i.[status]\n"
                    + "  FROM [website].[dbo].[ProductReview] pr inner join [website].[dbo].Accounts a\n"
                    + "  ON pr.accountID = a.accountID inner join [dbo].Informations i\n"
                    + "  ON a.accountID = i.accountID  inner join [dbo].Countries ct\n"
                    + "  ON i.countryID = ct.countryID\n"
                    + "  WHERE productID = ?\n"
                    + "  ORDER BY pr.reviewCreateAt DESC";

            st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            rs = st.executeQuery();

            List<ProductReview> list = new ArrayList<>();

            while (rs.next()) {
                Country country = new Country(rs.getInt("countryID"), rs.getString("countryName"), rs.getString("location"));

                Information information = new Information(rs.getInt("accountID"), rs.getString("firstName"), rs.getString("lastName"),
                        rs.getString("avatar"), rs.getString("address"),
                        rs.getDate("birthday"), rs.getString("phone"), rs.getInt("gender"), rs.getString("status"), country);

                Account account = new Account(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getDate("registeredAt"), rs.getDate("lastLogin"), information);

                ProductReview pr = new ProductReview(rs.getInt("reviewID"), rs.getInt("productID"), rs.getString("content"),
                        rs.getInt("rating"), rs.getDate("reviewCreateAt"), rs.getDate("reviewUpDATEAt"), account);

                list.add(pr);

            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void insert(Account account, int productID, int star, String content) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String insertReview = "INSERT INTO [dbo].[ProductReview]\n"
                    + "           ([productID]\n"
                    + "           ,[accountID]\n"
                    + "           ,[content]\n"
                    + "           ,[rating]\n"
                    + "           ,[reviewCreateAt]\n"
                    + "           ,[reviewUpdateAt])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ? ,? ,?)";

            st = connection.prepareStatement(insertReview);
            st.setInt(1, productID);
            st.setInt(2, account.getAccountID());
            st.setString(3, content);
            st.setInt(4, star);
            st.setDate(5, Common.getCurrentDate());
            st.setDate(6, Common.getCurrentDate());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<ProductReview> getListByPage(List<ProductReview> list,
            int start, int end) {
        List<ProductReview> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    @Override
    public HashMap<Integer, Integer> getDataForChart(int star, int year) {
        try {
            HashMap<Integer, Integer> map = new HashMap<>();

            for (int i = 1; i <= 12; i++) {
                String sql = "SELECT COUNT(rating) as 'TotalReview'\n"
                        + "  FROM [website].[dbo].[ProductReview]\n"
                        + "  GROUP BY rating, reviewCreateAt\n"
                        + "  HAVING MONTH(reviewCreateAt) in (?) AND rating = ? AND YEAR(reviewCreateAt) = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setInt(2, star);
                st.setInt(3, year);
                ResultSet rs = st.executeQuery();
                
                
                if (rs.next()) {                    
                    map.put(i, rs.getInt("TotalReview"));
                }else {
                    map.put(i, 0);
                }
            }
            return map;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
