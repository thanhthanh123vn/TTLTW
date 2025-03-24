package ServletAdmin.ManagerUser;

import com.google.gson.Gson;
import dao.UserInfDao;
import gson.GsonUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        Gson gson = GsonUtil.getGson();
        UserInf user = gson.fromJson(reader, UserInf.class);

        // Logic xóa người dùng khỏi cơ sở dữ liệu
        try {
            UserInfDao userDAO = new UserInfDao();
             userDAO.deleteUserAndAddress(user.getId());
             logDeleteUser(user,"DANGER","delete user");
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
    public void logDeleteUser(UserInf user,String level, String message) {
        try {
            URL url = new URL("http://localhost:8080/WebMyPham__/log");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInput = String.format(
                    "{\"level\": \"%s\", \"message\":\"%s\", \"userId\": %s, \"preData\": \"%s\"}",
                    level,
                    message,
                    (user != null ? user.getId() : "null"),
                    (user != null ? user.toString() : "unknown")
            );

            System.out.println("Sending log: " + jsonInput);

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInput.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            int responseCode = conn.getResponseCode();
            System.out.println("Log response: " + responseCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    }

