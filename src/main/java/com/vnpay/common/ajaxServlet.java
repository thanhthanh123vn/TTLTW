/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vnpay.common;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.OrderDao;
import dao.UserInfDao;
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
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";

        long amount = 0;
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
             amount = jsonRequest.getLong("amount");

            // (Tùy bạn xử lý thêm ở đây)
            System.out.println("Received payment amount: " + amount);

            // Phản hồi về client
            resp.setContentType("application/json");
            PrintWriter out = resp.getWriter();
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "Đã nhận thanh toán với số tiền: " + amount);
            out.print(jsonResponse.toString());
            out.flush();
        } catch (Exception e) {
            resp.setContentType("application/json");
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            PrintWriter out = resp.getWriter();
            JSONObject error = new JSONObject();
            error.put("status", "error");
            error.put("message", "Lỗi khi xử lý dữ liệu JSON: " + e.getMessage());
            out.print(error.toString());
            out.flush();
        }
        String bankCode = req.getParameter("bankCode");
        HttpSession session = req.getSession();
        Date date = new Date(System.currentTimeMillis());
        User user = (User) session.getAttribute("user");


        UserInfDao dao_user = new UserInfDao();
        OrderDao dao = new OrderDao();
        int isSuccess  = 0 ;

         int   id = user.getId();


        Order order = new Order();
        String action = "";

        order.setUserId(id);

        System.out.println(order.getUserId()+"Nguoi dung order");
        order.setCreate_date(date);
        Product product = (Product) session.getAttribute("payProduct");


        Cart cart = (Cart) session.getAttribute("cart");
        OrderDetail orderDetail = new OrderDetail();
        if (product != null) {

            orderDetail.setProductId(product.getId());
            orderDetail.setAddress(userAddress.getAddress());
            orderDetail.setDate(new Date(System.currentTimeMillis()));
            orderDetail.setMethodPay("VNPAY");


            orderDetail.setTotalQuantity(product.getQuantity());
            orderDetail.setTotalPrice(product.getPrice());


             isSuccess = dao.insertOrderWithDetails(order, orderDetail);




            if (isSuccess>0) {
                action = "success";
                session.setAttribute("action",action);
                session.setAttribute("order",order);
                Date date1 = new Date(System.currentTimeMillis());

                orderDetail.setDate(date1);
                session.setAttribute("orderDetail",orderDetail);
                session.setAttribute("productQL", product);
                session.removeAttribute("payProduct");
                req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);
            } else {
//                System.out.println("Mua ngay đó nha"+product.toString());
//                req.setAttribute("product", product);
                req.setAttribute("errorMessage", "Khong the chen Order");
                req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);
            }


        }
        if (cart != null ){

            List<ProductCart> productCarts = cart.getList();
            List<Product> products = getProducts(productCarts);

            if (!products.isEmpty()) {
                for (Product cproduct : products) {
                    Order order2 = new Order();
                    order2.setUserId(id);
                    order2.setCreate_date(date);
                    OrderDetail orderDetail2 = new OrderDetail();
                    orderDetail2.setAddress(userAddress.getAddress());
                    orderDetail2.setDate(new Date(System.currentTimeMillis()));
                    orderDetail2.setMethodPay("VNPAY");
                    orderDetail2.setProductId(cproduct.getId());
                    orderDetail2.setTotalQuantity(cproduct.getQuantity());
                    orderDetail2.setTotalPrice(cproduct.getPrice());

                    isSuccess = dao.insertOrderWithDetails(order2, orderDetail2);
                    if (isSuccess>0) {
                        action = "success";
                        Date date1 = new Date(System.currentTimeMillis());

                        orderDetail.setDate(date1);
                        session.setAttribute("order",order2);

                        session.setAttribute("orderDetail",orderDetail2);
                        session.setAttribute("action",action);
                        session.setAttribute("cartQL", cart);
                        req.setAttribute("cart", cart);
                        session.removeAttribute("cart");
                        req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);
                    } else {

//                session.setAttribute("cartQL", cart);
                        req.setAttribute("errorMessage", "Khong the chen Order");
                        req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);
                    }

                }
            }


        }






        
        String vnp_TxnRef = isSuccess+"";
        String vnp_IpAddr = Config.getIpAddress(req);

        String vnp_TmnCode = Config.vnp_TmnCode;
        
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
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
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
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
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
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
        JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");
        job.addProperty("data", paymentUrl);
        Gson gson = new Gson();
        System.out.println(gson.toJson(job).toString());
        resp.getWriter().write(gson.toJson(job));
    }
    public List<Product> getProducts(List<ProductCart> list) {

        List<Product> products = new ArrayList<>();
        for (ProductCart cart : list) {
            Product product = new Product();
            product.setId(cart.getId());
            product.setName(cart.getName());
            product.setPrice(cart.getPrice());
            product.setQuantity(cart.getCount());

            products.add(product);

        }
        return products;

    }
}
