package filters;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.User;

// Lọc đường dẫn liên quan đến quản trị (admin)
@WebFilter("/admin/*")
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo nếu cần
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        HttpSession session = req.getSession(true);

        if (session != null) {
            String role = "";
            User user = (User) session.getAttribute("user");
            if (user != null) {

             role = user.getRole(); // Lấy thông tin role từ session

            }
            if ("admin".equalsIgnoreCase(role)) {
                // Nếu là admin, cho phép truy cập
                System.out.println("admin");
                chain.doFilter(request, response);
                return;
            }
        }

        // Nếu không phải admin, chuyển hướng đến trang lỗi hoặc login
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }

    @Override
    public void destroy() {
        // Dọn dẹp nếu cần
    }
}
