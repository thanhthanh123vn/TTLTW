package servlet.ManageUser;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.InforUser;
import dao.Utils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.UserInf;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "RestPasswordUser", urlPatterns = "/resetPassword")
public class ResetPasswordServlet extends HttpServlet {
    Utils utils = new Utils();
    InforUser inforUser = new InforUser();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (token == null || password == null || confirmPassword == null || !password.equals(confirmPassword)) {
            response.sendRedirect("reset-password.jsp?token=" + token + "&error=Mật khẩu không khớp!");
            return;
        }

        // Mã hóa mật khẩu bằng BCrypt
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        try (Connection conn = utils.getConnection()) {
            String sql = "UPDATE users SET password = ? WHERE token = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, hashedPassword);
            stmt.setString(2, token);


            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("login.jsp?message=Đặt lại mật khẩu thành công!");
            } else {
                response.sendRedirect(request.getContextPath()+"/index/reset-password.jsp?token=" + token + "&error=Token không hợp lệ!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("reset-password.jsp?token=" + token + "&error=Lỗi hệ thống!");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
