package servlet.index;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dao.ProductsDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.LocalDateTimeAdapter;
import object.Product;

import java.io.IOException;

import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/searchProduct")
public class SearchProductServlet extends HttpServlet {
    private ProductsDao productDAO = new ProductsDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");


        System.out.println(name+" searchProduct");

        if (name != null && !name.trim().isEmpty()) {
            System.out.println("searchProduct+"+name);
            List<Product> products = productDAO.searchProduct(name);
            System.out.println("searchProduct+"+products.toString());
            int countProduct = productDAO.countsearchProduct(name);

            // Tạo đối tượng để gói dữ liệu trả về
            SearchResponse searchResponse = new SearchResponse(products, countProduct);
            //System.out.println(searchResponse.products);
            // Chuyển đổi đối tượng sang JSON
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                    .create();

            String jsonResponse = gson.toJson(searchResponse);
            System.out.println(jsonResponse); // Log dữ liệu JSON trả về


            // Gửi JSON về client
            response.getWriter().write(jsonResponse);
        } else {
            // Trả về lỗi nếu không có tham số name
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Product name is required.\"}");
        }
    }

    // Lớp nội bộ để gói kết quả trả về
    private static class SearchResponse {
        private List<Product> products;
        private int countProduct;

        public SearchResponse(List<Product> products, int countProduct) {
            this.products = products;
            this.countProduct = countProduct;
        }

        // Getter và Setter nếu cần
    }
}
