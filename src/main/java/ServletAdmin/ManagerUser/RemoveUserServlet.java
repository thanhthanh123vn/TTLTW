package ServletAdmin.ManagerUser;

import com.google.gson.Gson;
import dao.LogDAOImp;
import dao.LogDao;
import dao.UserInfDao;
import gson.GsonUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.LogEntry;
import object.Log_Level;
import object.User;
import object.UserInf;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

@WebServlet("/removeUser")
public class RemoveUserServlet extends HttpServlet {
    UserInfDao userDAO = new UserInfDao();
    LogDao logDAO = new LogDAOImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();


        Gson gson = GsonUtil.getGson();
        UserInf user = gson.fromJson(reader, UserInf.class);
        // Logic xóa người dùng khỏi cơ sở dữ liệu
        try {
            UserInfDao userDAO = new UserInfDao();
             userDAO.deleteUserAndAddress(user.getId());
            var log = new LogEntry();
            log.setIp(request.getRemoteAddr());
            log.setAddress("user");
            log.setLogLevel(Log_Level.DANGER);
            log.setBeforeValue(user.toString());
            log.setAfterValue("User deleted");
            logDAO.add(log);

            response.setStatus(HttpServletResponse.SC_OK);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    }

