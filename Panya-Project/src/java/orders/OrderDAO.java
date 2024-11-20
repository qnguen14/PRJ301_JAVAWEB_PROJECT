package orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import orders.Cart;
import orders.ItemDTO;
import utils.DBUtils;

public class OrderDAO {
    private Connection connection;

    public OrderDAO(Connection connection) {
        this.connection = connection;
    }

    public OrderDAO() {
    }
    
    
    public void addOrder(int userId, Cart cart) throws SQLException {
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connection.setAutoCommit(false);

            // Insert into ORDERS table
            String insertOrderQuery = "INSERT INTO ORDERS (user_id, order_type, status, total_price) VALUES (?, ?, ?, ?)";
            stmt = connection.prepareStatement(insertOrderQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, userId);
            stmt.setString(2, "Online");
            stmt.setString(3, "Pending");
            stmt.setDouble(4, cart.getTotalMoney());
            int affectedRows = stmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }

            // Retrieve the generated order_id
            rs = stmt.getGeneratedKeys();
            int orderId = -1;
            if (rs.next()) {
                orderId = rs.getInt(1);
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }

            // Insert into ORDER_ITEMS table
            String insertOrderItemQuery = "INSERT INTO ORDER_ITEMS (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            stmt = connection.prepareStatement(insertOrderItemQuery);
            for (ItemDTO item : cart.getItems()) {
                stmt.setInt(1, orderId);
                stmt.setInt(2, item.getProduct().getId());
                stmt.setInt(3, item.getQuantity());
                stmt.setDouble(4, item.getPrice());
                stmt.addBatch();
            }
            stmt.executeBatch();

            connection.commit();
        } catch (SQLException e) {
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            throw e; // Re-throw the exception to handle it in the caller method
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (rs != null) {
                    rs.close();
                }
                connection.setAutoCommit(true);
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
    }
    
        public void insertOrderItem(int productId, int quantity, double price) throws SQLException {
        PreparedStatement stmt = null;

        try {
            String insertOrderItemQuery = "INSERT INTO ORDER_ITEMS (product_id, quantity, price) VALUES (?, ?, ?)";
            stmt = connection.prepareStatement(insertOrderItemQuery);
            stmt.setInt(1, productId);
            stmt.setInt(2, quantity);
            stmt.setDouble(3, price);
            stmt.executeUpdate();
        } finally {
            if (stmt != null) {
                stmt.close();
            }
        }
    }
        
    public List<OrderItemDTO> getAllOrderItems() throws SQLException {
        List<OrderItemDTO> orderItems = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM ORDER_ITEMS";
            stmt = connection.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int itemId = rs.getInt("id");
                int orderId = rs.getInt("order_id");
                int productId = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");

                // Tạo một đối tượng OrderItemDTO và thêm vào danh sách
                OrderItemDTO item = new OrderItemDTO(itemId, orderId, productId, quantity, price);
                orderItems.add(item);
            }
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return orderItems;
    } 
    
    public List<OrderItemDTO> search(String keyword, String sortCol) {
        
        List<OrderItemDTO> list = new ArrayList<OrderItemDTO>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            connection = DBUtils.getConnection();
            String sql = "SELECT id, order_id , product_id , quantity , price"
                    + " FROM ORDER_ITEMS";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE id LIKE ?"
                        + " OR order_id LIKE ? OR product_id LIKE ? ";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC ";
            }

            stmt = connection.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");
                stmt.setString(3, "%" + keyword + "%");
            }

            rs = stmt.executeQuery();

            while (rs.next()) {

                if (list == null) {
                    list = new ArrayList<>();
                }

                OrderItemDTO order = new OrderItemDTO();
                order.setId(rs.getInt("id"));
                order.setOrderId(rs.getInt("order_id"));
                order.setProductId(rs.getInt("product_id"));
                order.setQuantity(rs.getInt("quantity"));
                order.setPrice(rs.getDouble("price"));
                
                list.add(order);
            }

        } catch (SQLException ex) {

        }

        return list;
    }
}
