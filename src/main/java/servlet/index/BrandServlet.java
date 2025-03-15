package servlet.index;

import com.google.gson.Gson;
import dao.Utils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/brandList")
public class BrandServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Đặt loại nội dung trả về là JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Utils utils = new Utils();

        // Kết nối đến cơ sở dữ liệu (giả định bạn có sẵn kết nối DatabaseUtils)
        try (Connection conn = utils.getConnection()) {
            String sql = "SELECT id, name, image FROM brands";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            // Danh sách thương hiệu
            List<Map<String, String>> brands = new ArrayList<>();
            while (rs.next()) {
                Map<String, String> brand = new HashMap<>();
                brand.put("id", String.valueOf(rs.getInt("id")));
                brand.put("name", rs.getString("name"));
                brand.put("image", rs.getString("image"));
                brands.add(brand);
            }

            // Trả về dữ liệu JSON
            String json = new Gson().toJson(brands);
            response.getWriter().write(json);

        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
