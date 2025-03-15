package servlet.ManageUser;

import dao.InforUser;
import dao.UserInfDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.User;

import java.io.IOException;

@WebServlet("/updateUser")
public class UpdatePasswordUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute( "user" );
        int id = user.getId();
        String password = req.getParameter("password");
        String newPassword = req.getParameter("re-password");
        String confirmPassword = req.getParameter("confirm-password");

        InforUser dao = new InforUser();
        try {
            if(user.getPassword().equals(dao.hashPassword(password)) && newPassword.equals(confirmPassword) ) {
                boolean isSuccess= dao.UpdatePassWord(dao.hashPassword( newPassword) , id);

                if(isSuccess){
                    System.out.println("Thanh cong update password");
                    req.setAttribute("isSuccess","Cập nhập Password thành công");
                    req.getRequestDispatcher("index/changePW.jsp").forward(req, resp);

                }else {
                    req.setAttribute("isSuccess","Cập nhập Password không thành công");
                    req.getRequestDispatcher("index/changePW.jsp").forward(req, resp);
                }


            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
