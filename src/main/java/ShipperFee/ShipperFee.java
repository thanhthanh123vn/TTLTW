package ShipperFee;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@WebServlet("/shipping-fee")
public class ShipperFee extends HttpServlet {
    private static final String GHTK_API_URL = "https://services.ghtk.vn/services/shipment/fee";
    private static final String GHTK_TOKEN = "YOUR_GHTK_TOKEN_HERE"; // 🔐 Thay bằng token của bạn

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy các tham số từ request
        String pickProvince = req.getParameter("pick_province");
        String pickDistrict = req.getParameter("pick_district");
        String province = req.getParameter("province");
        String district = req.getParameter("district");
        String weight = req.getParameter("weight");
        String value = req.getParameter("value");

        // Tạo URL đầy đủ
        String query = String.format("pick_province=%s&pick_district=%s&province=%s&district=%s&weight=%s&value=%s",
                URLEncoder.encode(pickProvince, "UTF-8"),
                URLEncoder.encode(pickDistrict, "UTF-8"),
                URLEncoder.encode(province, "UTF-8"),
                URLEncoder.encode(district, "UTF-8"),
                URLEncoder.encode(weight, "UTF-8"),
                URLEncoder.encode(value, "UTF-8")
        );

        URL url = new URL(GHTK_API_URL + "?" + query);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Token", GHTK_TOKEN);
        conn.setRequestProperty("X-Client-Source", "web");

        // Nhận dữ liệu trả về
        int responseCode = conn.getResponseCode();
        BufferedReader in;
        if (responseCode == 200) {
            in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            in = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        String inputLine;
        StringBuilder responseStr = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            responseStr.append(inputLine);
        }
        in.close();

        // Trả dữ liệu JSON về frontend
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(responseStr.toString());
    }
}
