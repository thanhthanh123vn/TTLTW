package services;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

import dao.IndexAdminDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.User;

@WebServlet("/LoginHandle")
public class LoginUser extends HttpServlet {
	private InforUser user;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		user = new InforUser();
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		User userCus = user.checkUser(username, password); // Sử dụng mật khẩu đã băm

		if (userCus != null) { // Nếu tài khoản tồn tại
			HttpSession session = req.getSession();
			session.setAttribute("user", userCus); // Lưu thông tin người dùng vào session

			// Lưu cookie nếu muốn ghi nhớ thông tin đăng nhập
			Cookie userCookie = new Cookie("userC", username);
//          Cookie passCookie = new Cookie("passC", password);
			userCookie.setMaxAge(60 * 60 * 24); // Cookie tồn tại trong 1 ngày
//          passCookie.setMaxAge(60 * 60 * 24);
			resp.addCookie(userCookie);
//          resp.addCookie(passCookie);

			if ("user".equalsIgnoreCase(userCus.getRole())) {
				req.getRequestDispatcher("products").forward(req, resp);
			} else if ("admin".equalsIgnoreCase(userCus.getRole())) {
				IndexAdminDao dao = new IndexAdminDao();
				LocalDate date = LocalDate.now();
				int year = date.getYear();
				System.out.println(year);

				int month = date.getMonthValue();
				System.out.println(month);

				double TurnoverYear = dao.TurnoverInYear(year);
				double TurnoverMonth = dao.TurnoverInMonth(month, year);
				System.out.println("Doanh Thu Nam"+TurnoverYear);
				if (TurnoverYear > 0 && TurnoverMonth > 0) {
					req.setAttribute("TurnoverYear", TurnoverYear);
					req.setAttribute("TurnoverMonth", TurnoverMonth);
					req.getRequestDispatcher("admin/index.jsp").forward(req, resp);
					return;
				}
				req.setAttribute("error", "Không thể tải Doanh thu Nam va Thang");
				req.getRequestDispatcher("admin/index.jsp").forward(req, resp);
			}
		} else {
			req.setAttribute("errorMessage", "Tên người dùng hoặc mật khẩu không đúng!");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cookie[] cookies = req.getCookies();
		String username = null;
		String password = null;

		// Lấy thông tin từ cookie nếu có
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("userC")) {
					username = cookie.getValue();
				}
				if (cookie.getName().equals("passC")) {
					password = cookie.getValue();
				}
			}
		}

		if (username != null && password != null) {
			req.setAttribute("username", username);
			req.setAttribute("password", password);
		}
		doPost(req, resp); // Gọi doPost để xử lý logic đăng nhập
	}
}
