package servlet.Comment;

import dao.CommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import object.Comment;
import object.User;

import java.io.IOException;

@WebServlet("/submitComment")
public class CommentServlet extends HttpServlet {
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

        CommentDAO dao = null;
        try {
            // 2. Lấy dữ liệu từ form
            int userId = user.getId();
            int productId = Integer.parseInt(request.getParameter("productId"));
            String content = request.getParameter("content").trim();

            // Validate dữ liệu
            if (content.isEmpty() || content.length() > 500) {
                session.setAttribute("errorMsg", "Bình luận không được để trống và không quá 500 ký tự.");
                response.sendRedirect("productDetail?id=" + productId);
                return;
            }

            // 3. Tạo đối tượng Comment và lưu vào DB
            Comment comment = new Comment();
            comment.setUserId(userId);
            comment.setProductId(productId);
            comment.setContent(content);
            comment.setUsername(user.getFullName());

            dao = new CommentDAO();
            boolean success = dao.addComment(comment);

            if (success) {
                // 4. Redirect về trang chi tiết sản phẩm với thông báo thành công
                session.setAttribute("successMsg", "Bình luận của bạn đã được gửi thành công!");
                response.sendRedirect("productDetail?id=" + productId);
            } else {
                session.setAttribute("errorMsg", "Có lỗi xảy ra khi gửi bình luận.");
                response.sendRedirect("productDetail?id=" + productId);
            }

        } catch (NumberFormatException e) {
            session.setAttribute("errorMsg", "Dữ liệu không hợp lệ.");
            response.sendRedirect("productDetail?id=" + request.getParameter("productId"));
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMsg", "Có lỗi xảy ra: " + e.getMessage());
            response.sendRedirect("productDetail?id=" + request.getParameter("productId"));
        } finally {
            if (dao != null) {
                dao.close();
            }
        }
    }
} 