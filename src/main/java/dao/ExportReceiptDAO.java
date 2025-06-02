package dao;


import object.ExportReceipt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ExportReceiptDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ExportReceiptDAO() {
        try {
            conn = new Utils().getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int createExportReceipt(ExportReceipt receipt) {
        String query = "INSERT INTO export_receipts (export_date, customer_id, reason, total_amount, note) VALUES (?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setTimestamp(1, new Timestamp(receipt.getExportDate().getTime()));
            ps.setInt(2, receipt.getCustomerId());
            ps.setString(3, receipt.getReason());
            ps.setDouble(4, receipt.getTotalAmount());
            ps.setString(5, receipt.getNote());
            
            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating export receipt failed, no rows affected.");
            }

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating export receipt failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public List<ExportReceipt> getAllExportReceipts() {
        List<ExportReceipt> receipts = new ArrayList<>();
        String query = "SELECT er.*, c.name as customer_name FROM export_receipts er " +
                      "LEFT JOIN customers c ON er.customer_id = c.id " +
                      "ORDER BY er.export_date DESC";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ExportReceipt receipt = new ExportReceipt();
                receipt.setId(rs.getInt("id"));
                receipt.setExportDate(rs.getTimestamp("export_date"));
                receipt.setCustomerId(rs.getInt("customer_id"));
                receipt.setReason(rs.getString("reason"));
                receipt.setTotalAmount(rs.getDouble("total_amount"));
                receipt.setNote(rs.getString("note"));
                receipt.setCreatedAt(rs.getTimestamp("created_at"));
                receipt.setUpdatedAt(rs.getTimestamp("updated_at"));
                receipt.setCustomerName(rs.getString("customer_name"));
                receipts.add(receipt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return receipts;
    }

    public ExportReceipt getExportReceiptById(int id) {
        String query = "SELECT er.*, c.name as customer_name FROM export_receipts er " +
                      "LEFT JOIN customers c ON er.customer_id = c.id " +
                      "WHERE er.id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                ExportReceipt receipt = new ExportReceipt();
                receipt.setId(rs.getInt("id"));
                receipt.setExportDate(rs.getTimestamp("export_date"));
                receipt.setCustomerId(rs.getInt("customer_id"));
                receipt.setReason(rs.getString("reason"));
                receipt.setTotalAmount(rs.getDouble("total_amount"));
                receipt.setNote(rs.getString("note"));
                receipt.setCreatedAt(rs.getTimestamp("created_at"));
                receipt.setUpdatedAt(rs.getTimestamp("updated_at"));
                receipt.setCustomerName(rs.getString("customer_name"));
                return receipt;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateExportReceipt(ExportReceipt receipt) {
        String query = "UPDATE export_receipts SET export_date = ?, customer_id = ?, reason = ?, total_amount = ?, note = ? WHERE id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setTimestamp(1, new Timestamp(receipt.getExportDate().getTime()));
            ps.setInt(2, receipt.getCustomerId());
            ps.setString(3, receipt.getReason());
            ps.setDouble(4, receipt.getTotalAmount());
            ps.setString(5, receipt.getNote());
            ps.setInt(6, receipt.getId());
            
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteExportReceipt(int id) {
        String query = "DELETE FROM export_receipts WHERE id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<ExportReceipt> getExportReceiptsByDateRange(Date startDate, Date endDate) {
        List<ExportReceipt> receipts = new ArrayList<>();
        String sql = "SELECT * FROM export_receipts WHERE export_date BETWEEN ? AND ? ORDER BY export_date DESC";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setTimestamp(1, new Timestamp(startDate.getTime()));
            pstmt.setTimestamp(2, new Timestamp(endDate.getTime()));
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ExportReceipt receipt = new ExportReceipt();
                receipt.setId(rs.getInt("id"));
                receipt.setExportDate(rs.getTimestamp("export_date"));
                receipt.setCustomerId(rs.getInt("customer_id"));
                receipt.setTotalAmount(rs.getDouble("total_amount"));
                receipt.setReason(rs.getString("reason"));
                receipt.setNote(rs.getString("note"));
                receipts.add(receipt);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return receipts;
    }
} 