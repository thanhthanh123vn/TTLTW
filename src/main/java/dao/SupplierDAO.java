package dao;


import object.Supplier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SupplierDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public SupplierDAO() {
        conn = null;
        ps = null;
        rs = null;
    }

    public List<Supplier> getAllSuppliers() throws SQLException {
        String query = "SELECT * FROM suppliers WHERE status = true ORDER BY name";
        List<Supplier> suppliers = new ArrayList<>();
        try {
            conn = new Utils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Supplier supplier = new Supplier();
                supplier.setId(rs.getInt("id"));
                supplier.setName(rs.getString("name"));
                supplier.setAddress(rs.getString("address"));
                supplier.setPhone(rs.getString("phone"));
                supplier.setEmail(rs.getString("email"));
                supplier.setTaxCode(rs.getString("tax_code"));
                supplier.setContactPerson(rs.getString("contact_person"));
                supplier.setStatus(rs.getBoolean("status"));
                supplier.setCreatedAt(rs.getTimestamp("created_at"));
                supplier.setUpdatedAt(rs.getTimestamp("updated_at"));
                suppliers.add(supplier);
            }
            return suppliers;
        } finally {
            closeResources();
        }
    }

    public Supplier getSupplierById(int id) throws SQLException {
        String query = "SELECT * FROM suppliers WHERE id = ? AND status = true";
        try {
            conn = new Utils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                Supplier supplier = new Supplier();
                supplier.setId(rs.getInt("id"));
                supplier.setName(rs.getString("name"));
                supplier.setAddress(rs.getString("address"));
                supplier.setPhone(rs.getString("phone"));
                supplier.setEmail(rs.getString("email"));
                supplier.setTaxCode(rs.getString("tax_code"));
                supplier.setContactPerson(rs.getString("contact_person"));
                supplier.setStatus(rs.getBoolean("status"));
                supplier.setCreatedAt(rs.getTimestamp("created_at"));
                supplier.setUpdatedAt(rs.getTimestamp("updated_at"));
                return supplier;
            }
            return null;
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