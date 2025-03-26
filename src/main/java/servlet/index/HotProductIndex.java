package servlet.index;

import dao.ProductsDao;
import gson.GsonUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.Product;

import java.io.IOException;
import java.util.List;

@WebServlet("/hotProduct")
public class HotProductIndex extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductsDao dao = new ProductsDao();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        List<Product> products = dao.getHotProduct();
        System.out.println(products.size()+" hot product");
        String json = new GsonUtil().getGson().toJson(products);

        resp.getWriter().write(json);

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
