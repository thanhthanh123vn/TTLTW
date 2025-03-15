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

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/AddPromotion")
public class AddPromotion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PromotionsDao dao = new PromotionsDao();
        BufferedReader reader = req.getReader();
        Gson gson = GsonUtil.getGson();
        Promotions promotion = gson.fromJson(reader, Promotions.class);
        boolean isSuccess  =  dao.addPromotion(promotion);
        if(isSuccess){
            System.out.println("Thêm mã giảm giá thành công");
        }else {
            System.out.println("Thêm mã giảm giá không thành công");
        }
        // Xử lý sản phẩm (ví dụ: lưu vào cơ sở dữ liệu)
        // Bạn có thể thêm mã xử lý dữ liệu ở đây
        String json = gson.toJson(promotion);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write("{\"message\":\"mã giảm giá  đã thêm thành công !\"}");
    }

}
