    
package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

public class UserDAO{
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public UserDTO checkLogin(String username, String password){
       try{
           String sql = "SELECT * FROM USERS WHERE username = ? AND password = ?";
           con = new DBUtils().getConnection();
           ps = con.prepareStatement(sql);
           ps.setString(1, username);
           ps.setString(2, password);
           rs = ps.executeQuery();
            if(rs != null){
               if(rs.next()){
               UserDTO account = new UserDTO();
               account.setUsername(rs.getString("username"));
               account.setPassword(rs.getString("password"));
               return account;
               }
            }   
        }catch(SQLException ex){
            System.out.println("Error in login: " + ex.getMessage());
            ex.printStackTrace();
       }
       return null;
    }
    
    
    public UserDTO signUp(String username , String password){
        String sql = "INSERT INTO USERS(username , password) VALUES(?, ?)";
        try{
            con = new DBUtils().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
        }catch(SQLException ex){
          ex.printStackTrace();
          throw new RuntimeException(ex);
        }
        return null;
    }
    
    
    
    
    public UserDTO checkAccountExist(String username) {
        String sql = "SELECT * FROM USERS WHERE username = ?";
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    UserDTO account = new UserDTO();
                    account.setUsername(rs.getString("username"));
                    account.setPassword(rs.getString("password"));
                    return account;
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error in checking account existence: " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
    
    public UserDTO checkAdmin(String username, String password, boolean is_admin){
       try{
           String sql = "SELECT * FROM USERS WHERE username = ? AND password = ? AND is_admin = ?";
           con = new DBUtils().getConnection();
           ps = con.prepareStatement(sql);
           ps.setString(1, username);
           ps.setString(2, password);
           ps.setBoolean(3, is_admin);
           rs = ps.executeQuery();
            if(rs != null){
               if(rs.next()){
               UserDTO account = new UserDTO();
               account.setUsername(rs.getString("username"));
               account.setPassword(rs.getString("password"));
               
               boolean userAdmin = rs.getBoolean("is_admin");
                    if(userAdmin == is_admin){
                        account.setIs_admin(userAdmin);
                        return account;
                    }
               }
            }   
        }catch(SQLException ex){
            System.out.println("Error in login: " + ex.getMessage());
            ex.printStackTrace();
       }
       return null;
    }
    
}