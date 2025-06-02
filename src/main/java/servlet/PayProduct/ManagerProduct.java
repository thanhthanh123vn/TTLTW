package servlet.PayProduct;

import ShipperFee.APIGHTK;
import ShipperFee.GHTKOrderResponse;
import ShipperFee.NoiGui;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dao.OrderDao;
import dao.ProductsDao;
import dao.UserInfDao;
import gson.GsonUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.*;
import object.cart.Cart;
import object.cart.ProductCart;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/ManagerProduct")
public class ManagerProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDao dao = new OrderDao();
        UserInfDao userInfDao = new UserInfDao();
        HttpSession session = req.getSession();
        String action = null;

        Date date = new Date(System.currentTimeMillis());
        User user = (User) req.getSession().getAttribute("user");
        UserInf userAddress = (UserInf) session.getAttribute("userAddress");
        int userId  ;

        // Check if user and address are available
        if (user == null) {
            // Handle case where user is not logged in
            resp.sendRedirect("login.jsp"); // Redirect to login page
            return;
        }
        if (userAddress == null) {
            // Handle case where user address is not available
            req.setAttribute("errorMessage", "Thông tin địa chỉ người dùng không có sẵn.");
            req.getRequestDispatcher("index.jsp").forward(req, resp); // Or another appropriate page
            return;
        }

        userId = user.getId();

        // --- Order processing logic ---

        Product singleProduct = (Product) session.getAttribute("payProduct");
        Cart cart = (Cart) session.getAttribute("cart");

        List<Product> productsToOrder = new ArrayList<>();
        double totalOrderPrice = 0; // Calculate total price for the GHTK order value

        if (singleProduct != null) {
            // Case: Buy Now (single product)
            productsToOrder.add(singleProduct);
            totalOrderPrice = singleProduct.getPrice();

            session.removeAttribute("payProduct"); // Remove the single product after processing
        } else if (cart != null && !cart.getList().isEmpty()) {
            // Case: Checkout from Cart
            productsToOrder = getProducts(cart.getList());
            for(Product p : productsToOrder) {
                totalOrderPrice += p.getPrice() * p.getQuantity(); // Calculate total based on price and quantity
            }

            session.removeAttribute("cart");
            // Clear the cart after creating the order

        } else {
            // Case: No product or items in cart to order
            req.setAttribute("errorMessage", "Không có sản phẩm nào để đặt hàng.");
            req.getRequestDispatcher("index.jsp").forward(req, resp); // Or another appropriate page
            return;
        }

        // --- Proceed with order creation if there are products ---
        if (!productsToOrder.isEmpty()) {
            // Create a single Order object for the entire list of products
            Order order = new Order();
            order.setUserId(userId);
            order.setCreate_date(date);


            // Create OrderDetail objects for each product
            List<OrderDetail> orderDetails = new ArrayList<>();
            for (Product p : productsToOrder) {
                OrderDetail od = new OrderDetail();
                od.setProductId(p.getId());
                od.setAddress(userAddress.getAddress()); // Assuming same address for all items in one order
                od.setDate(new Date(System.currentTimeMillis()));
                od.setMethodPay("COD"); // Assuming same method for all items
                od.setTotalQuantity(p.getQuantity());
                od.setTotalPrice(p.getPrice() * p.getQuantity()); // Total price for this order detail line
                orderDetails.add(od);
            }

            // Insert the single order with multiple details
            // You need to modify your OrderDao.insertOrderWithDetails to accept a List<OrderDetail>
            int orderId = dao.insertOrderWithDetails(order, orderDetails); // Assuming insertOrderWithDetails is updated

            if (orderId > 0) {
                action = "success";
                try {
                    // Create GHTK order for the list of products
                    String getTrackingNumber = createOrder(userAddress, productsToOrder, totalOrderPrice); // Pass the list and total price
                    // You might want to store the tracking number in your database associated with the order

                    // Optionally get order status (though it will likely be "picking" initially)
                    // String actionProduct = getOrderStatus(getTrackingNumber);
                    // session.setAttribute("actionProduct", actionProduct); // Store status if needed

                } catch (IOException e) {
                    e.printStackTrace();
                    req.setAttribute("errorMessage", "Lỗi khi tạo đơn hàng GHTK: " + e.getMessage());
                    // Consider marking your internal order as pending or failed due to GHTK error
                }




                // Trong ManagerProduct.java, phần xử lý order thành công
                if (orderId > 0) {
                    System.out.println("Order thanh cong");
                    action = "success";
                    try {

                        // Set các thuộc tính session cần thiết
                        session.setAttribute("action", action);
                        session.setAttribute("order", order);
                        session.setAttribute("orderDetails", orderDetails);
                        session.setAttribute("productsToOrder", productsToOrder);
                        String getTrackingNumber = createOrder(userAddress, productsToOrder, totalOrderPrice);
                        session.setAttribute("trackingNumber", getTrackingNumber);

                        // Forward to the order management page
                        req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);
                    } catch (IOException e) {
                        e.printStackTrace();
                        req.setAttribute("errorMessage", "Lỗi khi tạo đơn hàng GHTK: " + e.getMessage());
                    }
                }
                // Forward to the order management page
                req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);

            } else {
                req.setAttribute("errorMessage", "Không thể tạo đơn hàng trong cơ sở dữ liệu.");
                req.getRequestDispatcher("index.jsp").forward(req, resp); // Or appropriate error page
            }
        }
    }

    // Helper method to convert List<ProductCart> to List<Product>
    public List<Product> getProducts(List<ProductCart> list) {
        List<Product> products = new ArrayList<>();
        for (ProductCart cart : list) {
            Product product = new ProductsDao().getProductById(cart.getId()); // Fetch full product details if needed
            if (product != null) {
                product.setQuantity(cart.getCount()); // Set the quantity from the cart
                products.add(product);
            }
        }
        return products;
    }

    // Method to get order status from GHTK
    public static String getOrderStatus(String maVanDon) throws IOException {
        String apiUrl = "https://services.giaohangtietkiem.vn/services/shipment/v2/" + maVanDon; // Use dev URL for sandbox


        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Token", APIGHTK.API_GHTK);

        BufferedReader in = new BufferedReader(new InputStreamReader(
                conn.getResponseCode() == 200 ? conn.getInputStream() : conn.getErrorStream(), StandardCharsets.UTF_8));
        String inputLine;
        StringBuilder response = new StringBuilder();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        return response.toString(); // JSON response
    }

    // Modified createOrder method to accept a list of products and total price
    public static String createOrder(UserInf userAddress, List<Product> products, double totalOrderPrice) throws IOException {
        String apiUrl = "https://services.giaohangtietkiem.vn/services/shipment/order"; // Use dev URL for sandbox

        if (products == null || products.isEmpty()) {
            throw new IllegalArgumentException("Product list cannot be null or empty.");
        }

        // Parse địa chỉ người nhận - Assuming address is in format "Detail, Ward/Commune, District, Province"
        String[] addressParts = userAddress.getAddress().split(",");
        String detailAddress = "";
        String ward = "";
        String district = "";
        String province = "";

        if (addressParts.length >= 4) {
            province = addressParts[addressParts.length - 1].trim();
            district = addressParts[addressParts.length - 2].trim();
            ward = addressParts[addressParts.length - 3].trim();
            // Reconstruct detail address
            StringBuilder detailBuilder = new StringBuilder();
            for (int i = 0; i < addressParts.length - 3; i++) {
                detailBuilder.append(addressParts[i].trim());
                if (i < addressParts.length - 4) {
                    detailBuilder.append(", ");
                }
            }
            detailAddress = detailBuilder.toString();

        } else {
            // Handle unexpected address format, perhaps log a warning or set defaults
            detailAddress = userAddress.getAddress().trim();
            // You might need to attempt to parse province/district from a separate field or external service
        }


        // Build products JSON array
        Gson gson = new Gson();
        JsonArray productsJsonArray = new JsonArray();
        for (Product p : products) {
            JsonObject productJson = new JsonObject();
            productJson.addProperty("name", p.getName());
            productJson.addProperty("weight", 1000); // Assuming a default weight per product, adjust if needed
            productJson.addProperty("quantity", p.getQuantity());
            productsJsonArray.add(productJson);
        }


        // Create the main order JSON object
        JsonObject orderJson = new JsonObject();
        orderJson.addProperty("id", "DH" + System.currentTimeMillis()); // Generate a unique order ID
        orderJson.addProperty("pick_name", NoiGui.PICK_NAME);
        orderJson.addProperty("pick_address", NoiGui.PICK_ADDRESS);
        orderJson.addProperty("pick_province", NoiGui.PICK_PROVINCE);
        orderJson.addProperty("pick_district", NoiGui.PICK_DISTRICTS);
        orderJson.addProperty("pick_tel", NoiGui.PICK_TEL);

        orderJson.addProperty("name", userAddress.getUserName());
        orderJson.addProperty("address", detailAddress); // Use the parsed detail address
        orderJson.addProperty("province", province);
        orderJson.addProperty("district", district);
        orderJson.addProperty("ward", ward); // GHTK often requires ward
        orderJson.addProperty("tel", userAddress.getPhone());
        orderJson.addProperty("hamlet", "Khác"); // Default hamlet
        orderJson.addProperty("is_freeship", "0"); // Set based on your logic
        orderJson.addProperty("pick_money", totalOrderPrice); // Amount collected on delivery
        orderJson.addProperty("note", "Giao giờ hành chính");
        orderJson.addProperty("value", totalOrderPrice); // Value of the order for insurance

        orderJson.add("products", productsJsonArray); // Add the products array

        JsonObject requestPayload = new JsonObject();
        requestPayload.add("order", orderJson);


        String jsonInput = gson.toJson(requestPayload);


        // Gọi API GHTK
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Token", APIGHTK.API_GHTK);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        conn.getOutputStream().write(jsonInput.getBytes(StandardCharsets.UTF_8)); // Use UTF-8 for sending


        BufferedReader in = new BufferedReader(new InputStreamReader(
                conn.getResponseCode() == 200 ? conn.getInputStream() : conn.getErrorStream(), StandardCharsets.UTF_8)); // Use UTF-8 for reading
        String inputLine;
        StringBuilder response = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        // Parse response JSON
        GHTKOrderResponse ghtkResponse = gson.fromJson(response.toString(), GHTKOrderResponse.class);

        if (ghtkResponse.isSuccess()) {
            // You might want to return the full response or the tracking ID and order value
            return ghtkResponse.getTrackingNumber(); // Trả về mã vận đơn hoặc thông tin cần thiết
        } else {
            // Log the error response from GHTK for debugging
            System.err.println("GHTK API Error Response: " + response.toString());
            throw new IOException("GHTK API Error: " + ghtkResponse.getMessage() + " (Error Code: " + ghtkResponse.getMessage() + ")");
        }
    }
}