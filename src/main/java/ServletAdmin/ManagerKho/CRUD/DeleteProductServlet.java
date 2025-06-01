// File: src/main/java/ServletAdmin/ManagerKho/CRUD/DeleteProductServlet.java
package ServletAdmin.ManagerKho.CRUD;

import java.io.IOException;
import java.sql.*;

import dao.Utils; // Assuming dao.Utils provides database connection
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.JsonObject;

@WebServlet("/DeleteProduct")
public class DeleteProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Assuming Utils class handles connection details
    private Utils utils = new Utils(); // Initialize Utils


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonObject jsonResponse = new JsonObject();
        String productIdParam = request.getParameter("id"); // Get product ID from request parameter

        if (productIdParam == null || productIdParam.isEmpty()) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Product ID is required.");
            response.getWriter().write(jsonResponse.toString());
            return;
        }

        int productId = -1;
        try {
            productId = Integer.parseInt(productIdParam);
        } catch (NumberFormatException e) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Invalid Product ID format.");
            response.getWriter().write(jsonResponse.toString());
            return;
        }

        Connection conn = null;
        PreparedStatement deleteDetailStmt = null;
        PreparedStatement deleteProductStmt = null;

        try {
            // Get connection using your Utils class
            conn = utils.getConnection();
            // Start transaction
            conn.setAutoCommit(false);

            // 1. Delete from productdetail table first
            String deleteDetailSql = "DELETE FROM productdetail WHERE ID = ?";
            deleteDetailStmt = conn.prepareStatement(deleteDetailSql);
            deleteDetailStmt.setInt(1, productId);
            // Note: executeUpdate for DELETE returns the number of rows affected.
            // It's possible a product exists without a productdetail entry, so 0 rows affected is okay here.
            deleteDetailStmt.executeUpdate();


            // 2. Delete from products table
            String deleteProductSql = "DELETE FROM products WHERE id = ?";
            deleteProductStmt = conn.prepareStatement(deleteProductSql);
            deleteProductStmt.setInt(1, productId);

            int rowsAffected = deleteProductStmt.executeUpdate();

            if (rowsAffected > 0) {
                // If product was successfully deleted, commit the transaction
                conn.commit();
                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("message", "Product and details deleted successfully.");
            } else {
                // If product was not found/deleted, rollback the transaction
                conn.rollback();
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Product with ID " + productId + " not found.");
            }

        } catch (SQLException se) {
            se.printStackTrace();
            // Rollback transaction on any SQL error
            try {
                if (conn != null) conn.rollback();
            } catch (SQLException rbse) {
                rbse.printStackTrace();
            }
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Database error during deletion: " + se.getMessage());
        } catch (Exception e) { // Catch other exceptions, e.g., from utils.getConnection()
            e.printStackTrace();
            // Attempt rollback on other errors too
            try {
                if (conn != null) conn.rollback();
            } catch (SQLException rbse) {
                rbse.printStackTrace();
            }
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "An unexpected error occurred: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (deleteDetailStmt != null) deleteDetailStmt.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (deleteProductStmt != null) deleteProductStmt.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                // Ensure connection is closed, returning to pool if applicable
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }

        response.getWriter().write(jsonResponse.toString());
    }
}