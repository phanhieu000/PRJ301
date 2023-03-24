/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mywebsite.DAO.product;

import com.mywebsite.DAO.account.AccountAdminDAO;
import com.mywebsite.DAO.dao.DBContext;
import com.mywebsite.DAO.interfaces.ICategoryDAO;
import com.mywebsite.model.product.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DBContext implements ICategoryDAO {

    @Override
    public List<Category> getAll() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT [categoryID]\n"
                    + "      ,[categoryName]\n"
                    + "      ,[categoryParentID]\n"
                    + "      ,[categoryMetaTitle]\n"
                    + "      ,[categoryCreateAt]\n"
                    + "      ,[categoryUpDATEAt]\n"
                    + "  FROM [website].[dbo].[Categories]\n"
                    + "  WHERE [categoryParentID] IS NULL";

            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            List<Category> list = new ArrayList<>();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDate(5), rs.getDate(6));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Category> getSubcategoryApple(String categoryName) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT c2.[categoryID]\n"
                    + "         ,c2.[categoryName]\n"
                    + "         ,c2.[categoryParentID]\n"
                    + "         ,c2.[categoryMetaTitle]\n"
                    + "         ,c2.[categoryCreateAt]\n"
                    + "         ,c2.[categoryUpDATEAt]\n"
                    + "  FROM [website].[dbo].[Categories] c1 inner join [website].[dbo].[Categories] c2\n"
                    + "  ON c1.categoryID = c2.categoryParentID\n"
                    + "  WHERE  c1.categoryName = ?";

            st = connection.prepareStatement(sql);
            st.setString(1, categoryName);
            rs = st.executeQuery();

            List<Category> list = new ArrayList<>();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDate(5), rs.getDate(6));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Category getCategoryByID(int categoryID) {
        try {

            String sql = "SELECT [categoryID]\n"
                    + "      ,[categoryName]\n"
                    + "      ,[categoryParentID]\n"
                    + "      ,[categoryMetaTitle]\n"
                    + "      ,[categoryCreateAt]\n"
                    + "      ,[categoryUpDATEAt]\n"
                    + "  FROM [website].[dbo].[Categories]\n"
                    + "  WHERE [categoryID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDate(5), rs.getDate(6));
                return c;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Category> getAllAndSubcategory() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT [categoryID]\n"
                    + "      ,[categoryName]\n"
                    + "      ,[categoryParentID]\n"
                    + "      ,[categoryMetaTitle]\n"
                    + "      ,[categoryCreateAt]\n"
                    + "      ,[categoryUpDATEAt]\n"
                    + "  FROM [website].[dbo].[Categories]";

            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            List<Category> list = new ArrayList<>();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDate(5), rs.getDate(6));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void insert(Category c) {
        try {
            String sql = "INSERT INTO [dbo].[Categories]\n"
                    + "           ([categoryName]\n"
                    + "           ,[categoryMetaTitle]\n"
                    + "           ,[categoryCreateAt]\n"
                    + "           ,[categoryUpdateAt])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCategoryName());
            st.setString(2, c.getCategoryMetaTitle());
            st.setDate(3, c.getCategoryCreateAt());
            st.setDate(4, c.getCategoryUpdateAt());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void insertSubCategory(Category c) {
        try {
            String sql = "INSERT INTO [dbo].[Categories]\n"
                    + "           ([categoryName]\n"
                    + "           ,[categoryParentID]\n"
                    + "           ,[categoryMetaTitle]\n"
                    + "           ,[categoryCreateAt]\n"
                    + "           ,[categoryUpdateAt])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCategoryName());
            st.setInt(2, c.getCategoryParentID());
            st.setString(3, c.getCategoryMetaTitle());
            st.setDate(4, c.getCategoryCreateAt());
            st.setDate(5, c.getCategoryUpdateAt());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void delete(int categoryID) {
        try {
            String sql = "DELETE FROM [dbo].[Category_Producer]\n"
                    + "      WHERE categoryID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            st.executeUpdate();

            String sql1 = "DELETE FROM [dbo].[Products]\n"
                    + "      WHERE categoryID = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, categoryID);
            st1.executeUpdate();

            String sql2 = "DELETE FROM [dbo].[Categories]\n"
                    + "       WHERE categoryID = ?";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, categoryID);
            st2.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
