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
    private static final String GHTK_API_URL = "https://services.ghtk.vn/services/shipment/fee";
    private static final String GHTK_TOKEN = "YOUR_GHTK_TOKEN_HERE"; // 🔐 Thay bằng token của bạn

    UserInf userAddress;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserInfDao dao = new UserInfDao();
        BufferedReader reader = req.getReader();

        Gson gson = GsonUtil.getGson();
         userAddress = gson.fromJson(reader, UserInf.class);
        System.out.println(userAddress.toString());
         HttpSession session = req.getSession();
         User user = (User) session.getAttribute("user");
         userAddress.setEmail(user.getEmail());




        userAddress.setProvider(user.getProvider());



        InforUser userDao = new InforUser();
        userAddress.setId(userDao.findIdByEmail(user.getEmail()));
        boolean isSuccess = dao.upsertAddressUser(userAddress);
        System.out.println(userAddress.toString());
        String [] address = userAddress.getAddress().split(",");

        String pickProvince = NoiGui.PICK_PROVINCE;
        String pickDistrict = NoiGui.PICK_DISTRICTS;
        String province = address[address.length - 1];
        String district = address[address.length - 2];
        String weight = "100";
        String value = "1000000";

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




        if (isSuccess) {
          // Đảm bảo đường dẫn chính xác
            session.setAttribute("UserAddress", userAddress);
        } else {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"message\":\"Có lỗi xảy ra khi thêm địa chỉ người dùng.\"}");
        }
    }

//    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        session.setAttribute("userAddress", userAddress);
        req.getRequestDispatcher("index/deliveryAdd.jsp").forward(req, resp);

    }
}
