package servlet.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.User;
import services.InforUser;

import java.io.IOException;

@WebServlet(name = "LoginFacebook" , urlPatterns = "/login")
public class LoginF extends HttpServlet {
    protected  void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String code = request.getParameter("code");
        System.out.println(code);
        LoginFacebook FB = new LoginFacebook();
        String accessToken = FB.getToken(code);
        System.out.println(accessToken);
        User user = FB.getUserInfo(accessToken);
        InforUser u = new InforUser();


        if (user!=null){
           boolean isSucess = u.insertUser(user.getFullName(),user.getEmail(),user.getPassword());
           if(isSucess){
               HttpSession session = request.getSession();
               session.setAttribute("user", user);
               response.sendRedirect("products");
           }else{
               response.sendRedirect("login");
           }

        }
        System.out.println(u);



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }
}
