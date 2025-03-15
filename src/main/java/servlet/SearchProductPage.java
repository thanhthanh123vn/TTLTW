package servlet;

import com.google.gson.Gson;
import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.Product;

import java.io.IOException;
import java.util.List;

@WebServlet("/danh-muc")
public class SearchProductPage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     ProductsDao productsDao = new ProductsDao();
        // Lấy tham số từ request




        String searchProduct =(String) req.getParameter("name");
        System.out.println(searchProduct);
        if (searchProduct != null && !searchProduct.trim().isEmpty()) {
            // Truy vấn sản phẩm từ cơ sở dữ liệu

            List<Product> products = productsDao.searchProduct(searchProduct);
            req.setAttribute("products", products);
            req.getRequestDispatcher("SearchProduct.jsp").forward(req, resp);






        } else {
            // Nếu tham số tìm kiếm rỗng, trả về lỗi
            System.out.println(" khong tim danh muc");
            req.setAttribute("error","Không tìm thấy sản phẩm");
            req.getRequestDispatcher("SearchProduct.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
