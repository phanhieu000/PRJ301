package com.mywebsite.DAO.product;

import com.mywebsite.DAO.dao.DBContext;
import com.mywebsite.DAO.interfaces.IOrderDAO;
import com.mywebsite.model.Account;
import com.mywebsite.model.Country;
import com.mywebsite.model.Information;
import com.mywebsite.model.Payment;
import com.mywebsite.model.order.Order;
import com.mywebsite.model.order.OrderLine;
import com.mywebsite.model.product.Category;
import com.mywebsite.model.product.CompanyShip;
import com.mywebsite.model.product.Producer;
import com.mywebsite.model.product.Product;
import com.mywebsite.model.product.ProductColor;
import com.mywebsite.model.product.ProductImage;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DBContext implements IOrderDAO {

    @Override
    public List<Order> getAll() {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            String selectOrder = "SELECT  o.[orderID]\n"
                    + "      ,o.[accountID]\n"
                    + "      ,o.[paymentMethodID]\n"
                    + "      ,o.[companyShipID]\n"
                    + "      ,o.[status]\n"
                    + "      ,o.[totalMoney]\n"
                    + "      ,o.[orderDiscount]\n"
                    + "      ,o.[firstName]\n"
                    + "      ,o.[lastName]\n"
                    + "      ,o.[country]\n"
                    + "      ,o.[address]\n"
                    + "      ,o.[phone]\n"
                    + "      ,o.[orderNote]\n"
                    + "      ,o.[orderCreatedAt]\n"
                    + "      ,o.[orderUpdateAt]\n"
                    + "         ,a.[userName]\n"
                    + "         ,a.[password]\n"
                    + "         ,a.[Amount]\n"
                    + "         ,a.[email]\n"
                    + "         ,a.[registeredAt]\n"
                    + "         ,a.[lastLogin]\n"
                    + "         ,i.[firstName] as 'aFirstName'\n"
                    + "         ,i.[lastName] as 'aLastName'\n"
                    + "         ,i.[avatar]\n"
                    + "         ,i.[address] as 'aAddress'\n"
                    + "         ,i.[countryID]\n"
                    + "         ,ct.[countryName] \n"
                    + "         ,ct.[location]\n"
                    + "         ,i.[birthday]\n"
                    + "         ,i.[phone] as 'aPhone'\n"
                    + "         ,i.[gender]\n"
                    + "         ,i.[status] as 'aStatus'\n"
                    + "         ,pm.[methodName]\n"
                    + "         ,cs.[companyName]\n"
                    + "         ,cs.[feeShipping]\n"
                    + "  FROM [website].[dbo].[Orders] o inner join [dbo].[Accounts] a\n"
                    + "  ON o.accountID = a.accountID inner join [dbo].Informations i\n"
                    + "  ON a.accountID = i.accountID  inner join [dbo].Countries ct\n"
                    + "  ON i.countryID = ct.countryID inner join [website].[dbo].paymentMethods pm\n"
                    + "  ON o.paymentMethodID = pm.methodID inner join [website].[dbo].CompanyShip cs\n"
                    + "  ON o.companyShipID = cs.companyID\n"
                    + " ORDER BY o.orderCreatedAt DESC";

            st = connection.prepareStatement(selectOrder);
            rs = st.executeQuery();

            List<Order> list = new ArrayList<>();
            while (rs.next()) {

                Country country = new Country(rs.getInt("countryID"), rs.getString("countryName"), rs.getString("location"));

                Information information = new Information(rs.getInt("accountID"), rs.getString("aFirstName"), rs.getString("aLastName"),
                        rs.getString("avatar"), rs.getString("aAddress"),
                        rs.getDate("birthday"), rs.getString("aPhone"), rs.getInt("gender"), rs.getString("aStatus"), country);

                Account a = new Account(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getDate("registeredAt"), rs.getDate("lastLogin"), information);

                Payment payment = new Payment(rs.getInt("paymentMethodID"), rs.getString("methodName"));
                CompanyShip companyShip = new CompanyShip(rs.getInt("companyShipID"), rs.getString("companyName"), rs.getDouble("feeShipping"));
                Order order = new Order(rs.getInt("orderID"), a, payment, companyShip, rs.getInt("status"), rs.getDouble("totalMoney"),
                        rs.getDouble("orderDiscount"), rs.getString("firstName"), rs.getString("lastName"), rs.getString("country"), rs.getString("address"),
                        rs.getString("phone"), rs.getString("orderNote"), rs.getDate("orderCreatedAt"), rs.getDate("orderUpdateAt"));
                list.add(order);
            }
            return list;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<OrderLine> getOrderLineByOrderID(int orderID) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {

            String selectOrderLine = "SELECT ol.[orderID]\n"
                    + "                                                                 ,ol.[productID]\n"
                    + "                                                                 ,ol.[unitPrice] as 'orderLinePrice'\n"
                    + "                                                                 ,ol.[discount] as 'orderLineDiscount'\n"
                    + "                                                                 ,ol.[quantity] as 'orderLineQuantity'\n"
                    + "                                                                 ,ol.[color] as 'color'\n"
                    + "                                                                 ,p.[producerID]\n"
                    + "                                                                 ,p.[categoryID]\n"
                    + "                                                                 ,p.[productName]\n"
                    + "                                                                 ,p.[productMetaTitle]\n"
                    + "                                                                 ,p.[summary]\n"
                    + "                                                                 ,p.[SKU]\n"
                    + "                                                                 ,p.[price]\n"
                    + "                                                                 ,p.[discount]\n"
                    + "                                                                 ,p.[quantity]\n"
                    + "                                                                 ,p.[countBuy]\n"
                    + "                                                                 ,p.[size]\n"
                    + "                                                                 ,p.[screen]\n"
                    + "                                                                 ,p.[camera]\n"
                    + "                                                                 ,p.[cameraSelfie]\n"
                    + "                                                                 ,p.[CPU]\n"
                    + "                                                                 ,p.[memory]\n"
                    + "                                                                 ,p.[RAM]\n"
                    + "                                                                 ,p.[hardDrive]\n"
                    + "                                                                 ,p.[card]\n"
                    + "                                                                 ,p.[weight]\n"
                    + "                                                                 ,p.[warranty]\n"
                    + "                                                                 ,p.[productCreateAt]\n"
                    + "                                                                 ,p.[productUpdateAt]\n"
                    + "                                                                 ,p.[productSaleStartAt]\n"
                    + "                                                                 ,p.[productSaleEndAt]\n"
                    + "                                                                 ,c.[categoryName]\n"
                    + "                                                                 ,c.[categoryParentID]\n"
                    + "                                                                 ,c.[categoryMetaTitle]\n"
                    + "                                                                 ,c.[categoryCreateAt]\n"
                    + "                                                                 ,c.[categoryUpdateAt]\n"
                    + "                                                                 ,pc.[producerName]\n"
                    + "                                                                 ,pc.[producerMeta]\n"
                    + "                                                                 ,pc.[Country]\n"
                    + "                                                                 ,pcolor.[color1]\n"
                    + "                                                                 ,pcolor.[color2]\n"
                    + "                                                                 ,pcolor.[color3]\n"
                    + "                                                                 ,pcolor.[color4]\n"
                    + "                                                                 ,pcolor.[color5]\n"
                    + "                                                                 ,pimage.[image1]\n"
                    + "                                                                 ,pimage.[image2]\n"
                    + "                                                                 ,pimage.[image3]\n"
                    + "                                                                 ,pimage.[image4]\n"
                    + "                                              ,pimage.[image5]\n"
                    + "                                              ,o.[accountID]\n"
                    + "                          ,o.[paymentMethodID]\n"
                    + "                          ,o.[companyShipID]\n"
                    + "                          ,o.[status]\n"
                    + "                          ,o.[totalMoney]\n"
                    + "                          ,o.[orderDiscount]\n"
                    + "                          ,o.[firstName]\n"
                    + "                          ,o.[lastName]\n"
                    + "                          ,o.[country]\n"
                    + "                          ,o.[address]\n"
                    + "                          ,o.[phone]\n"
                    + "                          ,o.[orderNote]\n"
                    + "                          ,o.[orderCreatedAt]\n"
                    + "                          ,o.[orderUpdateAt]\n"
                    + "                             ,a.[userName]\n"
                    + "                             ,a.[password]\n"
                    + "                             ,a.[Amount]\n"
                    + "                             ,a.[email]\n"
                    + "                             ,a.[registeredAt]\n"
                    + "                             ,a.[lastLogin]\n"
                    + "                             ,i.[firstName] as 'aFirstName'\n"
                    + "                             ,i.[lastName] as 'aLastName'\n"
                    + "                             ,i.[avatar]\n"
                    + "                             ,i.[address] as 'aAddress'\n"
                    + "                             ,i.[countryID]\n"
                    + "                             ,ct.[countryName] \n"
                    + "                             ,ct.[location]\n"
                    + "                             ,i.[birthday]\n"
                    + "                             ,i.[phone] as 'aPhone'\n"
                    + "                             ,i.[gender]\n"
                    + "                             ,i.[status] as 'aStatus'\n"
                    + "                             ,pm.[methodName]\n"
                    + "                             ,cs.[companyName]\n"
                    + "                             ,cs.[feeShipping]\n"
                    + "                                          FROM  [website].[dbo].OrderLines ol inner join [website].[dbo].[Products] p \n"
                    + "                                          ON ol.productID = p.productID inner join [website].[dbo].[Categories] c\n"
                    + "                                          ON p.categoryID =c.categoryID inner join [website].[dbo].[Producers] pc\n"
                    + "                                          ON p.producerID = pc.producerID inner join [website].[dbo].[ProductColor] pcolor\n"
                    + "                                          ON p.productID = pcolor.productID inner join [website].[dbo].[ProductImages] pimage\n"
                    + "                                          ON p.productID = pimage.productID inner join [website].[dbo].[Orders]o\n"
                    + "                                          ON ol.orderID = o.orderID inner join [website].[dbo].paymentMethods pm\n"
                    + "                                          ON o.paymentMethodID = pm.methodID inner join [website].[dbo].CompanyShip cs\n"
                    + "                                          ON o.companyShipID = cs.companyID inner join [dbo].[Accounts] a\n"
                    + "                      ON o.accountID = a.accountID inner join [dbo].Informations i\n"
                    + "                      ON a.accountID = i.accountID  inner join [dbo].Countries ct\n"
                    + "                      ON i.countryID = ct.countryID\n"
                    + "             WHERE ol.orderID = ?";

            st = connection.prepareStatement(selectOrderLine);
            st.setInt(1, orderID);
            rs = st.executeQuery();

            List<OrderLine> listOrderLine = new ArrayList<>();
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

                Country country = new Country(rs.getInt("countryID"), rs.getString("countryName"), rs.getString("location"));

                Information information = new Information(rs.getInt("accountID"), rs.getString("aFirstName"), rs.getString("aLastName"),
                        rs.getString("avatar"), rs.getString("aAddress"),
                        rs.getDate("birthday"), rs.getString("aPhone"), rs.getInt("gender"), rs.getString("aStatus"), country);

                Account a = new Account(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getDate("registeredAt"), rs.getDate("lastLogin"), information);

                Payment payment = new Payment(rs.getInt("paymentMethodID"), rs.getString("methodName"));
                CompanyShip companyShip = new CompanyShip(rs.getInt("companyShipID"), rs.getString("companyName"), rs.getDouble("feeShipping"));
                Order order = new Order(rs.getInt("orderID"), a, payment, companyShip, rs.getInt("status"), rs.getDouble("totalMoney"),
                        rs.getDouble("orderDiscount"), rs.getString("firstName"), rs.getString("lastName"), rs.getString("country"), rs.getString("address"),
                        rs.getString("phone"), rs.getString("orderNote"), rs.getDate("orderCreatedAt"), rs.getDate("orderUpdateAt"));

                OrderLine orderLine = new OrderLine(order, rs.getDouble("orderLinePrice"), rs.getDouble("orderLineDiscount"), rs.getInt("orderLineQuantity"), rs.getString("color"), product);

                listOrderLine.add(orderLine);
            }
            return listOrderLine;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Order getOrderByOrderID(int orderID) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            String selectOrder = "SELECT  o.[orderID]\n"
                    + "      ,o.[accountID]\n"
                    + "      ,o.[paymentMethodID]\n"
                    + "      ,o.[companyShipID]\n"
                    + "      ,o.[status]\n"
                    + "      ,o.[totalMoney]\n"
                    + "      ,o.[orderDiscount]\n"
                    + "      ,o.[firstName]\n"
                    + "      ,o.[lastName]\n"
                    + "      ,o.[country]\n"
                    + "      ,o.[address]\n"
                    + "      ,o.[phone]\n"
                    + "      ,o.[orderNote]\n"
                    + "      ,o.[orderCreatedAt]\n"
                    + "      ,o.[orderUpdateAt]\n"
                    + "         ,a.[userName]\n"
                    + "         ,a.[password]\n"
                    + "         ,a.[Amount]\n"
                    + "         ,a.[email]\n"
                    + "         ,a.[registeredAt]\n"
                    + "         ,a.[lastLogin]\n"
                    + "         ,i.[firstName] as 'aFirstName'\n"
                    + "         ,i.[lastName] as 'aLastName'\n"
                    + "         ,i.[avatar]\n"
                    + "         ,i.[address] as 'aAddress'\n"
                    + "         ,i.[countryID]\n"
                    + "         ,ct.[countryName] \n"
                    + "         ,ct.[location]\n"
                    + "         ,i.[birthday]\n"
                    + "         ,i.[phone] as 'aPhone'\n"
                    + "         ,i.[gender]\n"
                    + "         ,i.[status] as 'aStatus'\n"
                    + "         ,pm.[methodName]\n"
                    + "         ,cs.[companyName]\n"
                    + "         ,cs.[feeShipping]\n"
                    + "  FROM [website].[dbo].[Orders] o inner join [dbo].[Accounts] a\n"
                    + "  ON o.accountID = a.accountID inner join [dbo].Informations i\n"
                    + "  ON a.accountID = i.accountID  inner join [dbo].Countries ct\n"
                    + "  ON i.countryID = ct.countryID inner join [website].[dbo].paymentMethods pm\n"
                    + "  ON o.paymentMethodID = pm.methodID inner join [website].[dbo].CompanyShip cs\n"
                    + "  ON o.companyShipID = cs.companyID\n"
                    + "  where o.orderID = ?";

            st = connection.prepareStatement(selectOrder);
            st.setInt(1, orderID);
            rs = st.executeQuery();

            while (rs.next()) {

                Country country = new Country(rs.getInt("countryID"), rs.getString("countryName"), rs.getString("location"));

                Information information = new Information(rs.getInt("accountID"), rs.getString("aFirstName"), rs.getString("aLastName"),
                        rs.getString("avatar"), rs.getString("aAddress"),
                        rs.getDate("birthday"), rs.getString("aPhone"), rs.getInt("gender"), rs.getString("aStatus"), country);

                Account a = new Account(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getDate("registeredAt"), rs.getDate("lastLogin"), information);

                Payment payment = new Payment(rs.getInt("paymentMethodID"), rs.getString("methodName"));
                CompanyShip companyShip = new CompanyShip(rs.getInt("companyShipID"), rs.getString("companyName"), rs.getDouble("feeShipping"));
                Order order = new Order(rs.getInt("orderID"), a, payment, companyShip, rs.getInt("status"), rs.getDouble("totalMoney"),
                        rs.getDouble("orderDiscount"), rs.getString("firstName"), rs.getString("lastName"), rs.getString("country"), rs.getString("address"),
                        rs.getString("phone"), rs.getString("orderNote"), rs.getDate("orderCreatedAt"), rs.getDate("orderUpdateAt"));
                return order;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void upadte(int orderID, int status) {
        try {

            String sql = "UPDATE [dbo].[Orders]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE orderID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, orderID);
            st.executeUpdate();

            if (status == 1) {
                List<OrderLine> list = getOrderLineByOrderID(orderID);
                for (OrderLine item : list) {
                    String sql1 = "UPDATE [dbo].[Products]\n"
                            + "   SET SKU = ?\n"
                            + "      ,quantity = quantity - ?\n"
                            + "      ,countBuy = countBuy + ?\n"
                            + " WHERE productID = ?";
                    PreparedStatement st1 = connection.prepareStatement(sql1);
                    st1.setString(1, item.getProduct().getQuantity() - item.getQuantity() > 0 ? "Còn Hàng" : "Hết Hàng");
                    st1.setInt(2, item.getQuantity());
                    st1.setInt(3, item.getQuantity());
                    st1.setInt(4, item.getProduct().getProductID());
                    st1.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    @Override
    public void delete(int orderID) {
        try {

            String sql = "DELETE FROM [dbo].[OrderLines]\n"
                    + "      WHERE orderID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            st.executeUpdate();

            String sql1 = "DELETE FROM [dbo].[Orders]\n"
                    + "      WHERE OrderID = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, orderID);
            st1.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public List<OrderLine> getOrderLineByAccountID(int accountID) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {

            String selectOrderLine = "SELECT ol.[orderID]\n"
                    + "                                                                 ,ol.[productID]\n"
                    + "                                                                 ,ol.[unitPrice] as 'orderLinePrice'\n"
                    + "                                                                 ,ol.[discount] as 'orderLineDiscount'\n"
                    + "                                                                 ,ol.[quantity] as 'orderLineQuantity'\n"
                    + "                                                                 ,ol.[color] as 'color'\n"
                    + "                                                                 ,p.[producerID]\n"
                    + "                                                                 ,p.[categoryID]\n"
                    + "                                                                 ,p.[productName]\n"
                    + "                                                                 ,p.[productMetaTitle]\n"
                    + "                                                                 ,p.[summary]\n"
                    + "                                                                 ,p.[SKU]\n"
                    + "                                                                 ,p.[price]\n"
                    + "                                                                 ,p.[discount]\n"
                    + "                                                                 ,p.[quantity]\n"
                    + "                                                                 ,p.[countBuy]\n"
                    + "                                                                 ,p.[size]\n"
                    + "                                                                 ,p.[screen]\n"
                    + "                                                                 ,p.[camera]\n"
                    + "                                                                 ,p.[cameraSelfie]\n"
                    + "                                                                 ,p.[CPU]\n"
                    + "                                                                 ,p.[memory]\n"
                    + "                                                                 ,p.[RAM]\n"
                    + "                                                                 ,p.[hardDrive]\n"
                    + "                                                                 ,p.[card]\n"
                    + "                                                                 ,p.[weight]\n"
                    + "                                                                 ,p.[warranty]\n"
                    + "                                                                 ,p.[productCreateAt]\n"
                    + "                                                                 ,p.[productUpdateAt]\n"
                    + "                                                                 ,p.[productSaleStartAt]\n"
                    + "                                                                 ,p.[productSaleEndAt]\n"
                    + "                                                                 ,c.[categoryName]\n"
                    + "                                                                 ,c.[categoryParentID]\n"
                    + "                                                                 ,c.[categoryMetaTitle]\n"
                    + "                                                                 ,c.[categoryCreateAt]\n"
                    + "                                                                 ,c.[categoryUpdateAt]\n"
                    + "                                                                 ,pc.[producerName]\n"
                    + "                                                                 ,pc.[producerMeta]\n"
                    + "                                                                 ,pc.[Country]\n"
                    + "                                                                 ,pcolor.[color1]\n"
                    + "                                                                 ,pcolor.[color2]\n"
                    + "                                                                 ,pcolor.[color3]\n"
                    + "                                                                 ,pcolor.[color4]\n"
                    + "                                                                 ,pcolor.[color5]\n"
                    + "                                                                 ,pimage.[image1]\n"
                    + "                                                                 ,pimage.[image2]\n"
                    + "                                                                 ,pimage.[image3]\n"
                    + "                                                                 ,pimage.[image4]\n"
                    + "                                              ,pimage.[image5]\n"
                    + "                                              ,o.[accountID]\n"
                    + "                          ,o.[paymentMethodID]\n"
                    + "                          ,o.[companyShipID]\n"
                    + "                          ,o.[status]\n"
                    + "                          ,o.[totalMoney]\n"
                    + "                          ,o.[orderDiscount]\n"
                    + "                          ,o.[firstName]\n"
                    + "                          ,o.[lastName]\n"
                    + "                          ,o.[country]\n"
                    + "                          ,o.[address]\n"
                    + "                          ,o.[phone]\n"
                    + "                          ,o.[orderNote]\n"
                    + "                          ,o.[orderCreatedAt]\n"
                    + "                          ,o.[orderUpdateAt]\n"
                    + "                             ,a.[userName]\n"
                    + "                             ,a.[password]\n"
                    + "                             ,a.[Amount]\n"
                    + "                             ,a.[email]\n"
                    + "                             ,a.[registeredAt]\n"
                    + "                             ,a.[lastLogin]\n"
                    + "                             ,i.[firstName] as 'aFirstName'\n"
                    + "                             ,i.[lastName] as 'aLastName'\n"
                    + "                             ,i.[avatar]\n"
                    + "                             ,i.[address] as 'aAddress'\n"
                    + "                             ,i.[countryID]\n"
                    + "                             ,ct.[countryName] \n"
                    + "                             ,ct.[location]\n"
                    + "                             ,i.[birthday]\n"
                    + "                             ,i.[phone] as 'aPhone'\n"
                    + "                             ,i.[gender]\n"
                    + "                             ,i.[status] as 'aStatus'\n"
                    + "                             ,pm.[methodName]\n"
                    + "                             ,cs.[companyName]\n"
                    + "                             ,cs.[feeShipping]\n"
                    + "                                          FROM  [website].[dbo].OrderLines ol inner join [website].[dbo].[Products] p \n"
                    + "                                          ON ol.productID = p.productID inner join [website].[dbo].[Categories] c\n"
                    + "                                          ON p.categoryID =c.categoryID inner join [website].[dbo].[Producers] pc\n"
                    + "                                          ON p.producerID = pc.producerID inner join [website].[dbo].[ProductColor] pcolor\n"
                    + "                                          ON p.productID = pcolor.productID inner join [website].[dbo].[ProductImages] pimage\n"
                    + "                                          ON p.productID = pimage.productID inner join [website].[dbo].[Orders]o\n"
                    + "                                          ON ol.orderID = o.orderID inner join [website].[dbo].paymentMethods pm\n"
                    + "                                          ON o.paymentMethodID = pm.methodID inner join [website].[dbo].CompanyShip cs\n"
                    + "                                          ON o.companyShipID = cs.companyID inner join [dbo].[Accounts] a\n"
                    + "                      ON o.accountID = a.accountID inner join [dbo].Informations i\n"
                    + "                      ON a.accountID = i.accountID  inner join [dbo].Countries ct\n"
                    + "                      ON i.countryID = ct.countryID\n"
                    + "             WHERE o.accountID = ?"
                    + "             ORDER BY orderCreatedAt DESC";

            st = connection.prepareStatement(selectOrderLine);
            st.setInt(1, accountID);
            rs = st.executeQuery();

            List<OrderLine> listOrderLine = new ArrayList<>();
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

                Country country = new Country(rs.getInt("countryID"), rs.getString("countryName"), rs.getString("location"));

                Information information = new Information(rs.getInt("accountID"), rs.getString("aFirstName"), rs.getString("aLastName"),
                        rs.getString("avatar"), rs.getString("aAddress"),
                        rs.getDate("birthday"), rs.getString("aPhone"), rs.getInt("gender"), rs.getString("aStatus"), country);

                Account a = new Account(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getDate("registeredAt"), rs.getDate("lastLogin"), information);

                Payment payment = new Payment(rs.getInt("paymentMethodID"), rs.getString("methodName"));
                CompanyShip companyShip = new CompanyShip(rs.getInt("companyShipID"), rs.getString("companyName"), rs.getDouble("feeShipping"));
                Order order = new Order(rs.getInt("orderID"), a, payment, companyShip, rs.getInt("status"), rs.getDouble("totalMoney"),
                        rs.getDouble("orderDiscount"), rs.getString("firstName"), rs.getString("lastName"), rs.getString("country"), rs.getString("address"),
                        rs.getString("phone"), rs.getString("orderNote"), rs.getDate("orderCreatedAt"), rs.getDate("orderUpdateAt"));

                OrderLine orderLine = new OrderLine(order, rs.getDouble("orderLinePrice"), rs.getDouble("orderLineDiscount"), rs.getInt("orderLineQuantity"), rs.getString("color"), product);

                listOrderLine.add(orderLine);
            }
            return listOrderLine;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<OrderLine> getListByPage(List<OrderLine> list, int start, int end) {
        List<OrderLine> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

}
