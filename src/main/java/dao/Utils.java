package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Utils {
    private final String url = "jdbc:mysql://192.168.247.100:3306/webmypham";
    private final String user = "root"; 
    private final String password = "12345";
    
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
