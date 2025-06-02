package dao;

import object.ProductReview;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao {
    private static Utils utils;
    private static Connection conn;

    public ReviewDao() {
        utils = new Utils();
        conn = utils.getConnection();
    }

    public void closeConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /** Thêm 1 đánh giá mới vào DB */
    public boolean addReview(ProductReview review) {
        String sql = "INSERT INTO ProductReview(userId, productId, rating, comment, reviewDate) "
                + "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, review.getUserId());
            ps.setInt(2, review.getProductId());
            ps.setInt(3, review.getRating());
            ps.setString(4, review.getComment());
            ps.setTimestamp(5, review.getReviewDate());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /** Lấy tất cả đánh giá của 1 sản phẩm (theo productId) */
    public List<ProductReview> getReviewsByProductId(int productId) {
        List<ProductReview> reviews = new ArrayList<>();
        String sql = "SELECT pr.*, u.username FROM ProductReview pr " +
                    "JOIN users u ON pr.userId = u.id " +
                    "WHERE pr.productId = ? ORDER BY pr.reviewDate DESC";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductReview r = new ProductReview();
                r.setId(rs.getInt("id"));
                r.setUserId(rs.getInt("userId"));
                r.setProductId(productId);
                r.setRating(rs.getInt("rating"));
                r.setComment(rs.getString("comment"));
                r.setReviewDate(rs.getTimestamp("reviewDate"));
                r.setUsername(rs.getString("username"));
                reviews.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reviews;
    }

    /**
     * Kiểm tra xem userId đã từng đánh giá productId chưa.
     */
    public boolean hasReviewed(int userId, int productId) {
        String sql = "SELECT COUNT(*) FROM ProductReview WHERE userId = ? AND productId = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Kiểm tra xem userId đã mua (và đã giao) productId chưa.
     */
    public boolean hasPurchased(int userId, int productId) {
        String sql =
                "SELECT COUNT(*) " +
                "FROM orders o JOIN orderdetails od ON o.OrderID = od.OrderID " +
                "WHERE o.UserID = ? AND od.ProductID = ? AND o.Status = 'Completed'";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /** Đóng connection khi không dùng nữa */
    public void close() {
        closeConnection();
    }
}
