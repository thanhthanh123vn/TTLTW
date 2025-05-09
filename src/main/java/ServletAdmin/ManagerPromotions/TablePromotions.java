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

import java.io.PrintWriter;

@WebServlet("/listPromotions")
public class TablePromotions extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy dữ liệu từ database
        PromotionsDao dao = new PromotionsDao();
        List<Promotions> promotions = dao.getAllPromotions();
        System.out.println(promotions.size()+"Promotions");




        if(promotions.isEmpty()) {
            req.setAttribute("error", "Không thể load mã giảm giá");
        }else{
            req.setAttribute("promotions", promotions);

        }


        req.getRequestDispatcher("admin/ManagerPromotions.jsp").forward(req, resp);
    }
}


