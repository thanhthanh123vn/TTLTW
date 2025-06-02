package servlet.PayProduct;

import dao.FavoriteProductDao;
import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.FavoriteProducts;
import object.Product;
import object.User;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/wishlist", "/cancelWishlist"})
public class WishList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        FavoriteProductDao dao = new FavoriteProductDao();
        List<Product> wishlist = dao.getFavoriteListByUserId(user.getId());

        session.setAttribute("Wishlistproduct", wishlist);
        req.setAttribute("wishlist", wishlist);
        req.getRequestDispatcher("wishlist.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Chưa đăng nhập.");
            return;
        }

        String productID = req.getParameter("id");
        String path = req.getServletPath();
        int user_id = user.getId();
        FavoriteProductDao favoriteDao = new FavoriteProductDao();

        if (productID == null) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Thiếu tham số ID.");
            return;
        }

        int product_id = Integer.parseInt(productID);

        if (path.equals("/wishlist")) {
            ProductsDao productsDao = new ProductsDao();
            Product product = productsDao.getProductById(product_id);

            if (product != null) {
                boolean isSuccess = favoriteDao.addFavorite(new FavoriteProducts(user_id, product_id));
                if (isSuccess) {
                    List<Product> updatedWishlist = favoriteDao.getFavoriteListByUserId(user_id);
                    session.setAttribute("Wishlistproduct", updatedWishlist);
                    resp.setStatus(HttpServletResponse.SC_OK);
                    resp.getWriter().write("Sản phẩm đã được thêm vào wishlist.");
                } else {
                    resp.setStatus(HttpServletResponse.SC_CONFLICT);
                    resp.getWriter().write("Sản phẩm đã có trong danh sách.");
                }
            } else {
                resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                resp.getWriter().write("Không tìm thấy sản phẩm.");
            }

        } else if (path.equals("/cancelWishlist")) {
            boolean isDeleted = favoriteDao.deleteFavorite(user_id, product_id);
            if (isDeleted) {
                List<Product> updatedWishlist = favoriteDao.getFavoriteListByUserId(user_id);
                session.setAttribute("Wishlistproduct", updatedWishlist);
            }
            resp.sendRedirect("wishlist");
        }
    }
}
