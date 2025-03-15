package services;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/SignUpUser")
public class SignUpUser extends HttpServlet {
	private InforUser user;

	public void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		user = new InforUser();
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		boolean checkInforUser = user.checkInfoUser(username, email);
		System.out.println(checkInforUser);

		if (!checkInforUser) {
			HttpSession session = req.getSession();
			session.setAttribute("usernameLogin", username);
			user.insertUser(username, password, email);
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		} else {
			req.setAttribute("errorMessage", "Tên người dùng hoặc mật khẩu không đúng!");
			req.getRequestDispatcher("signUp.jsp").forward(req, resp);

		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

}
