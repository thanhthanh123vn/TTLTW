package servlet.PayProduct;

import java.io.BufferedReader;
import java.io.IOException;
import com.google.gson.Gson;
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
    UserInf userAddress;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserInfDao dao = new UserInfDao();
        BufferedReader reader = req.getReader();

        Gson gson = GsonUtil.getGson();
         userAddress = gson.fromJson(reader, UserInf.class);
         HttpSession session = req.getSession();
         User user = (User) session.getAttribute("user");
         userAddress.setEmail(user.getEmail());


        userAddress.setId(user.getId());
        userAddress.setAuthId(user.getAuthId());
        userAddress.setProvider(user.getProvider());


        System.out.println(userAddress.toString());

        boolean isSuccess = dao.insertAddressUser(userAddress);



        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

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
