package servlet.index;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.User;
import services.InforUser;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/UpdateInfoUser")
public class UpdateInforUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Đọc dữ liệu JSON từ yêu cầu
        InforUser inforUser = new InforUser();
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        User user = gson.fromJson(reader, User.class);

        // Thực hiện cập nhật thông tin người dùng (ví dụ: lưu vào cơ sở dữ liệu)
        boolean updateSuccess = inforUser.updateUser(user);

        if (updateSuccess) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }


}
