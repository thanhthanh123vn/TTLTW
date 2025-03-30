package ServletAdmin.ManagerProduct;

import com.google.gson.Gson;
import dao.LogDAOImp;
import dao.LogDao;
import dao.ProductsDao;
import dao.UserInfDao;
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

@WebServlet("/AddProduct")
public class AddProductAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ProductsDao productsDao = new ProductsDao();
    LogDao logDAO = new LogDAOImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductsDao dao = new ProductsDao();
        BufferedReader reader = request.getReader();
        Gson gson = GsonUtil.getGson();
        Product product = gson.fromJson(reader, Product.class);
        Product befor_product = productsDao.getProductOnId(product.getId());
        boolean isSuccess = dao.insertProduct(product);
        System.out.println("Product received: " +product);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");


        if (isSuccess) {
            var log = new LogEntry();

            log.setIp(request.getRemoteAddr());
            log.setAddress("user");
            log.setLogLevel(Log_Level.INFO);
            log.setBeforeValue(product.toString());
            log.setAfterValue(befor_product.toString());
            logDAO.add(log);
            response.getWriter().write("{\"message\":\"Sản phẩm đã được thêm thành công!\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"message\":\"Có lỗi xảy ra khi thêm sản phẩm.\"}");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
