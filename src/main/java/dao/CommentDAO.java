package dao;

import object.Comment;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    private Connection connection;
    Utils utils;

    // Constructor với kết nối cơ sở dữ liệu
    public CommentDAO( ) {
         utils = new Utils();
        this.connection = utils.getConnection();
    }

    // Thêm comment mới
    public boolean addComment(Comment comment) throws SQLException {
        String query = "INSERT INTO Comment (product_id, user_id, content) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, comment.getProductId());
            stmt.setInt(2, comment.getUserId());
            stmt.setString(3, comment.getContent());
            int row =    stmt.executeUpdate();
         return row >0;
        }

    }

    // Lấy danh sách comment theo product ID
    public List<Comment> getCommentsByProductId(int productId) throws SQLException {
        List<Comment> comments = new ArrayList<>();
        String query = "SELECT * FROM Comment WHERE product_id = ? ORDER BY created_at DESC";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Comment comment = new Comment(
                            rs.getInt("id"),
                            rs.getInt("product_id"),
                            rs.getInt("user_id"),
                            rs.getString("content"),
                            rs.getString("created_at")
                    );
                    comments.add(comment);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return comments;
    }
}
