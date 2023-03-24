package com.mywebsite.DAO.product;

import com.mywebsite.DAO.dao.Common;
import com.mywebsite.DAO.dao.DBContext;
import com.mywebsite.DAO.interfaces.IProductDAO;
import com.mywebsite.model.product.Category;
import com.mywebsite.model.product.Producer;
import com.mywebsite.model.product.Product;
import com.mywebsite.model.product.ProductColor;
import com.mywebsite.model.product.ProductImage;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

public class ProductDAO extends DBContext implements IProductDAO {

    @Override
    public List<Product> getAll() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT p.[productID]\n"
                    + "      ,p.[producerID]\n"
                    + "      ,p.[categoryID]\n"
                    + "      ,p.[productName]\n"
                    + "      ,p.[productMetaTitle]\n"
                    + "      ,p.[summary]\n"
                    + "      ,p.[SKU]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[countBuy]\n"
                    + "      ,p.[size]\n"
                    + "      ,p.[screen]\n"
                    + "      ,p.[camera]\n"
                    + "      ,p.[cameraSelfie]\n"
                    + "      ,p.[CPU]\n"
                    + "      ,p.[memory]\n"
                    + "      ,p.[RAM]\n"
                    + "      ,p.[hardDrive]\n"
                    + "      ,p.[card]\n"
                    + "      ,p.[weight]\n"
                    + "      ,p.[warranty]\n"
                    + "      ,p.[productCreateAt]\n"
                    + "      ,p.[productUpdateAt]\n"
                    + "      ,p.[productSaleStartAt]\n"
                    + "      ,p.[productSaleEndAt]\n"
                    + "      ,c.[categoryName]\n"
                    + "      ,c.[categoryParentID]\n"
                    + "      ,c.[categoryMetaTitle]\n"
                    + "      ,c.[categoryCreateAt]\n"
                    + "      ,c.[categoryUpDATEAt]\n"
                    + "      ,pc.[producerName]\n"
                    + "      ,pc.[producerMeta]\n"
                    + "      ,pc.[Country]\n"
                    + "      ,pcolor.[color1]\n"
                    + "      ,pcolor.[color2]\n"
                    + "      ,pcolor.[color3]\n"
                    + "      ,pcolor.[color4]\n"
                    + "      ,pcolor.[color5]\n"
                    + "      ,pimage.[image1]\n"
                    + "      ,pimage.[image2]\n"
                    + "      ,pimage.[image3]\n"
                    + "      ,pimage.[image4]\n"
                    + "      ,pimage.[image5]\n"
                    + "  FROM [website].[dbo].[Products] p inner join [website].[dbo].[Categories] c\n"
                    + "  ON p.categoryID =c.categoryID inner join [website].[dbo].[Producers] pc\n"
                    + "  ON p.producerID = pc.producerID inner join [website].[dbo].[ProductColor] pcolor\n"
                    + "  ON p.productID = pcolor.productID inner join [website].[dbo].[ProductImages] pimage\n"
                    + "  ON p.productID= pimage.productID";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            List<Product> listP = new ArrayList<>();
            while (rs.next()) {
                Category category = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getInt("categoryParentID"),
                        rs.getString("categoryMetaTitle"), rs.getDate("categoryCreateAt"), rs.getDate("categoryUpDATEAt"));

                Producer producer = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("producerMeta"), rs.getString("Country"));

                ProductColor productColor = new ProductColor(rs.getInt("productID"), rs.getString("color1"), rs.getString("color2"),
                        rs.getString("color3"), rs.getString("color4"), rs.getString("color5"));

                ProductImage productImage = new ProductImage(rs.getInt("productID"), rs.getString("image1"), rs.getString("image2"),
                        rs.getString("image3"), rs.getString("image4"), rs.getString("image5"));

                Product product = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("productMetaTitle"), rs.getString("summary"),
                        rs.getString("SKU"), rs.getDouble("price"), rs.getDouble("discount"), rs.getInt("quantity"), rs.getInt("countBuy"),
                        rs.getString("size"), rs.getString("screen"), rs.getString("camera"), rs.getString("cameraSelfie"), rs.getString("CPU"),
                        rs.getString("memory"), rs.getString("RAM"), rs.getString("hardDrive"), rs.getString("card"), rs.getString("weight"),
                        rs.getInt("warranty"), rs.getDate("productCreateAt"), rs.getDate("productUpdateAt"), rs.getDate("productSaleStartAt"),
                        rs.getDate("productSaleEndAt"), productImage, productColor, producer, category);

                listP.add(product);
            }
            return listP;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Product> getProductByCategoryID(int categoryID) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT p.[productID]\n"
                    + "      ,p.[producerID]\n"
                    + "      ,p.[categoryID]\n"
                    + "      ,p.[productName]\n"
                    + "      ,p.[productMetaTitle]\n"
                    + "      ,p.[summary]\n"
                    + "      ,p.[SKU]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[countBuy]\n"
                    + "      ,p.[size]\n"
                    + "      ,p.[screen]\n"
                    + "      ,p.[camera]\n"
                    + "      ,p.[cameraSelfie]\n"
                    + "      ,p.[CPU]\n"
                    + "      ,p.[memory]\n"
                    + "      ,p.[RAM]\n"
                    + "      ,p.[hardDrive]\n"
                    + "      ,p.[card]\n"
                    + "      ,p.[weight]\n"
                    + "      ,p.[warranty]\n"
                    + "      ,p.[productCreateAt]\n"
                    + "      ,p.[productUpdateAt]\n"
                    + "      ,p.[productSaleStartAt]\n"
                    + "      ,p.[productSaleEndAt]\n"
                    + "      ,c.[categoryName]\n"
                    + "      ,c.[categoryParentID]\n"
                    + "      ,c.[categoryMetaTitle]\n"
                    + "      ,c.[categoryCreateAt]\n"
                    + "      ,c.[categoryUpDATEAt]\n"
                    + "      ,pc.[producerName]\n"
                    + "      ,pc.[producerMeta]\n"
                    + "      ,pc.[Country]\n"
                    + "      ,pcolor.[color1]\n"
                    + "      ,pcolor.[color2]\n"
                    + "      ,pcolor.[color3]\n"
                    + "      ,pcolor.[color4]\n"
                    + "      ,pcolor.[color5]\n"
                    + "      ,pimage.[image1]\n"
                    + "      ,pimage.[image2]\n"
                    + "      ,pimage.[image3]\n"
                    + "      ,pimage.[image4]\n"
                    + "      ,pimage.[image5]\n"
                    + "     FROM [website].[dbo].[Products] p inner join [website].[dbo].[Categories] c\n"
                    + "     ON p.categoryID =c.categoryID inner join [website].[dbo].[Producers] pc\n"
                    + "     ON p.producerID = pc.producerID inner join [website].[dbo].[ProductColor] pcolor\n"
                    + "     ON p.productID = pcolor.productID inner join [website].[dbo].[ProductImages] pimage\n"
                    + "     ON p.productID= pimage.productID\n"
                    + "     WHERE 1=1 ";

            if (categoryID != 0) {
                sql += " AND c.categoryID = " + categoryID;
            }
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            List<Product> listP = new ArrayList<>();
            while (rs.next()) {
                Category category = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getInt("categoryParentID"),
                        rs.getString("categoryMetaTitle"), rs.getDate("categoryCreateAt"), rs.getDate("categoryUpDATEAt"));

                Producer producer = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("producerMeta"), rs.getString("Country"));

                ProductColor productColor = new ProductColor(rs.getInt("productID"), rs.getString("color1"), rs.getString("color2"),
                        rs.getString("color3"), rs.getString("color4"), rs.getString("color5"));

                ProductImage productImage = new ProductImage(rs.getInt("productID"), rs.getString("image1"), rs.getString("image2"),
                        rs.getString("image3"), rs.getString("image4"), rs.getString("image5"));

                Product product = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("productMetaTitle"), rs.getString("summary"),
                        rs.getString("SKU"), rs.getDouble("price"), rs.getDouble("discount"), rs.getInt("quantity"), rs.getInt("countBuy"),
                        rs.getString("size"), rs.getString("screen"), rs.getString("camera"), rs.getString("cameraSelfie"), rs.getString("CPU"),
                        rs.getString("memory"), rs.getString("RAM"), rs.getString("hardDrive"), rs.getString("card"), rs.getString("weight"),
                        rs.getInt("warranty"), rs.getDate("productCreateAt"), rs.getDate("productUpdateAt"), rs.getDate("productSaleStartAt"),
                        rs.getDate("productSaleEndAt"), productImage, productColor, producer, category);

                listP.add(product);
            }
            return listP;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Product getProductByID(int productID) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT p.[productID]\n"
                    + "      ,p.[producerID]\n"
                    + "      ,p.[categoryID]\n"
                    + "      ,p.[productName]\n"
                    + "      ,p.[productMetaTitle]\n"
                    + "      ,p.[summary]\n"
                    + "      ,p.[SKU]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[countBuy]\n"
                    + "      ,p.[size]\n"
                    + "      ,p.[screen]\n"
                    + "      ,p.[camera]\n"
                    + "      ,p.[cameraSelfie]\n"
                    + "      ,p.[CPU]\n"
                    + "      ,p.[memory]\n"
                    + "      ,p.[RAM]\n"
                    + "      ,p.[hardDrive]\n"
                    + "      ,p.[card]\n"
                    + "      ,p.[weight]\n"
                    + "      ,p.[warranty]\n"
                    + "      ,p.[productCreateAt]\n"
                    + "      ,p.[productUpdateAt]\n"
                    + "      ,p.[productSaleStartAt]\n"
                    + "      ,p.[productSaleEndAt]\n"
                    + "      ,c.[categoryName]\n"
                    + "      ,c.[categoryParentID]\n"
                    + "      ,c.[categoryMetaTitle]\n"
                    + "      ,c.[categoryCreateAt]\n"
                    + "      ,c.[categoryUpDATEAt]\n"
                    + "      ,pc.[producerName]\n"
                    + "      ,pc.[producerMeta]\n"
                    + "      ,pc.[Country]\n"
                    + "      ,pcolor.[color1]\n"
                    + "      ,pcolor.[color2]\n"
                    + "      ,pcolor.[color3]\n"
                    + "      ,pcolor.[color4]\n"
                    + "      ,pcolor.[color5]\n"
                    + "      ,pimage.[image1]\n"
                    + "      ,pimage.[image2]\n"
                    + "      ,pimage.[image3]\n"
                    + "      ,pimage.[image4]\n"
                    + "      ,pimage.[image5]\n"
                    + "  FROM [website].[dbo].[Products] p inner join [website].[dbo].[Categories] c\n"
                    + "  ON p.categoryID =c.categoryID inner join [website].[dbo].[Producers] pc\n"
                    + "  ON p.producerID = pc.producerID inner join [website].[dbo].[ProductColor] pcolor\n"
                    + "  ON p.productID = pcolor.productID inner join [website].[dbo].[ProductImages] pimage\n"
                    + "  ON p.productID= pimage.productID\n"
                    + "  WHERE p.productID = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            rs = st.executeQuery();

            if (rs.next()) {
                Category category = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getInt("categoryParentID"),
                        rs.getString("categoryMetaTitle"), rs.getDate("categoryCreateAt"), rs.getDate("categoryUpDATEAt"));

                Producer producer = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("producerMeta"), rs.getString("Country"));

                ProductColor productColor = new ProductColor(rs.getInt("productID"), rs.getString("color1"), rs.getString("color2"),
                        rs.getString("color3"), rs.getString("color4"), rs.getString("color5"));

                ProductImage productImage = new ProductImage(rs.getInt("productID"), rs.getString("image1"), rs.getString("image2"),
                        rs.getString("image3"), rs.getString("image4"), rs.getString("image5"));

                Product product = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("productMetaTitle"), rs.getString("summary"),
                        rs.getString("SKU"), rs.getDouble("price"), rs.getDouble("discount"), rs.getInt("quantity"), rs.getInt("countBuy"),
                        rs.getString("size"), rs.getString("screen"), rs.getString("camera"), rs.getString("cameraSelfie"), rs.getString("CPU"),
                        rs.getString("memory"), rs.getString("RAM"), rs.getString("hardDrive"), rs.getString("card"), rs.getString("weight"),
                        rs.getInt("warranty"), rs.getDate("productCreateAt"), rs.getDate("productUpdateAt"), rs.getDate("productSaleStartAt"),
                        rs.getDate("productSaleEndAt"), productImage, productColor, producer, category);

                return product;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public int getTotalProduct() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT COUNT(productID) as 'TotalProducts'\n"
                    + "  FROM [website].[dbo].[Products]";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt("TotalProducts");
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    @Override
    public List<Product> getProductSaleDate() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT p.[productID]\n"
                    + "      ,p.[producerID]\n"
                    + "      ,p.[categoryID]\n"
                    + "      ,p.[productName]\n"
                    + "      ,p.[productMetaTitle]\n"
                    + "      ,p.[summary]\n"
                    + "      ,p.[SKU]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[countBuy]\n"
                    + "      ,p.[size]\n"
                    + "      ,p.[screen]\n"
                    + "      ,p.[camera]\n"
                    + "      ,p.[cameraSelfie]\n"
                    + "      ,p.[CPU]\n"
                    + "      ,p.[memory]\n"
                    + "      ,p.[RAM]\n"
                    + "      ,p.[hardDrive]\n"
                    + "      ,p.[card]\n"
                    + "      ,p.[weight]\n"
                    + "      ,p.[warranty]\n"
                    + "      ,p.[productCreateAt]\n"
                    + "      ,p.[productUpdateAt]\n"
                    + "      ,p.[productSaleStartAt]\n"
                    + "      ,p.[productSaleEndAt]\n"
                    + "      ,c.[categoryName]\n"
                    + "      ,c.[categoryParentID]\n"
                    + "      ,c.[categoryMetaTitle]\n"
                    + "      ,c.[categoryCreateAt]\n"
                    + "      ,c.[categoryUpDATEAt]\n"
                    + "      ,pc.[producerName]\n"
                    + "      ,pc.[producerMeta]\n"
                    + "      ,pc.[Country]\n"
                    + "      ,pcolor.[color1]\n"
                    + "      ,pcolor.[color2]\n"
                    + "      ,pcolor.[color3]\n"
                    + "      ,pcolor.[color4]\n"
                    + "      ,pcolor.[color5]\n"
                    + "      ,pimage.[image1]\n"
                    + "      ,pimage.[image2]\n"
                    + "      ,pimage.[image3]\n"
                    + "      ,pimage.[image4]\n"
                    + "      ,pimage.[image5]\n"
                    + "     FROM [website].[dbo].[Products] p inner join [website].[dbo].[Categories] c\n"
                    + "     ON p.categoryID =c.categoryID inner join [website].[dbo].[Producers] pc\n"
                    + "     ON p.producerID = pc.producerID inner join [website].[dbo].[ProductColor] pcolor\n"
                    + "     ON p.productID = pcolor.productID inner join [website].[dbo].[ProductImages] pimage\n"
                    + "     ON p.productID= pimage.productID\n"
                    + "     WHERE DATEDIFF(day, GETDATE(), [productSaleEndAt]) > 0";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            List<Product> listP = new ArrayList<>();
            while (rs.next()) {
                Category category = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getInt("categoryParentID"),
                        rs.getString("categoryMetaTitle"), rs.getDate("categoryCreateAt"), rs.getDate("categoryUpDATEAt"));

                Producer producer = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("producerMeta"), rs.getString("Country"));

                ProductColor productColor = new ProductColor(rs.getInt("productID"), rs.getString("color1"), rs.getString("color2"),
                        rs.getString("color3"), rs.getString("color4"), rs.getString("color5"));

                ProductImage productImage = new ProductImage(rs.getInt("productID"), rs.getString("image1"), rs.getString("image2"),
                        rs.getString("image3"), rs.getString("image4"), rs.getString("image5"));

                Product product = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("productMetaTitle"), rs.getString("summary"),
                        rs.getString("SKU"), rs.getDouble("price"), rs.getDouble("discount"), rs.getInt("quantity"), rs.getInt("countBuy"),
                        rs.getString("size"), rs.getString("screen"), rs.getString("camera"), rs.getString("cameraSelfie"), rs.getString("CPU"),
                        rs.getString("memory"), rs.getString("RAM"), rs.getString("hardDrive"), rs.getString("card"), rs.getString("weight"),
                        rs.getInt("warranty"), rs.getDate("productCreateAt"), rs.getDate("productUpdateAt"), rs.getDate("productSaleStartAt"),
                        rs.getDate("productSaleEndAt"), productImage, productColor, producer, category);

                listP.add(product);
            }
            return listP;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    @Override
    public List<Product> get15ProductSameCategoryByProductID(int productID) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            String sql1 = "SELECT [categoryID]\n"
                    + "FROM [website].[dbo].Products\n"
                    + "WHERE Products.productID = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, productID);
            ResultSet rs1 = st1.executeQuery();
            if (rs1.next()) {
                String sql = "SELECT TOP(15)	p.[productID]\n"
                        + "                          ,p.[producerID]\n"
                        + "                          ,p.[categoryID]\n"
                        + "                          ,p.[productName]\n"
                        + "                          ,p.[productMetaTitle]\n"
                        + "                          ,p.[summary]\n"
                        + "                          ,p.[SKU]\n"
                        + "                          ,p.[price]\n"
                        + "                          ,p.[discount]\n"
                        + "                          ,p.[quantity]\n"
                        + "                          ,p.[countBuy]\n"
                        + "                          ,p.[size]\n"
                        + "                          ,p.[screen]\n"
                        + "                          ,p.[camera]\n"
                        + "                          ,p.[cameraSelfie]\n"
                        + "                          ,p.[CPU]\n"
                        + "                          ,p.[memory]\n"
                        + "                          ,p.[RAM]\n"
                        + "                          ,p.[hardDrive]\n"
                        + "                          ,p.[card]\n"
                        + "                          ,p.[weight]\n"
                        + "                          ,p.[warranty]\n"
                        + "                          ,p.[productCreateAt]\n"
                        + "                          ,p.[productUpdateAt]\n"
                        + "                          ,p.[productSaleStartAt]\n"
                        + "                          ,p.[productSaleEndAt]\n"
                        + "                          ,c.[categoryName]\n"
                        + "                          ,c.[categoryParentID]\n"
                        + "                          ,c.[categoryMetaTitle]\n"
                        + "                          ,c.[categoryCreateAt]\n"
                        + "                          ,c.[categoryUpDATEAt]\n"
                        + "                          ,pc.[producerName]\n"
                        + "                          ,pc.[producerMeta]\n"
                        + "                          ,pc.[Country]\n"
                        + "                          ,pcolor.[color1]\n"
                        + "                          ,pcolor.[color2]\n"
                        + "                          ,pcolor.[color3]\n"
                        + "                          ,pcolor.[color4]\n"
                        + "                          ,pcolor.[color5]\n"
                        + "                          ,pimage.[image1]\n"
                        + "                          ,pimage.[image2]\n"
                        + "                          ,pimage.[image3]\n"
                        + "                          ,pimage.[image4]\n"
                        + "                          ,pimage.[image5]\n"
                        + "                         FROM [website].[dbo].[Products] p inner join [website].[dbo].[Categories] c\n"
                        + "                         ON p.categoryID =c.categoryID inner join [website].[dbo].[Producers] pc\n"
                        + "                         ON p.producerID = pc.producerID inner join [website].[dbo].[ProductColor] pcolor\n"
                        + "                         ON p.productID = pcolor.productID inner join [website].[dbo].[ProductImages] pimage\n"
                        + "                         ON p.productID= pimage.productID \n"
                        + "                         WHERE p.categoryID = ?";

                st = connection.prepareStatement(sql);
                st.setInt(1, rs1.getInt("categoryID"));

                rs = st.executeQuery();
                List<Product> listP = new ArrayList<>();
                while (rs.next()) {
                    Category category = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getInt("categoryParentID"),
                            rs.getString("categoryMetaTitle"), rs.getDate("categoryCreateAt"), rs.getDate("categoryUpDATEAt"));

                    Producer producer = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("producerMeta"), rs.getString("Country"));

                    ProductColor productColor = new ProductColor(rs.getInt("productID"), rs.getString("color1"), rs.getString("color2"),
                            rs.getString("color3"), rs.getString("color4"), rs.getString("color5"));

                    ProductImage productImage = new ProductImage(rs.getInt("productID"), rs.getString("image1"), rs.getString("image2"),
                            rs.getString("image3"), rs.getString("image4"), rs.getString("image5"));

                    Product product = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("productMetaTitle"), rs.getString("summary"),
                            rs.getString("SKU"), rs.getDouble("price"), rs.getDouble("discount"), rs.getInt("quantity"), rs.getInt("countBuy"),
                            rs.getString("size"), rs.getString("screen"), rs.getString("camera"), rs.getString("cameraSelfie"), rs.getString("CPU"),
                            rs.getString("memory"), rs.getString("RAM"), rs.getString("hardDrive"), rs.getString("card"), rs.getString("weight"),
                            rs.getInt("warranty"), rs.getDate("productCreateAt"), rs.getDate("productUpdateAt"), rs.getDate("productSaleStartAt"),
                            rs.getDate("productSaleEndAt"), productImage, productColor, producer, category);

                    listP.add(product);
                }
                return listP;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Product> getProductByProducerCheckBoxAndCategoryID(int[] producerIDs, int[] categoryID) {
        PreparedStatement st = null;
        ResultSet rs = null;
        List<Product> listP = new ArrayList<>();
        try {
            String sql = "SELECT p.[productID]\n"
                    + "      ,p.[producerID]\n"
                    + "      ,p.[categoryID]\n"
                    + "      ,p.[productName]\n"
                    + "      ,p.[productMetaTitle]\n"
                    + "      ,p.[summary]\n"
                    + "      ,p.[SKU]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[countBuy]\n"
                    + "      ,p.[size]\n"
                    + "      ,p.[screen]\n"
                    + "      ,p.[camera]\n"
                    + "      ,p.[cameraSelfie]\n"
                    + "      ,p.[CPU]\n"
                    + "      ,p.[memory]\n"
                    + "      ,p.[RAM]\n"
                    + "      ,p.[hardDrive]\n"
                    + "      ,p.[card]\n"
                    + "      ,p.[weight]\n"
                    + "      ,p.[warranty]\n"
                    + "      ,p.[productCreateAt]\n"
                    + "      ,p.[productUpdateAt]\n"
                    + "      ,p.[productSaleStartAt]\n"
                    + "      ,p.[productSaleEndAt]\n"
                    + "      ,c.[categoryName]\n"
                    + "      ,c.[categoryParentID]\n"
                    + "      ,c.[categoryMetaTitle]\n"
                    + "      ,c.[categoryCreateAt]\n"
                    + "      ,c.[categoryUpDATEAt]\n"
                    + "      ,pc.[producerName]\n"
                    + "      ,pc.[producerMeta]\n"
                    + "      ,pc.[Country]\n"
                    + "      ,pcolor.[color1]\n"
                    + "      ,pcolor.[color2]\n"
                    + "      ,pcolor.[color3]\n"
                    + "      ,pcolor.[color4]\n"
                    + "      ,pcolor.[color5]\n"
                    + "      ,pimage.[image1]\n"
                    + "      ,pimage.[image2]\n"
                    + "      ,pimage.[image3]\n"
                    + "      ,pimage.[image4]\n"
                    + "      ,pimage.[image5]\n"
                    + "     FROM [website].[dbo].[Products] p inner join [website].[dbo].[Categories] c\n"
                    + "     ON p.categoryID =c.categoryID inner join [website].[dbo].[Producers] pc\n"
                    + "     ON p.producerID = pc.producerID inner join [website].[dbo].[ProductColor] pcolor\n"
                    + "     ON p.productID = pcolor.productID inner join [website].[dbo].[ProductImages] pimage\n"
                    + "     ON p.productID= pimage.productID\n"
                    + "     WHERE 1 = 1 ";

            if (producerIDs != null) {
                sql += " AND p.producerID IN ( ";
                for (int i = 0; i < producerIDs.length; i++) {
                    if (i == producerIDs.length - 1) {
                        sql += producerIDs[i] + ") ";
                    } else {
                        sql += producerIDs[i] + ",";
                    }
                }
            }

            if (categoryID != null) {
                sql += " AND p.categoryID IN ( ";
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

            while (rs.next()) {
                Category category = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getInt("categoryParentID"),
                        rs.getString("categoryMetaTitle"), rs.getDate("categoryCreateAt"), rs.getDate("categoryUpDATEAt"));

                Producer producer = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("producerMeta"), rs.getString("Country"));

                ProductColor productColor = new ProductColor(rs.getInt("productID"), rs.getString("color1"), rs.getString("color2"),
                        rs.getString("color3"), rs.getString("color4"), rs.getString("color5"));

                ProductImage productImage = new ProductImage(rs.getInt("productID"), rs.getString("image1"), rs.getString("image2"),
                        rs.getString("image3"), rs.getString("image4"), rs.getString("image5"));

                Product product = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("productMetaTitle"), rs.getString("summary"),
                        rs.getString("SKU"), rs.getDouble("price"), rs.getDouble("discount"), rs.getInt("quantity"), rs.getInt("countBuy"),
                        rs.getString("size"), rs.getString("screen"), rs.getString("camera"), rs.getString("cameraSelfie"), rs.getString("CPU"),
                        rs.getString("memory"), rs.getString("RAM"), rs.getString("hardDrive"), rs.getString("card"), rs.getString("weight"),
                        rs.getInt("warranty"), rs.getDate("productCreateAt"), rs.getDate("productUpdateAt"), rs.getDate("productSaleStartAt"),
                        rs.getDate("productSaleEndAt"), productImage, productColor, producer, category);

                listP.add(product);
            }
            return listP;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    @Override
    public double getRevenueInMonth() {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT SUM(totalMoney)\n"
                    + "       FROM [website].[dbo].[Orders]\n"
                    + "       WHERE MONTH([orderCreatedAt]) = MONTH(getdate()) AND [status] = 1";

            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    @Override
    public String getRevenueInMonthFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(getRevenueInMonth());
    }

    @Override
    public void insert(Product product) {
        try {

            String insertProduct = "INSERT INTO [dbo].[Products]\n"
                    + "           ([producerID]\n"
                    + "           ,[categoryID]\n"
                    + "           ,[productName]\n"
                    + "           ,[productMetaTitle]\n"
                    + "           ,[summary]\n"
                    + "           ,[SKU]\n"
                    + "           ,[price]\n"
                    + "           ,[discount]\n"
                    + "           ,[quantity]\n"
                    + "           ,[countBuy]\n"
                    + "           ,[size]\n"
                    + "           ,[screen]\n"
                    + "           ,[camera]\n"
                    + "           ,[cameraSelfie]\n"
                    + "           ,[CPU]\n"
                    + "           ,[memory]\n"
                    + "           ,[RAM]\n"
                    + "           ,[hardDrive]\n"
                    + "           ,[card]\n"
                    + "           ,[weight]\n"
                    + "           ,[warranty]\n"
                    + "           ,[productCreateAt]\n"
                    + "           ,[productUpdateAt]\n"
                    + "           ,[productSaleStartAt]\n"
                    + "           ,[productSaleEndAt])\n"
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
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st = connection.prepareStatement(insertProduct);
            st.setInt(1, product.getProducer().getProducerID());
            st.setInt(2, product.getCategory().getCategoryID());
            st.setString(3, product.getProductName());
            st.setString(4, product.getProductMetaTitle());
            st.setString(5, product.getSummary());
            st.setString(6, product.getSKU());
            st.setDouble(7, product.getPrice());
            st.setDouble(8, product.getDiscount());
            st.setInt(9, product.getQuantity());
            st.setInt(10, product.getCountBuy());
            st.setString(11, product.getSize());
            st.setString(12, product.getScreen());
            st.setString(13, product.getCamera());
            st.setString(14, product.getCameraSelfie());
            st.setString(15, product.getCPU());
            st.setString(16, product.getMemory());
            st.setString(17, product.getRAM());
            st.setString(18, product.getHardDrive());
            st.setString(19, product.getCard());
            st.setString(20, product.getWeight());
            st.setInt(21, product.getWarranty());
            st.setDate(22, product.getProductCreateAt());
            st.setDate(23, product.getProductUpdateAt());
            st.setDate(24, product.getProductSaleStartAt());
            st.setDate(25, product.getProductSaleEndAt());
            st.executeUpdate();

            String insertProductColor = "INSERT INTO [dbo].[ProductColor]\n"
                    + "           ([productID]\n"
                    + "           ,[color1]\n"
                    + "           ,[color2]\n"
                    + "           ,[color3]\n"
                    + "           ,[color4]\n"
                    + "           ,[color5])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st1 = connection.prepareStatement(insertProductColor);
            st1.setInt(1, getLastProductID());
            st1.setString(2, product.getColor().getColorFirst());
            st1.setString(3, product.getColor().getColorSecond());
            st1.setString(4, product.getColor().getColorThree());
            st1.setString(5, product.getColor().getColorFour());
            st1.setString(6, product.getColor().getColorFive());
            st1.executeUpdate();

            String insertProductImage = "INSERT INTO [dbo].[ProductImages]\n"
                    + "           ([productID]\n"
                    + "           ,[image1]\n"
                    + "           ,[image2]\n"
                    + "           ,[image3]\n"
                    + "           ,[image4]\n"
                    + "           ,[image5])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st2 = connection.prepareStatement(insertProductImage);

            st2.setInt(1, getLastProductID());
            st2.setString(2, product.getImage().getImageFirst());
            st2.setString(3, product.getImage().getImageSecond());
            st2.setString(4, product.getImage().getImageThree());
            st2.setString(5, product.getImage().getImageFour());
            st2.setString(6, product.getImage().getImageFive());
            st2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public int getLastProductID() {
        try {
            String lastProductID = "SELECT TOP (1) [productID] FROM [website].[dbo].[Products] ORDER BY productID desc";
            PreparedStatement st = connection.prepareStatement(lastProductID);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    @Override
    public void delete(int productID) {
        try {

            String sql = "DELETE FROM [dbo].[ProductColor]\n"
                    + "      WHERE productID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.executeUpdate();

            String sql1 = "DELETE FROM [dbo].[ProductReview]\n"
                    + "      WHERE productID = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, productID);
            st1.executeUpdate();

            String sql2 = "DELETE FROM [dbo].[ProductImages]\n"
                    + "      WHERE productID = ?";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, productID);
            st2.executeUpdate();

            String sql3 = "DELETE FROM [dbo].[ProductImages]\n"
                    + "      WHERE productID = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            st3.setInt(1, productID);
            st3.executeUpdate();

            String sql4 = "DELETE FROM [dbo].[OrderLines]\n"
                    + "      WHERE productID = ?";
            PreparedStatement st4 = connection.prepareStatement(sql4);
            st4.setInt(1, productID);
            st4.executeUpdate();

            String sql5 = "DELETE FROM [dbo].[Products]\n"
                    + "      WHERE productID = ?";
            PreparedStatement st5 = connection.prepareStatement(sql5);
            st5.setInt(1, productID);
            st5.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Product p) {
        try {
            String sql = "UPDATE [dbo].[Products]\n"
                    + "   SET [producerID] = ?\n"
                    + "      ,[categoryID] = ?\n"
                    + "      ,[productName] = ?\n"
                    + "      ,[productMetaTitle] = ?\n"
                    + "      ,[summary] = ?\n"
                    + "      ,[SKU] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[discount] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[countBuy] = ?\n"
                    + "      ,[size] = ?\n"
                    + "      ,[screen] = ?\n"
                    + "      ,[camera] = ?\n"
                    + "      ,[cameraSelfie] = ?\n"
                    + "      ,[CPU] = ?\n"
                    + "      ,[memory] = ?\n"
                    + "      ,[RAM] = ?\n"
                    + "      ,[hardDrive] = ?\n"
                    + "      ,[card] = ?\n"
                    + "      ,[weight] = ?\n"
                    + "      ,[warranty] = ?\n"
                    + "      ,[productUpdateAt] = ?\n"
                    + " WHERE productID = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getProducer().getProducerID());
            st.setInt(2, p.getCategory().getCategoryID());
            st.setString(3, p.getProductName());
            st.setString(4, p.getProductMetaTitle());
            st.setString(5, p.getSummary());
            st.setString(6, p.getSKU());
            st.setDouble(7, p.getPrice());
            st.setDouble(8, p.getDiscount());
            st.setInt(9, p.getQuantity());
            st.setInt(10, p.getCountBuy());
            st.setString(11, p.getSize());
            st.setString(12, p.getScreen());
            st.setString(13, p.getCamera());
            st.setString(14, p.getCameraSelfie());
            st.setString(15, p.getCPU());
            st.setString(16, p.getMemory());
            st.setString(17, p.getRAM());
            st.setString(18, p.getHardDrive());
            st.setString(19, p.getCard());
            st.setString(20, p.getWeight());
            st.setInt(21, p.getWarranty());
            st.setDate(22, Common.getCurrentDate());
            st.setInt(23, p.getProductID());
            st.executeUpdate();

            String sql1 = "UPDATE [dbo].[ProductColor]\n"
                    + "   SET [color1] = ?\n"
                    + "      ,[color2] = ?\n"
                    + "      ,[color3] = ?\n"
                    + "      ,[color4] = ?\n"
                    + "      ,[color5] = ?\n"
                    + " WHERE productID = ?";

            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, p.getColor().getColorFirst());
            st1.setString(2, p.getColor().getColorSecond());
            st1.setString(3, p.getColor().getColorThree());
            st1.setString(4, p.getColor().getColorFour());
            st1.setString(5, p.getColor().getColorFive());
            st1.setInt(6, p.getProductID());
            st1.executeUpdate();

            String sql2 = "UPDATE [dbo].[ProductImages]\n"
                    + "   SET [image1] = ?\n"
                    + "      ,[image2] = ?\n"
                    + "      ,[image3] = ?\n"
                    + "      ,[image4] = ?\n"
                    + "      ,[image5] = ?\n"
                    + " WHERE productID = ?";

            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setString(1, p.getImage().getImageFirst());
            st2.setString(2, p.getImage().getImageSecond());
            st2.setString(3, p.getImage().getImageThree());
            st2.setString(4, p.getImage().getImageFour());
            st2.setString(5, p.getImage().getImageFive());
            st2.setInt(6, p.getProductID());
            st2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    @Override
    public List<Product> getProductFeatured() {
        try {
            String sql = "SELECT TOP(15) p.[productID]\n"
                    + "      ,p.[producerID]\n"
                    + "      ,p.[categoryID]\n"
                    + "      ,p.[productName]\n"
                    + "      ,p.[productMetaTitle]\n"
                    + "      ,p.[summary]\n"
                    + "      ,p.[SKU]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[countBuy]\n"
                    + "      ,p.[size]\n"
                    + "      ,p.[screen]\n"
                    + "      ,p.[camera]\n"
                    + "      ,p.[cameraSelfie]\n"
                    + "      ,p.[CPU]\n"
                    + "      ,p.[memory]\n"
                    + "      ,p.[RAM]\n"
                    + "      ,p.[hardDrive]\n"
                    + "      ,p.[card]\n"
                    + "      ,p.[weight]\n"
                    + "      ,p.[warranty]\n"
                    + "      ,p.[productCreateAt]\n"
                    + "      ,p.[productUpdateAt]\n"
                    + "      ,p.[productSaleStartAt]\n"
                    + "      ,p.[productSaleEndAt]\n"
                    + "      ,c.[categoryName]\n"
                    + "      ,c.[categoryParentID]\n"
                    + "      ,c.[categoryMetaTitle]\n"
                    + "      ,c.[categoryCreateAt]\n"
                    + "      ,c.[categoryUpDATEAt]\n"
                    + "      ,pc.[producerName]\n"
                    + "      ,pc.[producerMeta]\n"
                    + "      ,pc.[Country]\n"
                    + "      ,pcolor.[color1]\n"
                    + "      ,pcolor.[color2]\n"
                    + "      ,pcolor.[color3]\n"
                    + "      ,pcolor.[color4]\n"
                    + "      ,pcolor.[color5]\n"
                    + "      ,pimage.[image1]\n"
                    + "      ,pimage.[image2]\n"
                    + "      ,pimage.[image3]\n"
                    + "      ,pimage.[image4]\n"
                    + "      ,pimage.[image5]\n"
                    + "     FROM [website].[dbo].[Products] p inner join [website].[dbo].[Categories] c\n"
                    + "     ON p.categoryID =c.categoryID inner join [website].[dbo].[Producers] pc\n"
                    + "     ON p.producerID = pc.producerID inner join [website].[dbo].[ProductColor] pcolor\n"
                    + "     ON p.productID = pcolor.productID inner join [website].[dbo].[ProductImages] pimage\n"
                    + "     ON p.productID= pimage.productID\n"
                    + "     ORDER BY p.countBuy DESC";

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            List<Product> listP = new ArrayList<>();

            while (rs.next()) {
                Category category = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getInt("categoryParentID"),
                        rs.getString("categoryMetaTitle"), rs.getDate("categoryCreateAt"), rs.getDate("categoryUpDATEAt"));

                Producer producer = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("producerMeta"), rs.getString("Country"));

                ProductColor productColor = new ProductColor(rs.getInt("productID"), rs.getString("color1"), rs.getString("color2"),
                        rs.getString("color3"), rs.getString("color4"), rs.getString("color5"));

                ProductImage productImage = new ProductImage(rs.getInt("productID"), rs.getString("image1"), rs.getString("image2"),
                        rs.getString("image3"), rs.getString("image4"), rs.getString("image5"));

                Product product = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("productMetaTitle"), rs.getString("summary"),
                        rs.getString("SKU"), rs.getDouble("price"), rs.getDouble("discount"), rs.getInt("quantity"), rs.getInt("countBuy"),
                        rs.getString("size"), rs.getString("screen"), rs.getString("camera"), rs.getString("cameraSelfie"), rs.getString("CPU"),
                        rs.getString("memory"), rs.getString("RAM"), rs.getString("hardDrive"), rs.getString("card"), rs.getString("weight"),
                        rs.getInt("warranty"), rs.getDate("productCreateAt"), rs.getDate("productUpdateAt"), rs.getDate("productSaleStartAt"),
                        rs.getDate("productSaleEndAt"), productImage, productColor, producer, category);

                listP.add(product);
            }
            return listP;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Product> getProductBySearch(int categoryID, String search) {
        try {
            String sql = "SELECT p.[productID]\n"
                    + "      ,p.[producerID]\n"
                    + "      ,p.[categoryID]\n"
                    + "      ,p.[productName]\n"
                    + "      ,p.[productMetaTitle]\n"
                    + "      ,p.[summary]\n"
                    + "      ,p.[SKU]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[countBuy]\n"
                    + "      ,p.[size]\n"
                    + "      ,p.[screen]\n"
                    + "      ,p.[camera]\n"
                    + "      ,p.[cameraSelfie]\n"
                    + "      ,p.[CPU]\n"
                    + "      ,p.[memory]\n"
                    + "      ,p.[RAM]\n"
                    + "      ,p.[hardDrive]\n"
                    + "      ,p.[card]\n"
                    + "      ,p.[weight]\n"
                    + "      ,p.[warranty]\n"
                    + "      ,p.[productCreateAt]\n"
                    + "      ,p.[productUpdateAt]\n"
                    + "      ,p.[productSaleStartAt]\n"
                    + "      ,p.[productSaleEndAt]\n"
                    + "      ,c.[categoryName]\n"
                    + "      ,c.[categoryParentID]\n"
                    + "      ,c.[categoryMetaTitle]\n"
                    + "      ,c.[categoryCreateAt]\n"
                    + "      ,c.[categoryUpDATEAt]\n"
                    + "      ,pc.[producerName]\n"
                    + "      ,pc.[producerMeta]\n"
                    + "      ,pc.[Country]\n"
                    + "      ,pcolor.[color1]\n"
                    + "      ,pcolor.[color2]\n"
                    + "      ,pcolor.[color3]\n"
                    + "      ,pcolor.[color4]\n"
                    + "      ,pcolor.[color5]\n"
                    + "      ,pimage.[image1]\n"
                    + "      ,pimage.[image2]\n"
                    + "      ,pimage.[image3]\n"
                    + "      ,pimage.[image4]\n"
                    + "      ,pimage.[image5]\n"
                    + "     FROM [website].[dbo].[Products] p inner join [website].[dbo].[Categories] c\n"
                    + "     ON p.categoryID =c.categoryID inner join [website].[dbo].[Producers] pc\n"
                    + "     ON p.producerID = pc.producerID inner join [website].[dbo].[ProductColor] pcolor\n"
                    + "     ON p.productID = pcolor.productID inner join [website].[dbo].[ProductImages] pimage\n"
                    + "     ON p.productID= pimage.productID\n"
                    + "     WHERE 1=1";

            if (categoryID != 0) {
                sql += " AND p.categoryID = " + categoryID;
            }

            if (search != null) {
                sql += " AND c.categoryName like '%" + search + "%' OR p.productName like '%" + search + "%' OR pc.producerName like '%" + search + "%'";
            }
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            List<Product> listP = new ArrayList<>();

            while (rs.next()) {
                Category category = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getInt("categoryParentID"),
                        rs.getString("categoryMetaTitle"), rs.getDate("categoryCreateAt"), rs.getDate("categoryUpDATEAt"));

                Producer producer = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("producerMeta"), rs.getString("Country"));

                ProductColor productColor = new ProductColor(rs.getInt("productID"), rs.getString("color1"), rs.getString("color2"),
                        rs.getString("color3"), rs.getString("color4"), rs.getString("color5"));

                ProductImage productImage = new ProductImage(rs.getInt("productID"), rs.getString("image1"), rs.getString("image2"),
                        rs.getString("image3"), rs.getString("image4"), rs.getString("image5"));

                Product product = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("productMetaTitle"), rs.getString("summary"),
                        rs.getString("SKU"), rs.getDouble("price"), rs.getDouble("discount"), rs.getInt("quantity"), rs.getInt("countBuy"),
                        rs.getString("size"), rs.getString("screen"), rs.getString("camera"), rs.getString("cameraSelfie"), rs.getString("CPU"),
                        rs.getString("memory"), rs.getString("RAM"), rs.getString("hardDrive"), rs.getString("card"), rs.getString("weight"),
                        rs.getInt("warranty"), rs.getDate("productCreateAt"), rs.getDate("productUpdateAt"), rs.getDate("productSaleStartAt"),
                        rs.getDate("productSaleEndAt"), productImage, productColor, producer, category);

                listP.add(product);
            }
            return listP;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public HashMap<Integer, Double> getTotalRevenueForChart(int status) {
        try {
            HashMap<Integer, Double> map = new HashMap<>();
            for (int i = 1; i <= 12; i++) {
                String sql = "SELECT SUM(totalMoney)\n"
                        + "  FROM [website].[dbo].[Orders]\n"
                        + "  WHERE MONTH([orderCreatedAt]) IN (?)";
                if (status != -1) {
                    sql += " AND [status] = " + status;
                }
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, i);
                ResultSet rs = st.executeQuery();
                switch (i) {
                    case 1:
                        map.put(1, (rs.next() ? rs.getDouble(1) : 0.0));
                        break;
                    case 2:
                        map.put(2, (rs.next() ? rs.getDouble(1) : 0.0));
                        break;
                    case 3:
                        map.put(3, (rs.next() ? rs.getDouble(1) : 0.0));
                        break;
                    case 4:
                        map.put(4, (rs.next() ? rs.getDouble(1) : 0.0));
                        break;
                    case 5:
                        map.put(5, (rs.next() ? rs.getDouble(1) : 0.0));
                        break;
                    case 6:
                        map.put(6, (rs.next() ? rs.getDouble(1) : 0.0));
                        break;
                    case 7:
                        map.put(7, (rs.next() ? rs.getDouble(1) : 0.0));
                        break;
                    case 8:
                        map.put(8, (rs.next() ? rs.getDouble(1) : 0.0));
                        break;
                    case 9:
                        map.put(9, (rs.next() ? rs.getDouble(1) : 0.0));
                        break;
                    case 10:
                        map.put(10, (rs.next() ? rs.getDouble(1) : 0.0));
                        break;
                    case 11:
                        map.put(11, (rs.next() ? rs.getDouble(1) : 0.0));
                        break;
                    case 12:
                        map.put(12, (rs.next() ? rs.getDouble(1) : 0.0));
                        break;
                }
            }

            return map;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public int getCountSellerByCategoryID(int categoryID) {
        try {
            String sql = "SELECT  sum(p.countBuy)\n"
                    + "       FROM Products p full outer join Categories c\n"
                    + "       on p.categoryID = c.categoryID\n"
                    + "       group by c.categoryID\n"
                    + "	   having c.categoryID = ?\n"
                    + "	   order by c.categoryID asc";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    @Override
    public int getTotalProductSeller() {
        try {
            String sql = "	   SELECT SUM(t.total)\n"
                    + "	   from (SELECT sum(p.countBuy) as 'total'\n"
                    + "       FROM Products p full outer join Categories c\n"
                    + "       on p.categoryID = c.categoryID\n"
                    + "       group by c.categoryID\n"
                    + "	   ) as t";
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

    @Override
    public HashMap<String, Integer> getQuantityProductForChart() {
        try {
            HashMap<String, Integer> map = new HashMap<>();
            for (int i = 1; i <= 6; i++) {
                String sql = "SELECT c.categoryName, SUM(p.quantity)\n"
                        + "  FROM [website].[dbo].[Products] p right join [website].[dbo].Categories c\n"
                        + "  on p.categoryID = c.categoryID\n"
                        + "  GROUP BY c.categoryName, c.categoryID\n"
                        + "  HAVING c.categoryID = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, i);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    map.put(rs.getString(1), rs.getInt(2));
                }
            }

            return map;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public HashMap<Integer, Integer> getSellerProductForChart(int categoryID, int year) {
        try {
            HashMap<Integer, Integer> map = new HashMap<>();
            for (int i = 1; i <= 12; i++) {
                String sql = "SELECT SUM(distinct p.countBuy)\n"
                        + "FROM Products p right join OrderLines ol\n"
                        + "on p.productID = ol.productID right join Orders o\n"
                        + "on o.orderID = ol.orderID inner join Categories c\n"
                        + "on c.categoryID = p.categoryID\n"
                        + "group by p.categoryID, o.orderCreatedAt\n"
                        + "HAVING month(o.orderCreatedAt) in (?) and p.categoryID = ? AND YEAR(o.orderCreatedAt) = ?";

                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setInt(2, categoryID);
                st.setInt(3, year);
                ResultSet rs = st.executeQuery();
                switch (i) {
                    case 1:
                        map.put(1, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 2:
                        map.put(2, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 3:
                        map.put(3, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 4:
                        map.put(4, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 5:
                        map.put(5, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 6:
                        map.put(6, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 7:
                        map.put(7, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 8:
                        map.put(8, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 9:
                        map.put(9, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 10:
                        map.put(10, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 11:
                        map.put(11, (rs.next() ? rs.getInt(1) : 0));
                        break;
                    case 12:
                        map.put(12, (rs.next() ? rs.getInt(1) : 0));
                        break;
                }
            }

            return map;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    @Override
    public List<Product> getProductByPrice(double from, double to) {
        try {
            String sql = "SELECT p.[productID]\n"
                    + "      ,p.[producerID]\n"
                    + "      ,p.[categoryID]\n"
                    + "      ,p.[productName]\n"
                    + "      ,p.[productMetaTitle]\n"
                    + "      ,p.[summary]\n"
                    + "      ,p.[SKU]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[countBuy]\n"
                    + "      ,p.[size]\n"
                    + "      ,p.[screen]\n"
                    + "      ,p.[camera]\n"
                    + "      ,p.[cameraSelfie]\n"
                    + "      ,p.[CPU]\n"
                    + "      ,p.[memory]\n"
                    + "      ,p.[RAM]\n"
                    + "      ,p.[hardDrive]\n"
                    + "      ,p.[card]\n"
                    + "      ,p.[weight]\n"
                    + "      ,p.[warranty]\n"
                    + "      ,p.[productCreateAt]\n"
                    + "      ,p.[productUpdateAt]\n"
                    + "      ,p.[productSaleStartAt]\n"
                    + "      ,p.[productSaleEndAt]\n"
                    + "      ,c.[categoryName]\n"
                    + "      ,c.[categoryParentID]\n"
                    + "      ,c.[categoryMetaTitle]\n"
                    + "      ,c.[categoryCreateAt]\n"
                    + "      ,c.[categoryUpDATEAt]\n"
                    + "      ,pc.[producerName]\n"
                    + "      ,pc.[producerMeta]\n"
                    + "      ,pc.[Country]\n"
                    + "      ,pcolor.[color1]\n"
                    + "      ,pcolor.[color2]\n"
                    + "      ,pcolor.[color3]\n"
                    + "      ,pcolor.[color4]\n"
                    + "      ,pcolor.[color5]\n"
                    + "      ,pimage.[image1]\n"
                    + "      ,pimage.[image2]\n"
                    + "      ,pimage.[image3]\n"
                    + "      ,pimage.[image4]\n"
                    + "      ,pimage.[image5]\n"
                    + "     FROM [website].[dbo].[Products] p inner join [website].[dbo].[Categories] c\n"
                    + "     ON p.categoryID =c.categoryID inner join [website].[dbo].[Producers] pc\n"
                    + "     ON p.producerID = pc.producerID inner join [website].[dbo].[ProductColor] pcolor\n"
                    + "     ON p.productID = pcolor.productID inner join [website].[dbo].[ProductImages] pimage\n"
                    + "     ON p.productID= pimage.productID\n"
                    + "     WHERE p.price BETWEEN ? AND ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, from);
            st.setDouble(2, to);
            ResultSet rs = st.executeQuery();
            List<Product> listP = new ArrayList<>();

            while (rs.next()) {
                Category category = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getInt("categoryParentID"),
                        rs.getString("categoryMetaTitle"), rs.getDate("categoryCreateAt"), rs.getDate("categoryUpDATEAt"));

                Producer producer = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("producerMeta"), rs.getString("Country"));

                ProductColor productColor = new ProductColor(rs.getInt("productID"), rs.getString("color1"), rs.getString("color2"),
                        rs.getString("color3"), rs.getString("color4"), rs.getString("color5"));

                ProductImage productImage = new ProductImage(rs.getInt("productID"), rs.getString("image1"), rs.getString("image2"),
                        rs.getString("image3"), rs.getString("image4"), rs.getString("image5"));

                Product product = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("productMetaTitle"), rs.getString("summary"),
                        rs.getString("SKU"), rs.getDouble("price"), rs.getDouble("discount"), rs.getInt("quantity"), rs.getInt("countBuy"),
                        rs.getString("size"), rs.getString("screen"), rs.getString("camera"), rs.getString("cameraSelfie"), rs.getString("CPU"),
                        rs.getString("memory"), rs.getString("RAM"), rs.getString("hardDrive"), rs.getString("card"), rs.getString("weight"),
                        rs.getInt("warranty"), rs.getDate("productCreateAt"), rs.getDate("productUpdateAt"), rs.getDate("productSaleStartAt"),
                        rs.getDate("productSaleEndAt"), productImage, productColor, producer, category);

                listP.add(product);
            }
            return listP;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Product> getTop5ProductSellerByProducer(int producerID, int categoryID) {
        PreparedStatement st = null;
        ResultSet rs = null;
        List<Product> listP = new ArrayList<>();
        try {
            String sql = "SELECT TOP(5) p.[productID]\n"
                    + "      ,p.[producerID]\n"
                    + "      ,p.[categoryID]\n"
                    + "      ,p.[productName]\n"
                    + "      ,p.[productMetaTitle]\n"
                    + "      ,p.[summary]\n"
                    + "      ,p.[SKU]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[countBuy]\n"
                    + "      ,p.[size]\n"
                    + "      ,p.[screen]\n"
                    + "      ,p.[camera]\n"
                    + "      ,p.[cameraSelfie]\n"
                    + "      ,p.[CPU]\n"
                    + "      ,p.[memory]\n"
                    + "      ,p.[RAM]\n"
                    + "      ,p.[hardDrive]\n"
                    + "      ,p.[card]\n"
                    + "      ,p.[weight]\n"
                    + "      ,p.[warranty]\n"
                    + "      ,p.[productCreateAt]\n"
                    + "      ,p.[productUpdateAt]\n"
                    + "      ,p.[productSaleStartAt]\n"
                    + "      ,p.[productSaleEndAt]\n"
                    + "      ,c.[categoryName]\n"
                    + "      ,c.[categoryParentID]\n"
                    + "      ,c.[categoryMetaTitle]\n"
                    + "      ,c.[categoryCreateAt]\n"
                    + "      ,c.[categoryUpDATEAt]\n"
                    + "      ,pc.[producerName]\n"
                    + "      ,pc.[producerMeta]\n"
                    + "      ,pc.[Country]\n"
                    + "      ,pcolor.[color1]\n"
                    + "      ,pcolor.[color2]\n"
                    + "      ,pcolor.[color3]\n"
                    + "      ,pcolor.[color4]\n"
                    + "      ,pcolor.[color5]\n"
                    + "      ,pimage.[image1]\n"
                    + "      ,pimage.[image2]\n"
                    + "      ,pimage.[image3]\n"
                    + "      ,pimage.[image4]\n"
                    + "      ,pimage.[image5]\n"
                    + "     FROM [website].[dbo].[Products] p inner join [website].[dbo].[Categories] c\n"
                    + "     ON p.categoryID =c.categoryID inner join [website].[dbo].[Producers] pc\n"
                    + "     ON p.producerID = pc.producerID inner join [website].[dbo].[ProductColor] pcolor\n"
                    + "     ON p.productID = pcolor.productID inner join [website].[dbo].[ProductImages] pimage\n"
                    + "     ON p.productID= pimage.productID\n"
                    + "     WHERE 1=1";
            if (categoryID != 0) {
                sql += " AND p.categoryID = " + categoryID;
            }

            if (producerID != 0) {
                sql += " AND p.producerID = " + producerID;

            }
            sql += "\nORDER BY p.countBuy DESC";
            st = connection.prepareStatement(sql);

            rs = st.executeQuery();

            while (rs.next()) {
                Category category = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getInt("categoryParentID"),
                        rs.getString("categoryMetaTitle"), rs.getDate("categoryCreateAt"), rs.getDate("categoryUpDATEAt"));

                Producer producer = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("producerMeta"), rs.getString("Country"));

                ProductColor productColor = new ProductColor(rs.getInt("productID"), rs.getString("color1"), rs.getString("color2"),
                        rs.getString("color3"), rs.getString("color4"), rs.getString("color5"));

                ProductImage productImage = new ProductImage(rs.getInt("productID"), rs.getString("image1"), rs.getString("image2"),
                        rs.getString("image3"), rs.getString("image4"), rs.getString("image5"));

                Product product = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("productMetaTitle"), rs.getString("summary"),
                        rs.getString("SKU"), rs.getDouble("price"), rs.getDouble("discount"), rs.getInt("quantity"), rs.getInt("countBuy"),
                        rs.getString("size"), rs.getString("screen"), rs.getString("camera"), rs.getString("cameraSelfie"), rs.getString("CPU"),
                        rs.getString("memory"), rs.getString("RAM"), rs.getString("hardDrive"), rs.getString("card"), rs.getString("weight"),
                        rs.getInt("warranty"), rs.getDate("productCreateAt"), rs.getDate("productUpdateAt"), rs.getDate("productSaleStartAt"),
                        rs.getDate("productSaleEndAt"), productImage, productColor, producer, category);

                listP.add(product);
            }
            return listP;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
