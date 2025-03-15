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

@WebServlet("/flashSale")
public class FlashSale extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        ProductsDao dao = new ProductsDao();
        List<Product>  flashSaleProduct = dao.flashSale();
        System.out.println(flashSaleProduct.size());

        String json = new GsonUtil().getGson().toJson(flashSaleProduct);

        resp.getWriter().write(json);

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
