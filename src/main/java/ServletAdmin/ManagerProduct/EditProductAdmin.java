package ServletAdmin.ManagerProduct;

import com.google.gson.Gson;
import dao.LogDAOImp;
import dao.LogDao;
import dao.ProductsDao;
import gson.GsonUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.LogEntry;
import object.Log_Level;
import object.Product;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/EditProduct")
public class EditProductAdmin extends HttpServlet {
    ProductsDao productsDao = new ProductsDao();
    LogDao logDAO = new LogDAOImp();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductsDao dao = new ProductsDao();
        BufferedReader reader = req.getReader();

        // Sử dụng Gson tùy chỉnh để chuyển đổi đối tượng thành JSON

        Gson gson = GsonUtil.getGson();
        Product product = gson.fromJson(reader, Product.class);
        Product before_product = productsDao.getProductOnId(product.getId());
        boolean isSuccess  =  dao.updateProduct(product);
        if(isSuccess){
            var log = new LogEntry();

            log.setIp(req.getRemoteAddr());
            log.setAddress("user");
            log.setLogLevel(Log_Level.INFO);
            log.setBeforeValue(before_product.toString());
            log.setAfterValue(product.toString());
            logDAO.add(log);
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
