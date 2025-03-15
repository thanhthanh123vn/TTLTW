package ServletAdmin.ManagerUser;

import com.google.gson.Gson;
import dao.UserInfDao;
import gson.GsonUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.UserInf;

import java.io.BufferedReader;
import java.io.IOException;
@WebServlet("/EditUser")
public class EditUserAdmin extends HttpServlet {
    UserInfDao userDAO = new UserInfDao();
    LogDao logDAO = new LogDAOImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        Gson gson = GsonUtil.getGson();
        UserInf user = gson.fromJson(reader, UserInf.class);

        // Logic thêm người dùng vào cơ sở dữ liệu
        try {
            UserInfDao userDAO = new UserInfDao();
            userDAO.updateUserAndAddress(user);
            var log = new LogEntry();
            log.setIp(request.getRemoteAddr());
            log.setAddress("user");
            log.setLogLevel(Log_Level.ALERT);
            log.setBeforeValue(user.toString());
            log.setAfterValue(user.toString());
            logDAO.add(log);
            request.setAttribute("status", status);
            request.setAttribute("user", user);
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
