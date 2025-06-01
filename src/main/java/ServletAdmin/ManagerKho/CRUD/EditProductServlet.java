package ServletAdmin.ManagerKho.CRUD;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

import dao.Utils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;

@WebServlet("/EditProduct")
public class EditProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    Utils utils = new Utils(); // Initialize Utils

    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonObject jsonResponse = new JsonObject();
        String productIdParam = request.getParameter("id");

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
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = utils.getConnection();

            // SQL query to fetch product details by ID, including description and category ID
            String sql = "SELECT p.id, p.name, p.quantity, p.price, pd.Description, c.CategoryID " +
                    "FROM products p " +
                    "LEFT JOIN productdetail pd ON p.id = pd.ID " + // Use LEFT JOIN as productdetail might not exist for all products
                    "JOIN categories c ON p.CategoryID = c.CategoryID " +
                    "WHERE p.id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, productId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                Map<String, Object> product = new HashMap<>();
                product.put("id", rs.getInt("id"));
                // Using ID as code for now, adjust if you have a separate product code field
                product.put("code", rs.getInt("id"));
                product.put("name", rs.getString("name"));
                product.put("quantity", rs.getInt("quantity"));
                product.put("price", rs.getDouble("price"));
                product.put("description", rs.getString("Description"));
                product.put("categoryId", rs.getInt("CategoryID"));

                jsonResponse.addProperty("success", true);
                jsonResponse.add("product", gson.toJsonTree(product));

            } else {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Product with ID " + productId + " not found.");
            }

        } catch (SQLException se) {
            se.printStackTrace();
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Database error: " + se.getMessage());
        } catch (Exception e) { // Catch other exceptions, e.g., from utils.getConnection()
            e.printStackTrace();
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "An unexpected error occurred: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }

        response.getWriter().write(jsonResponse.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        JsonObject jsonResponse = new JsonObject();

        // Read JSON data from the request body
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        PreparedStatement detailStmt = null;
        ResultSet generatedKeys = null;

        try {
            // Parse JSON data into a Map
            Map<String, Object> productData = gson.fromJson(sb.toString(), Map.class);

            // Extract data, handling potential nulls or incorrect types
            Integer productId = null;
            if (productData.get("id") != null && !productData.get("id").toString().isEmpty()) {
                try {
                    productId = Integer.parseInt(productData.get("id").toString());
                } catch (NumberFormatException e) {
                    // This can happen if 'id' is sent as an empty string or non-numeric
                    productId = null; // Treat as add if ID is invalid
                }
            }


            String productName = (String) productData.get("name");
            // Assuming category is sent as ID, parse to integer
            Integer categoryId = null;
            if (productData.get("categoryId") != null && !productData.get("categoryId").toString().isEmpty()) {
                try {
                    categoryId = Integer.parseInt(productData.get("categoryId").toString());
                } catch (NumberFormatException e) {
                    // Handle invalid category ID format
                    jsonResponse.addProperty("success", false);
                    jsonResponse.addProperty("message", "Invalid Category ID format.");
                    response.getWriter().write(jsonResponse.toString());
                    return;
                }
            }


            // Parse quantity and price to appropriate number types
            Integer quantity = null;
            if (productData.get("quantity") != null) {
                try {
                    quantity = ((Double) productData.get("quantity")).intValue();
                } catch (ClassCastException e) {
                    // Handle cases where quantity might be sent as string
                    try {
                        quantity = Integer.parseInt(productData.get("quantity").toString());
                    } catch (NumberFormatException nfe) {
                        jsonResponse.addProperty("success", false);
                        jsonResponse.addProperty("message", "Invalid Quantity format.");
                        response.getWriter().write(jsonResponse.toString());
                        return;
                    }
                }
            }


            Double price = null;
            if (productData.get("price") != null) {
                try {
                    price = (Double) productData.get("price");
                } catch (ClassCastException e) {
                    // Handle cases where price might be sent as string
                    try {
                        price = Double.parseDouble(productData.get("price").toString());
                    } catch (NumberFormatException nfe) {
                        jsonResponse.addProperty("success", false);
                        jsonResponse.addProperty("message", "Invalid Price format.");
                        response.getWriter().write(jsonResponse.toString());
                        return;
                    }
                }
            }

            String description = (String) productData.get("description");


            if (productName == null || productName.trim().isEmpty() || categoryId == null || quantity == null || price == null) {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Missing required product data (name, categoryId, quantity, price).");
                response.getWriter().write(jsonResponse.toString());
                return;
            }


            conn = utils.getConnection();
            conn.setAutoCommit(false); // Start transaction

            if (productId == null) { // Add new product
                // Insert into products table
                String insertSql = "INSERT INTO products (name, quantity, price, CategoryID) VALUES (?, ?, ?, ?)";
                stmt = conn.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS);

                stmt.setString(1, productName);
                stmt.setInt(2, quantity);
                stmt.setDouble(3, price);
                stmt.setInt(4, categoryId);

                int rowsAffectedProduct = stmt.executeUpdate();

                if (rowsAffectedProduct > 0) {
                    generatedKeys = stmt.getGeneratedKeys();
                    int newProductId = -1;
                    if (generatedKeys.next()) {
                        newProductId = generatedKeys.getInt(1);
                    }

                    // Insert into productdetail table
                    // Note: Populate other fields as needed, currently using placeholders
                    String insertDetailSql = "INSERT INTO productdetail (ID, ProductName, Category, Description, SuitableSkin, SkinSolution, Highlight, Ingredients, FullIngredients, HowToUse, Storage, Brand, BrandOrigin, ManufactureLocation, Barcode, Volume, IsSensitiveSkinSafe) VALUES (?, ?, ?, ?, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ?)";
                    detailStmt = conn.prepareStatement(insertDetailSql);
                    detailStmt.setInt(1, newProductId);
                    detailStmt.setString(2, productName); // Using product name, adjust if productdetail.Category refers to CategoryName
                    detailStmt.setString(3, productName); // Using product name as Category for simplicity, adjust as needed
                    detailStmt.setString(4, description);
                    detailStmt.setBoolean(5, true); // Assuming true for IsSensitiveSkinSafe by default

                    detailStmt.executeUpdate(); // Execute detail insert

                    conn.commit(); // Commit transaction if both inserts succeed
                    jsonResponse.addProperty("success", true);
                    jsonResponse.addProperty("message", "Product added successfully.");
                    jsonResponse.addProperty("newProductId", newProductId);

                } else {
                    conn.rollback(); // Rollback if product insert failed
                    jsonResponse.addProperty("success", false);
                    jsonResponse.addProperty("message", "Failed to add product to products table.");
                }


            } else { // Update existing product
                // Update products table
                String updateSql = "UPDATE products SET name = ?, quantity = ?, price = ?, CategoryID = ? WHERE id = ?";
                stmt = conn.prepareStatement(updateSql);
                stmt.setString(1, productName);
                stmt.setInt(2, quantity);
                stmt.setDouble(3, price);
                stmt.setInt(4, categoryId);
                stmt.setInt(5, productId);

                int rowsAffectedProduct = stmt.executeUpdate();

                // Update or Insert into productdetail table
                // Check if a productdetail entry already exists
                String checkDetailSql = "SELECT COUNT(*) FROM productdetail WHERE ID = ?";
                boolean detailExists = false;
                try (PreparedStatement checkStmt = conn.prepareStatement(checkDetailSql)) {
                    checkStmt.setInt(1, productId);
                    try (ResultSet checkRs = checkStmt.executeQuery()) {
                        if (checkRs.next() && checkRs.getInt(1) > 0) {
                            detailExists = true;
                        }
                    }
                }

                if (detailExists) {
                    // Update productdetail table
                    String updateDetailSql = "UPDATE productdetail SET Description = ?, ProductName = ?, Category = ? WHERE ID = ?"; // Update other fields as needed
                    detailStmt = conn.prepareStatement(updateDetailSql);
                    detailStmt.setString(1, description);
                    detailStmt.setString(2, productName); // Using product name
                    detailStmt.setString(3, productName); // Using product name as Category, adjust as needed
                    detailStmt.setInt(4, productId);
                    detailStmt.executeUpdate();

                } else {
                    // Insert into productdetail table if it didn't exist
                    if (description != null) {
                        String insertDetailSql = "INSERT INTO productdetail (ID, ProductName, Category, Description, SuitableSkin, SkinSolution, Highlight, Ingredients, FullIngredients, HowToUse, Storage, Brand, BrandOrigin, ManufactureLocation, Barcode, Volume, IsSensitiveSkinSafe) VALUES (?, ?, ?, ?, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ?)";
                        detailStmt = conn.prepareStatement(insertDetailSql);
                        detailStmt.setInt(1, productId);
                        detailStmt.setString(2, productName);
                        detailStmt.setString(3, productName);
                        detailStmt.setString(4, description);
                        detailStmt.setBoolean(5, true); // Assuming true for IsSensitiveSkinSafe by default
                        detailStmt.executeUpdate();
                    }
                }

                // Commit transaction if product update (and detail update/insert) succeeds
                // Even if no rows affected in products, if detail update/insert happened, commit.
                // If product didn't exist, the initial rowsAffectedProduct will be 0, and we should indicate failure.
                if (rowsAffectedProduct > 0) {
                    conn.commit();
                    jsonResponse.addProperty("success", true);
                    jsonResponse.addProperty("message", "Product updated successfully.");
                } else {
                    // If product was not found to update, rollback
                    conn.rollback();
                    jsonResponse.addProperty("success", false);
                    jsonResponse.addProperty("message", "No rows updated. Product with ID " + productId + " might not exist.");
                }


            }


        } catch (JsonSyntaxException e) {
            e.printStackTrace();
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Invalid JSON data in request body: " + e.getMessage());
            // No transaction started yet, no rollback needed
        } catch (NumberFormatException e) {
            e.printStackTrace();
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Invalid number format for quantity or price: " + e.getMessage());
            // No transaction started yet, no rollback needed
        } catch (SQLException se) {
            se.printStackTrace();
            // Rollback transaction on any SQL error
            try {
                if (conn != null) conn.rollback();
            } catch (SQLException rbse) {
                rbse.printStackTrace();
            }
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Database error during save/update: " + se.getMessage());
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
                if (generatedKeys != null) generatedKeys.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (detailStmt != null) detailStmt.close();
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