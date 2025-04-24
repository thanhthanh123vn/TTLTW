package servlet.ManageUser;

import com.google.gson.Gson;
import dao.FavoriteProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.FavoriteProducts;
import object.Product;
import object.User;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "FavoriteProducts " , urlPatterns = "/favoriteProducts ")
public class FavoriteProductsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Đọc JSON từ body
        HttpSession session = request.getSession();
        BufferedReader reader = request.getReader();
        StringBuilder jsonBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBuilder.append(line);
        }
        String json = jsonBuilder.toString();
        User user =(User) session.getAttribute("user");
        int id = user.getId();

        // Chuyển JSON thành đối tượng Java (sử dụng thư viện như Gson)
        Gson gson = new Gson();
        Product cartItem = gson.fromJson(json, Product.class);
        FavoriteProductDao dao = new FavoriteProductDao();
        FavoriteProducts favoriteProducts = new FavoriteProducts();
        favoriteProducts.setUserId(id);
        favoriteProducts.setProductId(cartItem.getId());

        session.setAttribute("favoriteProducts", favoriteProducts);

        boolean isSuccess = dao.addFavorite(favoriteProducts);
        if(isSuccess){
            session.setAttribute("favoriteProducts", favoriteProducts);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            String jsonResponse = "{\"success\":" + isSuccess + "}";
            response.getWriter().write(jsonResponse);


        }else {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            String jsonResponse = "{\"success\":false}";
        }





        // Trả response

    }

}

