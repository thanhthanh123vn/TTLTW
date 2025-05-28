package services;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;

import dao.IndexAdminDao;
import dao.LogDAOImp;
import dao.LogDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.LogEntry;
import object.Log_Level;
import object.User;

@WebServlet("/LoginHandle")
public class LoginUser extends HttpServlet {
	private InforUser user;

LogDao logDao = new LogDAOImp();



	@Override

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		user = new InforUser();
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();
		Integer failedAttempts = (Integer) session.getAttribute("failedAttempts");
		if (failedAttempts == null) {
			failedAttempts = 0;
		}

		// Kiểm tra thông tin đăng nhập
		User userCus = user.checkUser(username, password);


		if (userCus != null) { // Đăng nhập thành công
			System.out.println("User login success: " + userCus.getFullName());

			session.setAttribute("user", userCus);
			session.removeAttribute("failedAttempts"); // Reset bộ đếm

			// Lưu cookie
			Cookie userCookie = new Cookie("userC", username);
			userCookie.setMaxAge(60 * 60 * 24);
			resp.addCookie(userCookie);
			String status ="Đăng Nhập thành công";
			var log = new LogEntry();
			log.setIp(req.getRemoteAddr());
			log.setAddress("user");
			log.setLogLevel(Log_Level.INFO);
			log.setBeforeValue("EMPTY");
			log.setAfterValue(user.toString());
			logDao.add(log);
			req.setAttribute("status", status);


			// Điều hướng sau khi đăng nhập
			if ("user".equalsIgnoreCase(userCus.getRole())) {
				req.getRequestDispatcher("products").forward(req, resp);
			} else if ("admin".equalsIgnoreCase(userCus.getRole())) {
				IndexAdminDao dao = new IndexAdminDao();
				session.setAttribute("uid", userCus.getId()); // 👈 THÊM DÒNG NÀY

				LocalDate date = LocalDate.now();
				int year = date.getYear();
				int month = date.getMonthValue();

				double TurnoverYear = dao.TurnoverInYear(year);
				double TurnoverMonth = dao.TurnoverInMonth(month, year);

				req.setAttribute("TurnoverYear", TurnoverYear);
				req.setAttribute("TurnoverMonth", TurnoverMonth);

				req.getRequestDispatcher("admin/index.jsp").forward(req, resp);
			}
		} else { // Đăng nhập thất bại
			failedAttempts++;
			if(failedAttempts >= 5) {


				var log = new LogEntry();
				log.setIp(req.getRemoteAddr());
				log.setAddress("user");
				log.setLogLevel(Log_Level.WARNING);
				log.setBeforeValue("EMPTY");
				log.setAfterValue(user.toString());
				logDao.add(log);

			}
			req.setAttribute("status", "fail");
			session.setAttribute("failedAttempts", failedAttempts);





			req.setAttribute("errorMessage", "Tên người dùng hoặc mật khẩu không đúng!");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}

	// Ghi log đăng nhập hoặc cảnh báo
	synchronized public void logLogin(User user, String level, String message) {
		System.out.println("Log Info user");
		try {
			URL url = new URL("http://localhost:8080/WebMyPham__/log");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setDoOutput(true);

			String jsonInput = String.format(
					"{\"level\": \"%s\", \"message\":\"%s\", \"userId\": %s}",
					level,
					message,
					(user != null ? user.getId() : "null")

			);

			System.out.println("Sending log: " + jsonInput);

			try (OutputStream os = conn.getOutputStream()) {
				byte[] input = jsonInput.getBytes(StandardCharsets.UTF_8);
				os.write(input, 0, input.length);
			}

			int responseCode = conn.getResponseCode();
			System.out.println("Log response: " + responseCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
