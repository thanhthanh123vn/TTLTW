package ServletAdmin.ManagerKho;

// File: src/main/java/com/yourcompany/web/HomeServlet.java


import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.Utils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/KhoManager")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database connection parameters - REPLACE WITH YOUR ACTUAL DETAILS

    // Define a low stock threshold
    private static final int LOW_STOCK_THRESHOLD = 10;
    Utils utils;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        Utils utils = new Utils();
        try {
            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver"); // Use appropriate driver class

            // Open a connection
            conn = utils.getConnection();

            // 1. Fetch Total Products
            int totalProducts = 0;
            String totalProductsSql = "SELECT COUNT(*) FROM products";
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(totalProductsSql)) {
                if (rs.next()) {
                    totalProducts = rs.getInt(1);
                }
            }

            // 2. Fetch Products Imported Today - Data not available in the provided schema
            int importedToday = 0; // Placeholder as import data is not in schema

            // 3. Fetch Products Exported Today (based on completed/shipped orders)
            int exportedToday = 0;
            // This query sums the quantity of items in completed or shipped orders today
            String exportedTodaySql = "SELECT COALESCE(SUM(od.Quantity), 0) FROM orderdetails od JOIN orders o ON od.OrderID = o.OrderID WHERE DATE(o.OrderDate) = CURRENT_DATE() AND (o.Status = 'Completed' OR o.Status = 'Shipped')";
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(exportedTodaySql)) {
                if (rs.next()) {
                    exportedToday = rs.getInt(1);
                }
            }


            // 4. Fetch Low Stock Products Count
            int lowStockCount = 0;
            String lowStockCountSql = "SELECT COUNT(*) FROM products WHERE quantity <= " + LOW_STOCK_THRESHOLD;
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(lowStockCountSql)) {
                if (rs.next()) {
                    lowStockCount = rs.getInt(1);
                }
            }

            // 5. Fetch Stock levels by category for the bar chart
            String stockByCategorySql = "SELECT c.CategoryName, COALESCE(SUM(p.quantity), 0) FROM categories c LEFT JOIN products p ON c.CategoryID = p.CategoryID GROUP BY c.CategoryName"; // Use LEFT JOIN to include categories with no products
            Map<String, Integer> stockByCategory = new HashMap<>();
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(stockByCategorySql)) {
                while (rs.next()) {
                    stockByCategory.put(rs.getString(1), rs.getInt(2));
                }
            }

            // 6. Fetch Recent Activity - Data not available in the provided schema in the required format
            List<Map<String, String>> recentActivity = new ArrayList<>();
            // Add placeholder or empty list as recent activity data in the required format is not in schema
            // Example placeholder:
            // Map<String, String> placeholderActivity = new HashMap<>();
            // placeholderActivity.put("time", "N/A");
            // placeholderActivity.put("description", "Recent activity data not available");
            // recentActivity.add(placeholderActivity);


            // 7. Fetch Low Stock Alert table data
            String lowStockAlertSql = "SELECT id, name, quantity FROM products WHERE quantity <= " + LOW_STOCK_THRESHOLD + " LIMIT 10"; // Limit results for the table
            List<Map<String, String>> lowStockAlerts = new ArrayList<>();
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(lowStockAlertSql)) {
                while (rs.next()) {
                    Map<String, String> alertItem = new HashMap<>();
                    alertItem.put("code", String.valueOf(rs.getInt("id")));
                    alertItem.put("name", rs.getString("name"));
                    alertItem.put("quantity", String.valueOf(rs.getInt("quantity")));
                    // Determine low stock status based on the threshold
                    alertItem.put("threshold_status", rs.getInt("quantity") <= LOW_STOCK_THRESHOLD ? "Sắp hết" : ""); // Assuming below or at threshold is "Sắp hết"
                    lowStockAlerts.add(alertItem);
                }
            }


            // Set data as request attributes
            request.setAttribute("totalProducts", totalProducts);
            request.setAttribute("importedToday", importedToday); // Will be 0
            request.setAttribute("exportedToday", exportedToday);
            request.setAttribute("lowStockCount", lowStockCount);
            request.setAttribute("stockByCategory", stockByCategory);
            request.setAttribute("recentActivity", recentActivity); // Will be empty
            request.setAttribute("lowStockAlerts", lowStockAlerts);


            // Forward to Home.jsp
            request.getRequestDispatcher("/admin/Home.jsp").forward(request, response);

        } catch (SQLException se) {
            se.printStackTrace();
            // Handle errors
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + se.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "JDBC Driver not found: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}