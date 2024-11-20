/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ordersDAO {
    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<ordersDTO> search(String keyword, String sortCol) {
        
        List<ordersDTO> list = new ArrayList<ordersDTO>();
        
        try {
            con = DBUtils.getConnection();
            String sql = "SELECT * FROM ORDERS";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE id LIKE ?"
                        + " OR status LIKE ? OR order_type LIKE ? ";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC ";
            }

            ps = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(1, "%" + keyword + "%");
                ps.setString(2, "%" + keyword + "%");
                ps.setString(3, "%" + keyword + "%");
            }

            rs = ps.executeQuery();

            while (rs.next()) {

                if (list == null) {
                    list = new ArrayList<>();
                }

                ordersDTO order = new ordersDTO();
                order.setId(rs.getInt("id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setOrder_date(rs.getString("order_date"));
                order.setOrder_type(rs.getString("order_type"));
                order.setStatus(rs.getString("status"));
                order.setTotal_price(rs.getDouble("total_price"));
                order.setCreated_at(rs.getString("created_at"));
                
                list.add(order);
            }

        } catch (SQLException ex) {

        }

        return list;
    }
    
    public boolean delete(Integer id) {
        String sql = " DELETE ORDERS ";
        sql += " WHERE id = ? ";
        try {
            con = DBUtils.getConnection();
            ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeQuery();
            con.close();
            
            return true;
            
            
        } catch (SQLException e) {
            System.err.println("Delete order error:" + e.getMessage());
        }
        return false;
    }
    
}
