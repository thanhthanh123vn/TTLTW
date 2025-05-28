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

@WebServlet("/ManagerProduct/removeProduct")
public class RemoveProductAdmin extends HttpServlet {
    ProductsDao productsDao = new ProductsDao();
    LogDao logDAO = new LogDAOImp();
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        Gson gson = GsonUtil.getGson();
        Product product = gson.fromJson(reader, Product.class);
        System.out.println(product.toString()+"removeProduct");

        // Logic xóa người dùng khỏi cơ sở dữ liệu
        try {
            ProductsDao productDao = new ProductsDao();
           boolean deleteP = productDao.deleteProduct(product.getId());
           if(deleteP){
               var log = new LogEntry();
               log.setIp(request.getRemoteAddr());
               log.setAddress("Product");
               log.setLogLevel(Log_Level.DANGER);
               log.setBeforeValue(productDao.toString());
               log.setAfterValue("Product deleted");
               logDAO.add(log);

             response.setStatus(HttpServletResponse.SC_OK);
           }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
