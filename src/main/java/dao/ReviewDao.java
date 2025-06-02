package dao;

import object.ProductReview;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao {
    private Connection conn;

    public ReviewDao() {
        // Khởi tạo connection qua Utils (giống các DAO khác)
        this.conn = new Utils().getConnection();
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
        String sql = "SELECT * FROM ProductReview WHERE productId = ? ORDER BY reviewDate DESC";
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
                reviews.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reviews;
    }

    /**
     * Kiểm tra xem userId đã từng đánh giá productId chưa.
     * Nếu đã có record thì return true, ngược lại false.
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
     * Giả sử bạn có bảng Orders (đơn) và OrderDetail (chi tiết đơn).
     * - Bảng Orders có cột status ENUM('Pending','Processing','Shipped','Completed','Cancelled'),
     *   trong đó 'Completed' hoặc 'Shipped' có thể hiểu là đã giao.
     * - Bảng OrderDetail lưu quan hệ orderId -> productId
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
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
