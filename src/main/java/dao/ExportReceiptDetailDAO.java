package dao;


import object.ExportReceiptDetail;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ExportReceiptDetailDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ExportReceiptDetailDAO() {
        try {
            conn = new Utils().getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean createExportReceiptDetail(ExportReceiptDetail detail) {
        String query = "INSERT INTO export_receipt_details (receipt_id, product_id, size, quantity, price, total) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, detail.getReceiptId());
            ps.setInt(2, detail.getProductId());
            ps.setString(3, detail.getSize());
            ps.setInt(4, detail.getQuantity());
            ps.setDouble(5, detail.getPrice());
            ps.setDouble(6, detail.getTotal());
            
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<ExportReceiptDetail> getDetailsByReceiptId(int receiptId) {
        List<ExportReceiptDetail> details = new ArrayList<>();
        String query = "SELECT erd.*, p.name as product_name FROM export_receipt_details erd " +
                      "LEFT JOIN products p ON erd.product_id = p.id " +
                      "WHERE erd.receipt_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, receiptId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ExportReceiptDetail detail = new ExportReceiptDetail();
                detail.setId(rs.getInt("id"));
                detail.setReceiptId(rs.getInt("receipt_id"));
                detail.setProductId(rs.getInt("product_id"));
                detail.setSize(rs.getString("size"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setPrice(rs.getDouble("price"));
                detail.setTotal(rs.getDouble("total"));
                detail.setProductName(rs.getString("product_name"));
                details.add(detail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return details;
    }

    public boolean updateExportReceiptDetail(ExportReceiptDetail detail) {
        String query = "UPDATE export_receipt_details SET product_id = ?, size = ?, quantity = ?, price = ?, total = ? WHERE id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, detail.getProductId());
            ps.setString(2, detail.getSize());
            ps.setInt(3, detail.getQuantity());
            ps.setDouble(4, detail.getPrice());
            ps.setDouble(5, detail.getTotal());
            ps.setInt(6, detail.getId());
            
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteExportReceiptDetail(int id) {
        String query = "DELETE FROM export_receipt_details WHERE id = ?";
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

    public boolean deleteDetailsByReceiptId(int receiptId) {
        String query = "DELETE FROM export_receipt_details WHERE receipt_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, receiptId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
} 