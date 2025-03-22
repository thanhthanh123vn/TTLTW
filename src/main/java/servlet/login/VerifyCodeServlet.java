package servlet.login;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.io.PrintWriter;

@WebServlet("/verycode")
public class VerifyCodeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Giả lập mã xác thực hợp lệ


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        HttpSession session = request.getSession();
        String VALID_CODE = session.getAttribute("verificationCode").toString();
        PrintWriter out = response.getWriter();

        // Lấy mã từ request
        String userCode = request.getParameter("code");

        // Kiểm tra mã hợp lệ hay không
        if (userCode != null && userCode.equals(VALID_CODE)) {
            out.print("{\"status\": \"success\", \"message\": \"Mã xác thực đúng!\"}");
        } else {
            out.print("{\"status\": \"error\", \"message\": \"Mã xác thực sai!\"}");
        }
        out.flush();
    }
}
