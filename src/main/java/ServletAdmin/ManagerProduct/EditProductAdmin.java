package ServletAdmin.ManagerProduct;

import com.google.gson.Gson;
import dao.ProductsDao;
import gson.GsonUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.Product;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/EditProduct")
public class EditProductAdmin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductsDao dao = new ProductsDao();
        BufferedReader reader = req.getReader();

        // Sử dụng Gson tùy chỉnh để chuyển đổi đối tượng thành JSON

        Gson gson = GsonUtil.getGson();
        Product product = gson.fromJson(reader, Product.class);
        boolean isSuccess  =  dao.updateProduct(product);
        if(isSuccess){
        System.out.println("Cập nhập sản phẩm thành công");
        }else {
            System.out.println("Cập nhập sản phẩm không thành công");
        }
        // Xử lý sản phẩm (ví dụ: lưu vào cơ sở dữ liệu)
        // Bạn có thể thêm mã xử lý dữ liệu ở đây
        String json = gson.toJson(product);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write("{\"message\":\"Sản phẩm đã được thêm thành công!\"}");
    }
}
