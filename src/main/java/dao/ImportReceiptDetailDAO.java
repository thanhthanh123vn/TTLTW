package dao;


import object.ImportReceiptDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ImportReceiptDetailDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ImportReceiptDetailDAO() {
        conn = null;
        ps = null;
        rs = null;
    }

    public void createImportReceiptDetail(ImportReceiptDetail detail) throws SQLException {
        String query = "INSERT INTO import_receipt_details (import_receipt_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
        try {
            conn = new Utils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, detail.getImportReceiptId());
            ps.setInt(2, detail.getProductId());
            ps.setInt(3, detail.getQuantity());
            ps.setDouble(4, detail.getPrice());
            ps.executeUpdate();
        } finally {
            closeResources();
        }
    }

    public List<ImportReceiptDetail> getDetailsByReceiptId(int receiptId) throws SQLException {
        String query = "SELECT * FROM import_receipt_details WHERE import_receipt_id = ?";
        List<ImportReceiptDetail> details = new ArrayList<>();
        try {
            conn = new Utils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, receiptId);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                ImportReceiptDetail detail = new ImportReceiptDetail();
                detail.setId(rs.getInt("id"));
                detail.setImportReceiptId(rs.getInt("import_receipt_id"));
                detail.setProductId(rs.getInt("product_id"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setPrice(rs.getDouble("price"));
                details.add(detail);
            }
            return details;
        } finally {
            closeResources();
        }
    }

    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} 