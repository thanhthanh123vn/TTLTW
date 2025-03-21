package servlet.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.GoogleAccount;
import object.User;
import services.InforUser;
import services.Login.GoogleLogin;

import java.io.IOException;

@WebServlet(name = "LoginGoogle" , urlPatterns = "/loginGoogle")
public class LoginGoogleServlet extends HttpServlet {
    protected  void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");

        GoogleLogin ggLogin = new GoogleLogin();

        String accessToken = ggLogin.getToken(code);
        System.out.println(accessToken);
        GoogleAccount googleAccount = ggLogin.getUserInfo(accessToken);
        User u =  new User();
        u.setFullName(googleAccount.getName());

        HttpSession session = request.getSession();
        System.out.println(googleAccount);
        if(googleAccount !=null){
        session.setAttribute("user", u);

        response.sendRedirect("products");
        }
        else
            response.sendRedirect("login.jsp");








    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
}
