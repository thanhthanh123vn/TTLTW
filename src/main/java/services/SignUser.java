package services;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.SessionUtil;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		String email = request.getParameter("email");
//
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//		String codeAth = request.getParameter("code");
//		String regexPattern = "^(.+)@(\\S+)$";
//
//
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
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
		String gender = request.getParameter("gender");
		String day = request.getParameter("popup-date");
		String month = request.getParameter("popup-month");
		String year = request.getParameter("popup-year");
		String dob = year + "-" + month + "-" + day;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dateOfBirth = null;
        try {
            dateOfBirth = sdf.parse(dob);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        java.sql.Date sqlDate = new java.sql.Date(dateOfBirth.getTime());

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String codeAth = request.getParameter("code");
		HttpSession session = request.getSession();
		Integer count = 0;
		String codeFromSession = (String) session.getAttribute("verificationCode");
//		SessionUtil.getInstance().putValue(request,"count_singup",count);
		boolean checkInfoUser = inforUser.checkInfoUser(username, email);

		if (!checkInfoUser && codeAth.equals(codeFromSession)) {
			session.removeAttribute("verificationCode");
			//SessionUtil.removeValue(request,"count_singup");


			inforUser.insertUser(username, email, password,gender,sqlDate);
			session.setAttribute("username", username);
			request.setAttribute("showAlert", "true");
			request.getRequestDispatcher("products").forward(request, response);

		} else {
			count++;
//			int count_sesion = Integer.parseInt( SessionUtil.getValue(request,"count_singup").toString()) ;
//			SessionUtil.getInstance().putValue(request,"count_singup",count);
			System.out.println(codeAth);
			request.setAttribute("errorMessage", "Đăng Ký thất bại");
			response.sendRedirect(request.getContextPath()+"/index/signUp.jsp");
		}

	}

}
