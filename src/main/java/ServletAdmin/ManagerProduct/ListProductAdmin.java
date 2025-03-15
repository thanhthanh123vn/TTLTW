package ServletAdmin.ManagerProduct;

import com.google.gson.Gson;
import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.Product;
import gson.GsonUtil;

import java.io.IOException;
import java.util.List;

@WebServlet("/listProducts")
public class ListProductAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        ProductsDao dao = new ProductsDao();
        List<Product> productList = dao.listProducts();

        if (productList == null || productList.isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
            resp.getWriter().write("{\"message\":\"No products found\"}");
            return;
        }

        try {
            System.out.println(productList.size() + " Products");

            // Sử dụng GsonUtil để chuyển đổi danh sách sản phẩm thành JSON
            Gson gson = GsonUtil.getGson();
            String json = gson.toJson(productList);
            resp.getWriter().write(json);

        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
