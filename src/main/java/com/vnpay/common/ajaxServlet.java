package com.vnpay.common;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.OrderDao;
import dao.UserInfDao;
import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.*;
import object.cart.Cart;
import object.cart.ProductCart;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

/**
 *
 * @author CTT VNPAY
 */

public class ajaxServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserInf userAddress = new UserInf();

        double amount = 0;
        // Đọc body JSON từ request
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = req.getReader();
        String line;
        while((line = reader.readLine()) != null) {
            sb.append(line);
        }

        try {
            // Parse JSON
            JSONObject jsonRequest = new JSONObject(sb.toString());
             amount = jsonRequest.getDouble("amount");

            // (Tùy bạn xử lý thêm ở đây)
            System.out.println("Received payment amount: " + amount);

        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"error\":\"Invalid JSON or missing amount\"}");
            return;
        }
        String bankCode = req.getParameter("bankCode");
        HttpSession session = req.getSession();
        Date date = new Date(System.currentTimeMillis());
        User user = (User) session.getAttribute("user");

        UserInfDao dao_user = new UserInfDao();
        OrderDao dao = new OrderDao();
        int orderId = 0;

        if (user == null) {
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            resp.getWriter().write("{\"error\":\"User not authenticated\"}");
            return;
        }

        int userId = user.getId();

        Order order = new Order();
        order.setUserId(userId);
        order.setCreate_date(date);
        order.setStatus("Pending");

        Product singleProduct = (Product) session.getAttribute("payProduct");
        Cart cart = (Cart) session.getAttribute("cart");

        List<OrderDetail> orderDetailsList = new ArrayList<>();

        if (singleProduct != null) {
            // Case: Buy Now (single product)
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setProductId(singleProduct.getId());
            orderDetail.setTotalQuantity(singleProduct.getQuantity()); // Use quantity from product
            orderDetail.setTotalPrice(singleProduct.getPrice() * singleProduct.getQuantity()); // Calculate total price for detail line
            // Address and Date are typically associated with the main Order, not each detail line, but keeping for compatibility if needed elsewhere
            orderDetail.setAddress(userAddress != null ? userAddress.getAddress() : ""); // Use fetched userAddress
            orderDetail.setDate(new Date(System.currentTimeMillis()));

            orderDetailsList.add(orderDetail); // Add the single detail to the list
            session.removeAttribute("payProduct"); // Remove after processing

        } else if (cart != null && !cart.getList().isEmpty()) {
            // Case: Checkout from Cart
            List<Product> productsInCart = getProducts(cart.getList()); // Convert ProductCart to Product
            for (Product product : productsInCart) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setProductId(product.getId());
                orderDetail.setTotalQuantity(product.getQuantity()); // Use quantity from Product (converted from ProductCart)
                orderDetail.setTotalPrice(product.getPrice() * product.getQuantity()); // Calculate total price for detail line
                orderDetail.setAddress(userAddress != null ? userAddress.getAddress() : ""); // Use fetched userAddress
                orderDetail.setDate(new Date(System.currentTimeMillis()));

                orderDetailsList.add(orderDetail); // Add each detail to the list
            }
            session.removeAttribute("cart"); // Clear the cart after processing

        } else {
            // Case: No product or items in cart to order
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"error\":\"No products to order\"}");
            return; // Stop processing
        }

        // --- Insert Order and Order Details if list is not empty ---
        if (!orderDetailsList.isEmpty()) {
            orderId = dao.insertOrderWithDetails(order, orderDetailsList); // Call the updated method with the list

            if (orderId <= 0) {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                resp.getWriter().write("{\"error\":\"Failed to insert order into database\"}");
                return;
            }
            order.setId(orderId);

        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"error\":\"No order details generated\"}");
            return;
        }

        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";

        String vnp_TxnRef = String.valueOf(orderId);
        String vnp_IpAddr = Config.getIpAddress(req);

        String vnp_TmnCode = Config.vnp_TmnCode;
        long Totalamount = (long) (amount * 100);
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(Totalamount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        String vnp_ReturnUrl = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath() + Config.vnp_ReturnUrl;
        vnp_Params.put("vnp_ReturnUrl", vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        System.out.println(paymentUrl);

        // Trả về URL thanh toán dưới dạng JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("code", "00");
        jsonResponse.addProperty("message", "success");
        jsonResponse.addProperty("data", paymentUrl);
        out.print(jsonResponse.toString());
        out.flush();
    }

    public List<Product> getProducts(List<ProductCart> list) {
        List<Product> products = new ArrayList<>();
        ProductsDao productsDao = new ProductsDao();
        for (ProductCart cart : list) {
            Product product = productsDao.getProductById(cart.getId());
            if(product != null) {
                product.setQuantity(cart.getCount());
                products.add(product);
            }
        }
        return products;
    }
}
