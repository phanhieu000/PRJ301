package com.mywebsite.DAO.account;

import com.mywebsite.DAO.dao.DBContext;
import com.mywebsite.DAO.interfaces.IAccountAdminDAO;
import com.mywebsite.model.Country;
import com.mywebsite.model.Information;
import com.mywebsite.model.admin.AccountAdmin;
import com.mywebsite.model.admin.Action;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AccountAdminDAO extends DBContext implements IAccountAdminDAO {

    @Override
    public AccountAdmin checkLogin(String userName, String password) {
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
                    + "				,ct.[countryName]\n"
                    + "				,ct.[location]\n"
                    + "                         ,i.[birthday]\n"
                    + "                         ,i.[phone]\n"
                    + "                         ,i.[gender]\n"
                    + "                         ,i.[status]\n"
                    + "                         ,ac.[adminID]\n"
                    + "                         ,ac.[adminRole]\n"
                    + "                         ,ac.[insertProduct]\n"
                    + "                         ,ac.[updateProduct]\n"
                    + "                         ,ac.[deleteProduct]\n"
                    + "                         ,ac.[viewProduct]\n"
                    + "                         ,ac.[updateAccount]\n"
                    + "                         ,ac.[deleteAccount]\n"
                    + "                         ,ac.[viewAccount]\n"
                    + "                         ,ac.[addAction]\n"
                    + "                         ,ac.[dateStartAt]\n"
                    + "                         ,ac.[dateEndAt]\n"
                    + "                     FROM [dbo].[Accounts] a inner join [dbo].Informations i\n"
                    + "                     ON a.accountID = i.accountID inner join [dbo].Countries ct\n"
                    + "                     ON i.countryID = ct.countryID inner join [dbo].ADMIN_Action aa\n"
                    + "                     ON a.accountID = aa.accountID inner join [dbo].Actions ac\n"
                    + "                     ON aa.adminID = ac.adminID"
                    + "                     WHERE a.userName = ? AND a.password = ?";

            st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            rs = st.executeQuery();

            if (rs.next()) {
                Country country = new Country(rs.getInt("countryID"), rs.getString("countryName"), rs.getString("location"));

                Information information = new Information(rs.getInt("accountID"), rs.getString("firstName"), rs.getString("lastName"),
                        rs.getString("avatar"), rs.getString("address"),
                        rs.getDate("birthday"), rs.getString("phone"), rs.getInt("gender"), rs.getString("status"), country);

                Action action = new Action(rs.getInt("adminID"), rs.getString("adminRole"), rs.getBoolean("insertProduct"),
                        rs.getBoolean("updateProduct"), rs.getBoolean("deleteProduct"), rs.getBoolean("viewProduct"),
                        rs.getBoolean("updateAccount"), rs.getBoolean("deleteAccount"), rs.getBoolean("viewAccount"),
                        rs.getBoolean("addAction"), rs.getDate("dateStartAt"), rs.getDate("dateEndAt"));

                AccountAdmin account = new AccountAdmin(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getDate("registeredAt"), rs.getDate("lastLogin"), information, action);
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
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

    @Override
    public List<AccountAdmin> getAll() {
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
                    + "				,ct.[countryName]\n"
                    + "				,ct.[location]\n"
                    + "                         ,i.[birthday]\n"
                    + "                         ,i.[phone]\n"
                    + "                         ,i.[gender]\n"
                    + "                         ,i.[status]\n"
                    + "                         ,ac.[adminID]\n"
                    + "                         ,ac.[adminRole]\n"
                    + "                         ,ac.[insertProduct]\n"
                    + "                         ,ac.[updateProduct]\n"
                    + "                         ,ac.[deleteProduct]\n"
                    + "                         ,ac.[viewProduct]\n"
                    + "                         ,ac.[updateAccount]\n"
                    + "                         ,ac.[deleteAccount]\n"
                    + "                         ,ac.[viewAccount]\n"
                    + "                         ,ac.[addAction]\n"
                    + "                         ,ac.[dateStartAt]\n"
                    + "                         ,ac.[dateEndAt]\n"
                    + "                     FROM [dbo].[Accounts] a inner join [dbo].Informations i\n"
                    + "                     ON a.accountID = i.accountID inner join [dbo].Countries ct\n"
                    + "                     ON i.countryID = ct.countryID inner join [dbo].ADMIN_Action aa\n"
                    + "                     ON a.accountID = aa.accountID inner join [dbo].Actions ac\n"
                    + "                     ON aa.adminID = ac.adminID";

            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            List<AccountAdmin> list = new ArrayList<>();
            while (rs.next()) {
                Country country = new Country(rs.getInt("countryID"), rs.getString("countryName"), rs.getString("location"));

                Information information = new Information(rs.getInt("accountID"), rs.getString("firstName"), rs.getString("lastName"),
                        rs.getString("avatar"), rs.getString("address"),
                        rs.getDate("birthday"), rs.getString("phone"), rs.getInt("gender"), rs.getString("status"), country);

                Action action = new Action(rs.getInt("adminID"), rs.getString("adminRole"), rs.getBoolean("insertProduct"),
                        rs.getBoolean("updateProduct"), rs.getBoolean("deleteProduct"), rs.getBoolean("viewProduct"),
                        rs.getBoolean("updateAccount"), rs.getBoolean("deleteAccount"), rs.getBoolean("viewAccount"),
                        rs.getBoolean("addAction"), rs.getDate("dateStartAt"), rs.getDate("dateEndAt"));

                AccountAdmin account = new AccountAdmin(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getDate("registeredAt"), rs.getDate("lastLogin"), information, action);
                list.add(account);
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

    @Override
    public boolean changePassword(AccountAdmin account) {
        PreparedStatement st = null;

        try {
            String sql = "UPDATE [dbo].[Accounts]\n"
                    + "   SET \n"
                    + "      [password] = ?\n"
                    + "      \n"
                    + " WHERE [accountID] = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, account.getPassword());
            st.setInt(2, account.getAccountID());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
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
        }
        return true;
    }

    @Override
    public boolean update(AccountAdmin account) {
        PreparedStatement st = null;

        try {
            String sql = "UPDATE [dbo].[Accounts] SET [email] = ? WHERE [accountID] = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, account.getEmail());
            st.setInt(2, account.getAccountID());
            st.executeUpdate();

            String sql1 = "UPDATE [dbo].[Informations]\n"
                    + "   SET \n"
                    + "      [countryID] = ?\n"
                    + "      ,[firstName] = ?\n"
                    + "      ,[lastName] = ?\n"
                    + "      ,[address] = ?\n"
                    + "      ,[birthday] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[gender] = ?\n"
                    + " WHERE [accountID] = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, account.getInformation().getCountry().getCountryID());
            st1.setString(2, account.getInformation().getFirstName());
            st1.setString(3, account.getInformation().getLastName());
            st1.setString(4, account.getInformation().getAddress());
            st1.setDate(5, account.getInformation().getBirthDay());
            st1.setString(6, account.getInformation().getPhone());
            st1.setInt(7, account.getInformation().getGender());
            st1.setInt(8, account.getAccountID());
            st1.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
            return false;
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

        }
        return true;
    }

    @Override
    public void updateAvatar(int accountID, String avatar) {
        PreparedStatement st = null;
        
        try {
            
            String updateAvatar = "UPDATE [dbo].[Informations] SET [avatar] = ? WHERE accountID = ?";
            
            st = connection.prepareStatement(updateAvatar);
            st.setString(1, avatar);
            st.setInt(2, accountID);
            st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
