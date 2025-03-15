package services;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.regex.Pattern;

/**
 * Servlet implementation class SignUser
 */
@WebServlet("/SignUser")
public class SignUser extends HttpServlet {
	InforUser inforUser;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUser() {
		super();
		// TODO Auto-generated constructor stub

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String codeAth = request.getParameter("code");
		String regexPattern = "^(.+)@(\\S+)$";

		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	public static boolean patternMatches(String emailAddress, String regexPattern) {
	    return Pattern.compile(regexPattern)
	      .matcher(emailAddress)
	      .matches();
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		inforUser = new InforUser();

		String email = request.getParameter("email");

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String codeAth = request.getParameter("code");
		HttpSession session = request.getSession();
		String codeFromSession = (String) session.getAttribute("verificationCode");

		boolean checkInfoUser = inforUser.checkInfoUser(username, email);

		if (!checkInfoUser && codeAth.equals(codeFromSession)) {
			System.out.println("SignUp");
			inforUser.insertUser(username, email, password);
			session.setAttribute("username", username);
			request.setAttribute("showAlert", "true");
			request.getRequestDispatcher("index.jsp").forward(request, response);

		} else {
			System.out.println(codeAth);
			request.setAttribute("errorMessage", "true");
			response.sendRedirect("index/signUp.jsp");
		}

	}

}
