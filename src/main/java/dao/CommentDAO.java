package dao;

import object.Comment;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    private Connection connection;
    Utils utils;
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");

    // Constructor với kết nối cơ sở dữ liệu
    public CommentDAO() {
        utils = new Utils();
        this.connection = utils.getConnection();
    }

    // Thêm comment mới
    public boolean addComment(Comment comment) throws SQLException {
        String query = "INSERT INTO comment (product_id, user_id, content, name, created_at) VALUES (?, ?, ?, ?, NOW())";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, comment.getProductId());
            stmt.setInt(2, comment.getUserId());
            stmt.setString(3, comment.getContent());
            stmt.setString(4, comment.getUsername());
            int row = stmt.executeUpdate();
            return row > 0;
        }
    }

    // Lấy danh sách comment theo product ID
    public List<Comment> getCommentsByProductId(int productId) throws SQLException {
        List<Comment> comments = new ArrayList<>();
        String query = "SELECT c.*, u.username FROM comment c " +
                      "JOIN users u ON c.user_id = u.id " +
                      "WHERE c.product_id = ? ORDER BY c.created_at DESC";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Comment comment = new Comment();
                    comment.setId(rs.getInt("id"));
                    comment.setProductId(rs.getInt("product_id"));
                    comment.setUserId(rs.getInt("user_id"));
                    comment.setContent(rs.getString("content"));
                    
                    // Format date từ Timestamp sang String
                    Timestamp timestamp = rs.getTimestamp("created_at");
                    String formattedDate = dateFormat.format(timestamp);
                    comment.setCreatedAt(formattedDate);
                    
                    comment.setUsername(rs.getString("name"));
                    comments.add(comment);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return comments;
    }

    // Đóng kết nối
    public void close() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
