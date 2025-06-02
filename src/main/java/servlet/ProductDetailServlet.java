package servlet;

import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.Product;
import object.ProductDetail;
import dao.ReviewDao;
import object.ProductReview;
import object.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/productDetail")
public class ProductDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy ID sản phẩm từ URL
            String productId = request.getParameter("id");
            if (productId == null || productId.isEmpty()) {
                throw new IllegalArgumentException("Product ID is required");
            }
            ProductsDao productsDao = new ProductsDao();

            // Lấy thông tin sản phẩm từ cơ sở dữ liệu
            Product product = productsDao.getProductById(Integer.parseInt(productId));
            if (product == null) {
                throw new NullPointerException("Product not found for ID: " + productId);
            }


            ProductDetail productDetail = product.getProductDetail();
            List<String> listImage = productsDao.getImageProductDetail(Integer.parseInt(productId));
            System.out.println(listImage.size()+" ListImage");

//            System.out.println( " ProductDetails "+productDetail.toString());
//            System.out.println(" Product "+product.toString());
            if (productDetail == null) {
                throw new NullPointerException("Product detail not found for product ID: " + productId);
            }

            // Đặt thông tin sản phẩm vào request scope
            request.setAttribute("product", productDetail);
            request.setAttribute("listImage", listImage);
            request.setAttribute("products", product);
            HttpSession session = request.getSession();

            List<Product> viewedList = (List<Product>) session.getAttribute("viewedList");

            if (viewedList == null) {
                viewedList = new ArrayList<>();
            }
            // Kiểm tra nếu chưa có thì thêm vào
            boolean exists = viewedList.stream().anyMatch(p -> p.getId()==(product.getId()));
            if (!exists && viewedList.size()<5) {
                viewedList.add(product);
            }
            // Lưu lại vào session
            session.setAttribute("viewedList", viewedList);
            System.out.println(viewedList.size()+" viewedList");

            // Lấy đánh giá sản phẩm từ database
            ReviewDao reviewDao = new ReviewDao();
            List<ProductReview> reviews = reviewDao.getReviewsByProductId(Integer.parseInt(productId));
            request.setAttribute("reviews", reviews);
            User user = (User) session.getAttribute("user");
            boolean canReview = false;
            if (user != null) {
                canReview = reviewDao.hasPurchased(user.getId(), Integer.parseInt(productId))
                        && !reviewDao.hasReviewed(user.getId(), Integer.parseInt(productId));
            }
            request.setAttribute("canReview", canReview);

            reviewDao.close();

            // Chuyển tiếp đến trang chi tiết sản phẩm (JSP)
            request.getRequestDispatcher("detailsProduct.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(); // Log lỗi để debug
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }
}

