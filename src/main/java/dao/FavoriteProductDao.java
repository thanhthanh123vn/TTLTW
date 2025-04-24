package dao;


import object.FavoriteProducts;
import object.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FavoriteProductDao {

    private Connection conn;

    public FavoriteProductDao() {
        Utils utils = new Utils();
        conn = utils.getConnection();
    }

    // Thêm sản phẩm yêu thích
    public boolean addFavorite(FavoriteProducts fav) {
        String sql = "INSERT INTO FavoriteProducts (user_id, product_id) VALUES (?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, fav.getUserId());
            ps.setInt(2, fav.getProductId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // có thể log ra file nếu cần
        }
        return false;
    }

    // Xóa sản phẩm yêu thích
    public boolean deleteFavorite(int userId, int productId) {
        String sql = "DELETE FROM FavoriteProducts WHERE user_id = ? AND product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy danh sách sản phẩm yêu thích theo user
    public List<FavoriteProducts> getFavoritesByUser(int userId) {
        List<FavoriteProducts> list = new ArrayList<>();
        String sql = "SELECT * FROM FavoriteProducts WHERE user_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FavoriteProducts fav = new FavoriteProducts();
                fav.setId(rs.getInt("id"));
                fav.setUserId(rs.getInt("user_id"));
                fav.setProductId(rs.getInt("product_id"));
                fav.setAddedDate(rs.getString("added_date"));
                list.add(fav);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // (Tùy chọn) Cập nhật thông tin sản phẩm yêu thích nếu cần (hiếm khi dùng)
    public boolean updateFavorite(FavoriteProducts fav) {
        String sql = "UPDATE FavoriteProducts SET added_date = ? WHERE user_id = ? AND product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, fav.getAddedDate());
            ps.setInt(2, fav.getUserId());
            ps.setInt(3, fav.getProductId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public List<Product> getFavoriteListByUserId(int userId) {
        List<Product> list = new ArrayList<>();

            String sql = "SELECT p.* FROM favorite_products f JOIN products p ON f.product_id = p.id WHERE f.user_id = ?";
            try {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Product p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setPrice(rs.getDouble("price"));
                    p.setImage(rs.getString("image"));
                    list.add(p);
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        return list;
    }

}
