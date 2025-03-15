package services;

import java.io.IOException;

import dao.InforUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserUtils extends HttpServlet {
    private InforUser user;
    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     
    	user = new InforUser();
        String username = req.getParameter("username");
     
        String password = req.getParameter("password");
        
     
        boolean isValidUser = user.checkUser(username, password);
        
        if (isValidUser) {
           
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } else {
            // Thông báo lỗi nếu đăng nhập không thành công
            req.setAttribute("errorMessage", "Tên người dùng hoặc mật khẩu không đúng!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	
    }
}
