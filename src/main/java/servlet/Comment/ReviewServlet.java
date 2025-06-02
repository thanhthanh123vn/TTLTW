package servlet.Comment;

import dao.ReviewDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import object.ProductReview;
import object.User;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@WebServlet("/submitReview")
public class ReviewServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1. Kiểm tra user đã đăng nhập chưa
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Chưa login => chuyển về trang login
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 2. Lấy dữ liệu từ form
            int userId = user.getId();
            int productId = Integer.parseInt(request.getParameter("productId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment").trim();

            // 3. Check xem user đã mua rồi chưa và chưa đánh giá
            ReviewDao dao = new ReviewDao();
            boolean alreadyPurchased = dao.hasPurchased(userId, productId);
            boolean alreadyReviewed = dao.hasReviewed(userId, productId);

            if (!alreadyPurchased) {
                // Chưa mua => không cho đánh giá
                request.setAttribute("errorMsg", "Bạn chưa mua sản phẩm này, không thể đánh giá.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            if (alreadyReviewed) {
                // Đã đánh giá rồi => không cho đánh giá lại
                request.setAttribute("errorMsg", "Bạn chỉ được đánh giá 1 lần cho sản phẩm này.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // 4. Tạo đối tượng ProductReview và lưu vào DB
            ProductReview review = new ProductReview(
                    userId,
                    productId,
                    rating,
                    comment,
                    Timestamp.valueOf(LocalDateTime.now())
            );
            boolean success = dao.addReview(review);
            dao.close();

            if (success) {
                // 5. Redirect về trang chi tiết sản phẩm (với productId)
                response.sendRedirect("productDetail?id=" + productId);
            } else {
                request.setAttribute("errorMsg", "Có lỗi xảy ra khi gửi đánh giá.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
