package services;
import dao.CategoryDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import object.Categories;
import object.Product;
import dao.ProductsDao;
import object.User;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int PRODUCTS_PER_PAGE = 8;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductsDao productDetails = new ProductsDao();
        CategoryDao categoryDao = new CategoryDao();
        List<Product> topProduct = productDetails.getTop10Products();

        // Get page number from request parameter, default to 1 if not specified
        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            page = 1;
        }

        int startIndex = (page - 1) * PRODUCTS_PER_PAGE;

        try {
            List<Product> products = productDetails.getProductsPaginated(startIndex, PRODUCTS_PER_PAGE);
            List<Categories> categories = categoryDao.getAllCategories(startIndex);
            HttpSession session = request.getSession();

            // Get total number of products for pagination
            int totalProducts = productDetails.getTotalProductCount();

            int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
            productDetails.closeConnection();
            if (products != null && !products.isEmpty()) {
                request.setAttribute("products", products);
                request.setAttribute("categories", categories);
                request.setAttribute("startIndex", startIndex);
                request.setAttribute("topProduct", topProduct);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("totalProducts", totalProducts);

                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Không có sản phẩm nào được tìm thấy!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã xảy ra lỗi khi tải danh sách sản phẩm!");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}