<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.URLEncoder, java.nio.charset.StandardCharsets" %>

<%!
    public String hmacSHA512(String key, String data) throws Exception {
        javax.crypto.Mac hmac512 = javax.crypto.Mac.getInstance("HmacSHA512");
        javax.crypto.spec.SecretKeySpec secretKey = new javax.crypto.spec.SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
        hmac512.init(secretKey);
        byte[] bytes = hmac512.doFinal(data.getBytes(StandardCharsets.UTF_8));
        StringBuilder result = new StringBuilder();
        for (byte b : bytes) {
            result.append(String.format("%02x", b));
        }
        return result.toString();
    }
%>

<%
    try {
        String vnp_TmnCode = "2QXUI4J4";
        String vnp_HashSecret = "SECRETKEYCHO2QXUI4J4"; // Kiểm tra lại khóa này
        String vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        String vnp_Returnurl = "http://localhost:8080/WebMyPham__/vnpay_return.jsp";

        String orderType = "other";
        long amount = 100000 * 100; // 100,000 VND * 100
        String vnp_TxnRef = String.valueOf(System.currentTimeMillis());
        String vnp_IpAddr = request.getRemoteAddr();
        String vnp_CreateDate = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", "2.1.0");
        vnp_Params.put("vnp_Command", "pay");
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toán đơn hàng: " + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        // Bỏ vnp_BankCode để thử nghiệm
        // vnp_Params.put("vnp_BankCode", "NCB");

        // Sắp xếp tham số
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);

        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();

        for (String name : fieldNames) {
            String value = vnp_Params.get(name);
            if (value != null && !value.isEmpty()) {
                if (hashData.length() > 0) {
                    hashData.append("&");
                    query.append("&");
                }
                hashData.append(name).append("=").append(value);
                query.append(name).append("=").append(URLEncoder.encode(value, StandardCharsets.UTF_8.toString()));
            }
        }

        // Tạo chữ ký
        String secureHash = hmacSHA512(vnp_HashSecret, hashData.toString());

        // Thêm chữ ký vào chuỗi truy vấn
        query.append("&vnp_SecureHash=").append(secureHash);
        String paymentUrl = vnp_Url + "?" + query.toString();

        // Gỡ lỗi
        System.out.println("hashData: " + hashData.toString());
        System.out.println("secureHash: " + secureHash);
        System.out.println("paymentUrl: " + paymentUrl);

        response.sendRedirect(paymentUrl);
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("Lỗi: " + e.getMessage());
    }
%>