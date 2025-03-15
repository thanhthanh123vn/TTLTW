package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class IndexAdminDao {

    Utils utils;
    Connection conn;

    public IndexAdminDao() {
        utils = new Utils();
        conn = utils.getConnection();
    }

    public double TurnoverInYear(int year) {
        double total = 0;
        String sql = "SELECT SUM(od.quantity * od.price) AS TotalSales " +
                "FROM products p " +
                "JOIN orderdetails od ON p.id = od.ProductID " +
                "JOIN orders o ON o.OrderID = od.OrderID " +
                "WHERE YEAR(o.orderDate) = ?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, year);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getDouble("TotalSales");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }

    public double TurnoverInMonth(int month, int year) {
        double total = 0;
        String sql = "SELECT SUM(od.quantity * od.price) AS TotalSales " +
                "FROM products p " +
                "JOIN orderdetails od ON p.id = od.ProductID " +
                "JOIN orders o ON o.OrderID = od.OrderID " +
                "WHERE YEAR(o.orderDate) = ? AND MONTH(o.orderDate) = ?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getDouble("TotalSales");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }


}