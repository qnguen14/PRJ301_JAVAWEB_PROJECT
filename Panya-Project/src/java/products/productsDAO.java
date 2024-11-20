package products;

import com.sun.org.apache.bcel.internal.generic.SWITCH;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import user.UserDTO;
import utils.DBUtils;

public class productsDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<productsDTO> list(String keyword, String sortCol) {
        List<productsDTO> list = new ArrayList<>();
        try {
            con = new DBUtils().getConnection();
            String sql = "SELECT * FROM PRODUCTS";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE name LIKE ? OR category_name LIKE ?";
            }
            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC";
            }

            ps = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(1, "%" + keyword + "%");
                ps.setString(2, "%" + keyword + "%");
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                productsDTO product = new productsDTO();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                product.setCategory_name(rs.getString("category_name"));
                product.setIs_in_stock(rs.getBoolean("is_in_stock"));
                list.add(product);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
//    public List<productsDTO> getAllProduct() {
//        List<productsDTO> list = new ArrayList<>();
//        String sql = "SELECT * FROM PRODUCTS";
//        try {
//            con = DBUtils.getConnection();
//            ps = con.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                productsDTO product = new productsDTO(
//                        rs.getInt("id"),
//                        rs.getString("name"),
//                        rs.getString("description"),
//                        rs.getDouble("price"),
//                        rs.getString("image"),
//                        rs.getString("category_name"),
//                        rs.getBoolean("is_in_stock")
//                );
//                list.add(product);
//            }
//        } catch (SQLException ex) {
//            System.out.println("Error database: " + ex.getMessage());
//            ex.printStackTrace();
//        }
//        return list;
//    }

    public productsDTO getProductById(int id) { //dùng để tìm product
        productsDTO product = null;
        String sql = "SELECT * FROM PRODUCTS WHERE id = ?";
        try {
            con = DBUtils.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                product = new productsDTO(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getString("category_name"),
                        rs.getBoolean("is_in_stock")
                );
            }
        } catch (SQLException ex) {
            System.out.println("Error database: " + ex.getMessage());
            ex.printStackTrace();
        }
        return product;
    }

    public List<productsDTO> search(String keyword, String sortCol) {

        List<productsDTO> list = new ArrayList<productsDTO>();

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT * FROM PRODUCTS";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE id LIKE ?"
                        + " OR category_name LIKE ? OR description LIKE ? ";
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

                productsDTO product = new productsDTO();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                product.setCategory_name(rs.getString("category_name"));
                product.setIs_in_stock(rs.getBoolean("is_in_stock"));

                list.add(product);
            }

        } catch (SQLException ex) {

        }

        return list;
    }

    public Integer insert(productsDTO p) {

        String sql = "INSERT INTO PRODUCTS (name, description, price, image, category_name, is_in_stock) "
                + " VALUES(?, ?, ?, ?, ?, ?)";
        try {
            con = DBUtils.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getImage());
            ps.setString(5, p.getCategory_name());
            ps.setBoolean(6, p.getIs_in_stock());

            ps.executeUpdate();

            con.close();

            return p.getId();

        } catch (SQLException ex) {
            System.out.println("Insert error!" + ex.getMessage());
        }

        return null;
    }

    public boolean update(productsDTO product) {
        boolean check = false;
        String sql = " UPDATE PRODUCTS SET name = ? , description = ?, price = ?, image = ?, category_name = ?, is_in_stock = ?";
        sql += " WHERE id = ? ";
        try {
            con = DBUtils.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getImage());
            ps.setString(5, product.getCategory_name());
            ps.setBoolean(6, product.getIs_in_stock());
            ps.setInt(7, product.getId());

            check = ps.executeUpdate() > 0;
            con.close();

        } catch (SQLException e) {
            System.err.println("Update product error:" + e.getMessage());
            e.printStackTrace();
        }
        return check;
    }

    public boolean delete(Integer id) {
        String sql = " DELETE PRODUCTS ";
        sql += " WHERE id = ? ";
        try {
            con = DBUtils.getConnection();
            ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeQuery();
            con.close();
            return true;
        } catch (SQLException e) {
            System.err.println("Delete product error:" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public productsDTO load(int id) {

        String sql = "SELECT * FROM PRODUCTS";
        sql += " WHERE id = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                String name = rs.getString("name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                String category_name = rs.getString("category_name");
                boolean status = rs.getBoolean("is_in_stock");

                productsDTO product = new productsDTO();
                product.setId(id);
                product.setName(name);
                product.setDescription(description);
                product.setPrice(price);
                product.setImage(image);
                product.setCategory_name(category_name);
                product.setIs_in_stock(status);

                return product;
            }
        } catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public List<productsDTO> listProductSearch(String search) throws SQLException {
        List<productsDTO> listProduct = new ArrayList<productsDTO>();

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT * FROM PRODUCTS WHERE name LIKE ? ";
            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + search + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    productsDTO product = new productsDTO();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImage(rs.getString("image"));
                    product.setCategory_name(rs.getString("category_name"));
                    product.setIs_in_stock(rs.getBoolean("is_in_stock"));

                    listProduct.add(product);
                }

            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listProduct;
    }
}
