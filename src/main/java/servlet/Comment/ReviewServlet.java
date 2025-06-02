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

        ReviewDao dao = null;
        try {
            // 2. Lấy dữ liệu từ form
            int userId = user.getId();
            int productId = Integer.parseInt(request.getParameter("productId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment").trim();

            // Validate dữ liệu
            if (rating < 1 || rating > 5) {
                request.setAttribute("errorMsg", "Đánh giá phải từ 1-5 sao.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            if (comment.isEmpty() || comment.length() > 500) {
                request.setAttribute("errorMsg", "Bình luận không được để trống và không quá 500 ký tự.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // 3. Check xem user đã mua rồi chưa và chưa đánh giá
            dao = new ReviewDao();
            boolean alreadyPurchased = dao.hasPurchased(userId, productId);
            boolean alreadyReviewed = dao.hasReviewed(userId, productId);

            if (!alreadyPurchased) {
                request.setAttribute("errorMsg", "Bạn chưa mua sản phẩm này, không thể đánh giá.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            if (alreadyReviewed) {
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

            if (success) {
                // 5. Redirect về trang chi tiết sản phẩm với thông báo thành công
                session.setAttribute("successMsg", "Cảm ơn bạn đã đánh giá sản phẩm!");
                response.sendRedirect("productDetail?id=" + productId);
            } else {
                request.setAttribute("errorMsg", "Có lỗi xảy ra khi gửi đánh giá.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMsg", "Dữ liệu không hợp lệ.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } finally {
            if (dao != null) {
                dao.close();
            }
        }
    }
}
