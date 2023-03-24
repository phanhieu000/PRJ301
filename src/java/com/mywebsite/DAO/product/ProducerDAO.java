package com.mywebsite.DAO.product;

import com.mywebsite.DAO.dao.DBContext;
import com.mywebsite.DAO.interfaces.IProducerDAO;
import com.mywebsite.model.product.Producer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProducerDAO extends DBContext implements IProducerDAO {

    @Override
    public List<Producer> getAll() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT TOP (1000) [producerID]\n"
                    + "      ,[producerName]\n"
                    + "      ,[producerMeta]\n"
                    + "      ,[Country]\n"
                    + "  FROM [website].[dbo].[Producers]";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            List<Producer> listP = new ArrayList<>();

            while (rs.next()) {
                Producer p = new Producer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                listP.add(p);
            }
            return listP;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Producer> getProducerByACategoryID(int categoryID) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT p.[producerID]\n"
                    + "      ,[producerName]\n"
                    + "      ,[producerMeta]\n"
                    + "      ,[Country]\n"
                    + "  FROM [website].[dbo].[Producers] p inner join [dbo].Category_Producer cp\n"
                    + "  on p.producerID = cp.producerID inner join [dbo].Categories c\n"
                    + "  on cp.categoryID = c.categoryID\n"
                    + "  WHERE 1=1 ";

            if (categoryID != 0) {
                sql += " AND cp.categoryID = " + categoryID;
            }
            st = connection.prepareStatement(sql);

            rs = st.executeQuery();

            List<Producer> listP = new ArrayList<>();

            while (rs.next()) {
                Producer p = new Producer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                listP.add(p);
            }
            return listP;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Producer> getProducerByCategoryID(int[] categoryID) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT p.[producerID]\n"
                    + "      ,[producerName]\n"
                    + "      ,[producerMeta]\n"
                    + "      ,[Country]\n"
                    + "  FROM [website].[dbo].[Producers] p inner join [dbo].Category_Producer cp\n"
                    + "  on p.producerID = cp.producerID inner join [dbo].Categories c\n"
                    + "  on cp.categoryID = c.categoryID\n"
                    + "  WHERE 1=1 ";

            if (categoryID != null) {
                sql += " AND cp.categoryID IN ( ";
                for (int i = 0; i < categoryID.length; i++) {
                    if (i == categoryID.length - 1) {
                        sql += categoryID[i] + ") ";
                    } else {
                        sql += categoryID[i] + ",";
                    }
                }
            }
            st = connection.prepareStatement(sql);

            rs = st.executeQuery();

            List<Producer> listP = new ArrayList<>();

            while (rs.next()) {
                Producer p = new Producer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                listP.add(p);
            }
            return listP;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void insert(Producer p, int categoryID) {
        try {

            String sql = "INSERT INTO [dbo].[Producers]\n"
                    + "           ([producerName]\n"
                    + "           ,[producerMeta]\n"
                    + "           ,[Country])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getProducerName());
            st.setString(2, p.getProducerMeta());
            st.setString(3, p.getCountry());
            st.executeUpdate();

            String sql1 = "SELECT TOP(1) producerID FROM [dbo].[Producers] ORDER BY producerID DESC";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                String sql2 = "INSERT INTO [dbo].[Category_Producer]\n"
                        + "           ([producerID]\n"
                        + "           ,[categoryID])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?)";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setInt(1, rs.getInt(1));
                st2.setInt(2, categoryID);
                st2.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void delete(int producerID) {
        try {

            String sql = "DELETE FROM [dbo].[Category_Producer]\n"
                    + "      WHERE producerID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, producerID);
            st.executeUpdate();

            String sql1 = "DELETE FROM [dbo].[Producers]\n"
                    + "      WHERE producerID = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, producerID);
            st1.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
