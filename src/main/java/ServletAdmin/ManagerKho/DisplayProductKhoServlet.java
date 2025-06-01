package ServletAdmin.ManagerKho;
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

@WebServlet("/ManagerKho")
public class DisplayProductKhoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database connection parameters - REPLACE WITH YOUR ACTUAL DETAILS
    Utils utils;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, Object>> products = new ArrayList<>();
         utils = new Utils();
        Connection conn = null;

        try {


            conn = utils.getConnection();

            // SQL query to fetch product details along with category name
            String sql = "SELECT p.id, p.name, c.CategoryName, p.quantity, p.price, p.updated_at " +
                    "FROM products p JOIN categories c ON p.CategoryID = c.CategoryID";

            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    Map<String, Object> product = new HashMap<>();
                    product.put("id", rs.getInt("id"));
                    product.put("name", rs.getString("name"));
                    product.put("categoryName", rs.getString("CategoryName"));
                    product.put("quantity", rs.getInt("quantity"));
                    product.put("price", rs.getDouble("price"));
                    product.put("updatedAt", rs.getTimestamp("updated_at")); // Use Timestamp for date/time
                    products.add(product);
                }
            }

            // Set the list of products as a request attribute
            System.out.println(products.size()+" KHo Products");
            request.setAttribute("products", products);

            // Forward to the ManagerKho.jsp page
            request.getRequestDispatcher("/admin/ManagerKho.jsp").forward(request, response);

        } catch (SQLException se) {
            se.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + se.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "JDBC Driver not found: " + e.getMessage());
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}