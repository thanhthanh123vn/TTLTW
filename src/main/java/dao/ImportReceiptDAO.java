package dao;


import object.ImportReceipt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ImportReceiptDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ImportReceiptDAO() {
        conn = null;
        ps = null;
        rs = null;
    }

    public int createImportReceipt(ImportReceipt receipt) throws SQLException {
        String query = "INSERT INTO import_receipts (import_date, supplier_id, note, total_amount) VALUES (?, ?, ?, ?)";
        try {
            conn = new Utils().getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setTimestamp(1, receipt.getImportDate());
            ps.setInt(2, receipt.getSupplierId());
            ps.setString(3, receipt.getNote());
            ps.setDouble(4, receipt.getTotalAmount());
            
            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating import receipt failed, no rows affected.");
            }

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating import receipt failed, no ID obtained.");
                }
            }
        } finally {
            closeResources();
        }
    }

    public ImportReceipt getImportReceiptById(int id) throws SQLException {
        String query = "SELECT * FROM import_receipts WHERE id = ?";
        try {
            conn = new Utils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                ImportReceipt receipt = new ImportReceipt();
                receipt.setId(rs.getInt("id"));
                receipt.setImportDate(rs.getTimestamp("import_date"));
                receipt.setSupplierId(rs.getInt("supplier_id"));
                receipt.setNote(rs.getString("note"));
                receipt.setTotalAmount(rs.getDouble("total_amount"));
                return receipt;
            }
            return null;
        } finally {
            closeResources();
        }
    }

    public List<ImportReceipt> getAllImportReceipts() throws SQLException {
        String query = "SELECT * FROM import_receipts ORDER BY import_date DESC";
        List<ImportReceipt> receipts = new ArrayList<>();
        try {
            conn = new Utils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                ImportReceipt receipt = new ImportReceipt();
                receipt.setId(rs.getInt("id"));
                receipt.setImportDate(rs.getTimestamp("import_date"));
                receipt.setSupplierId(rs.getInt("supplier_id"));
                receipt.setNote(rs.getString("note"));
                receipt.setTotalAmount(rs.getDouble("total_amount"));
                receipts.add(receipt);
            }
            return receipts;
        } finally {
            closeResources();
        }
    }

    public int getTotalProductsByReceiptId(int receiptId) throws SQLException {
        String query = "SELECT COUNT(*) as total FROM import_receipt_details WHERE import_receipt_id = ?";
        try {
            conn = new Utils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, receiptId);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                return rs.getInt("total");
            }
            return 0;
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