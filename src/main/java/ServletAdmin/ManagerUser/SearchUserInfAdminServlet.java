package ServletAdmin.ManagerUser;

import com.google.gson.Gson;
import dao.UserInfDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.UserInf;

import java.io.IOException;
import java.util.List;
@WebServlet("/searchUserInf")
public class SearchUserInfAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Đặt loại nội dung trả về là JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        UserInfDao dao = new UserInfDao();
        String username = request.getParameter("username");
        System.out.println(username);
        try {


            List<UserInf> userList = dao.searchUserInf(username);
            // Trả về dữ liệu JSON
            System.out.println(userList.size()+" Haha");
            String json = new Gson().toJson(userList);
            response.getWriter().write(json);






        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
