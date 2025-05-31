package servlet.PayProduct;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import ShipperFee.NoiGui;
import com.google.gson.Gson;
import dao.InforUser;
import dao.UserInfDao;
import gson.GsonUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.User;
import object.UserInf;

@WebServlet("/AddAddressUser")
public class AddAddressUser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String GHTK_API_URL = "https://services.giaohangtietkiem.vn/services/shipment/fee";
    private static final String GHTK_TOKEN = "21DlUZVjwfGWvrckT7WG17jTTco1qOtHi1RXXna";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserInfDao dao = new UserInfDao();
        BufferedReader reader = req.getReader();
        Gson gson = GsonUtil.getGson();

        UserInf userAddress = gson.fromJson(reader, UserInf.class);
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        userAddress.setEmail(user.getEmail());
        userAddress.setProvider(user.getProvider());

        InforUser userDao = new InforUser();
        userAddress.setId(userDao.findIdByEmail(user.getEmail()));

        boolean isSuccess = dao.upsertAddressUser(userAddress);
        String[] addressParts = userAddress.getAddress().split(",");

        if (addressParts.length < 2) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"message\":\"Địa chỉ không hợp lệ.\"}");
            return;
        }

        String pickProvince = NoiGui.PICK_PROVINCE;
        String pickDistrict = NoiGui.PICK_DISTRICTS;
        String province = addressParts[addressParts.length - 1].trim();
        System.out.println(province);
        String district = addressParts[addressParts.length - 2].trim();
        System.out.println(district);
        String weight = "1000"; // gram
        String value = "500000"; // VND

        String shippingJson = getShippingFeeFromGHTK(pickProvince, pickDistrict, province, district, weight, value);
        GHTKFeeResponse ghtkResponse = gson.fromJson(shippingJson, GHTKFeeResponse.class);
        System.out.println(ghtkResponse.fee.fee);
        if (ghtkResponse != null && ghtkResponse.success) {
            session.setAttribute("shipFee", ghtkResponse.fee.fee);
            session.setAttribute("userAddress", userAddress);
        } else {
            System.err.println("GHTK API Error: " + shippingJson);
        }

        if (!isSuccess) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"message\":\"Có lỗi xảy ra khi thêm địa chỉ người dùng.\"}");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        req.getRequestDispatcher("index/deliveryAdd.jsp").forward(req, resp);
    }

    private String getShippingFeeFromGHTK(String pickProvince, String pickDistrict, String province, String district, String weight, String value) throws IOException {
        String query = String.format("pick_province=%s&pick_district=%s&province=%s&district=%s&weight=%s&value=%s",
                URLEncoder.encode(pickProvince, "UTF-8"),
                URLEncoder.encode(pickDistrict, "UTF-8"),
                URLEncoder.encode(province, "UTF-8"),
                URLEncoder.encode(district, "UTF-8"),
                URLEncoder.encode(weight, "UTF-8"),
                URLEncoder.encode(value, "UTF-8"));

        URL url = new URL(GHTK_API_URL + "?" + query);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Token", GHTK_TOKEN);
        conn.setRequestProperty("X-Client-Source", "web");

        BufferedReader in = new BufferedReader(new InputStreamReader(
                (conn.getResponseCode() == 200) ? conn.getInputStream() : conn.getErrorStream()));

        StringBuilder responseStr = new StringBuilder();
        String inputLine;
        while ((inputLine = in.readLine()) != null) {
            responseStr.append(inputLine);
        }
        in.close();

        return responseStr.toString();
    }

    // Lớp dùng để parse JSON trả về từ GHTK
    private static class GHTKFeeResponse {
        boolean success;
        Fee fee;

        static class Fee {
            int fee;
            int insurance_fee;
            int total;
        }
    }
}
