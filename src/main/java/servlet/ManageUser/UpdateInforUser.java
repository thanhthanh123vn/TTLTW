package servlet.ManageUser;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.User;
import services.InforUser;

import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet("/updateInforUser")
public class UpdateInforUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String date = request.getParameter("date");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String birthDate = year + "-" + month + "-" + date;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = null;
        try {
            date1 = sdf.parse(birthDate);

        } catch (Exception e) {
            e.printStackTrace();
        } // Xử lý lỗi nếu chuỗi không đúng định dạng

        InforUser userDAO = new InforUser();
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            user.setEmail(email);
            user.setFullName(name);
            user.setMalle(gender);
            user.setDate(date1);

            boolean updateUser = userDAO.updateUser(user);
            boolean updateUserAddress = userDAO.updateUserAddress(user);
            if(updateUser && updateUserAddress) {
            System.out.println("Update User Thành công");
            request.getSession().setAttribute("user", user);
            response.sendRedirect("index/inforUser.jsp");
            }else {
                System.out.println("Update User khong Thành công");
                request.setAttribute("errorMessage" ,"Không thể cập nhập thông tin người dùng");
                response.sendRedirect("index/inforUser.jsp");
            }

        }
    }
}
