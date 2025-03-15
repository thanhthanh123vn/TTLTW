package ServletAdmin.ManagerPromotions;

import com.google.gson.Gson;
import dao.PromotionsDao;
import gson.GsonUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.Promotions;

import java.io.IOException;
import java.util.List;

@WebServlet("/lProducts")
public class ListPromotions extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PromotionsDao dao = new PromotionsDao();

        List<Promotions> promotions = dao.getAllPromotions();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        if (promotions == null || promotions.isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
            resp.getWriter().write("{\"message\":\"No products found\"}");
            return;
        }

        try {
            System.out.println(promotions.size() + " Products");

            // Sử dụng GsonUtil để chuyển đổi danh sách sản phẩm thành JSON
            Gson gson = GsonUtil.getGson();
            String json = gson.toJson(promotions);
            resp.getWriter().write(json);

        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

    }
}
