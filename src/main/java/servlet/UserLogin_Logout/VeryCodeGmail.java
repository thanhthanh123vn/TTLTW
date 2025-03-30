package servlet.UserLogin_Logout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import org.json.JSONObject;

@WebServlet("/very")
public class VeryCodeGmail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();
        JSONObject jsonResponse = new JSONObject();

        HttpSession session = req.getSession();
        String codeParam = req.getParameter("code");

        if (codeParam == null || session.getAttribute("verificationCode") == null) {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Mã xác thực không hợp lệ hoặc hết hạn!");
        } else {
            int code = Integer.parseInt(codeParam);
            int codeVail = Integer.parseInt(session.getAttribute("verificationCode").toString());

            if (code == codeVail) {
                jsonResponse.put("status", "success");
                jsonResponse.put("message", "Mã xác thực đúng!");
                session.removeAttribute("verificationCode"); // Xóa mã sau khi xác thực thành công
            } else {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Mã xác thực không đúng!");
            }
        }

        out.print(jsonResponse.toString());
        out.flush();
    }
}
