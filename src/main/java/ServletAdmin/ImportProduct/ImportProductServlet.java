package ServletAdmin.ImportProduct;
import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;
import object.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ImportProductServlet", urlPatterns = {"/ImportProduct"})
public class ImportProductServlet extends HttpServlet {
    private ProductsDao productDAO;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductsDao();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            // Fetch all products from database
            List<Product> products = productDAO.listProducts();
            
            // Convert products to a simpler format for the dropdown
            List<Map<String, Object>> productList = new ArrayList<>();
            for (Product product : products) {
                Map<String, Object> productMap = new HashMap<>();
                productMap.put("id", product.getId());
                productMap.put("name", product.getName());
                productMap.put("price", product.getPrice());
                productList.add(productMap);
            }

            // Send JSON response
            String jsonResponse = gson.toJson(productList);
            response.getWriter().write(jsonResponse);
            
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Lỗi khi lấy danh sách sản phẩm: " + e.getMessage());
            response.getWriter().write(gson.toJson(error));
        }
    }
} 