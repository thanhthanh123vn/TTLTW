package servlet.PayProduct;

import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/wishlist")
public class WishList extends HttpServlet {
    private List<Product> products;

    @Override
    public void init() throws ServletException {
        products = new ArrayList<>();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy tham số productID từ request (id trong URL)
        String productID = req.getParameter("id");

        if (productID != null) {

                // Tìm sản phẩm từ id
                int id = Integer.parseInt(productID);
                ProductsDao dao = new ProductsDao();
                Product product = dao.getProductById(id);

                // Nếu tìm thấy sản phẩm
                if (product != null) {
                    HttpSession session = req.getSession();

                    // Nếu wishlist chưa tồn tại trong session, tạo mới


                    // Thêm sản phẩm vào wishlist
                    products.add(product);
                    session.setAttribute("Wishlistproduct", products);

                    // Gửi phản hồi thành công
                    resp.setStatus(HttpServletResponse.SC_OK);
                    resp.getWriter().write("Sản phẩm đã được thêm vào wishlist.");
                } else {
                    // Nếu không tìm thấy sản phẩm
                    resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    resp.getWriter().write("Không tìm thấy sản phẩm.");
                }


        } else {
            // Nếu không có tham số id
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Thiếu tham số ID.");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
