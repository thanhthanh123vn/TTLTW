package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Utils {
    private final String url = "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12781782";
    private final String user = "sql12781782";
    private final String password = "RP5S1NhSP8";
    
    public Connection getConnection() {
        Connection c = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Tải MySQL JDBC Driver
            c = DriverManager.getConnection(url, user, password); // Tạo kết nối
            System.out.println("Kết nối thành công!");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return c;
    }
    
    public void closeConnection(Connection c) {
        try {
            if (c != null && !c.isClosed()) {
                c.close();
                System.out.println("Đóng kết nối thành công!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



}
