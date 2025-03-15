package servlet.ManageUser;

import dao.InforUser;
import dao.UserInfDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.Email;

import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/RestPassword")
public class RestPassword extends HttpServlet {
    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Access-Control-Allow-Origin", "*");  // Cho phép mọi nguồn
        response.setHeader("Access-Control-Allow-Methods", "GET, POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");

        String toEmail = (String) request.getParameter("email");
        System.out.println(toEmail);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String maXacNhan = generateVerificationCode(); // Hàm tạo mã xác nhận
        String tieuDe = "Mã xác nhận tài khoản của bạn";
        String noiDung = "<html>" + "<body>" + "<h2>Xin chào,</h2>"
                + "<p>Cảm ơn bạn đã đăng ký tài khoản với chúng tôi.</p>"
                + "<p>Đây là mã xác nhận tài khoản của bạn:</p>" + "<h3 style='color: blue;'>" + maXacNhan + "</h3>"
                + "<p>Vui lòng nhập mã này để hoàn tất đăng ký.</p>" + "<br>" + "<p>Trân trọng,</p>"
                + "<p><strong>Đội ngũ hỗ trợ</strong></p>" + "</body>" + "</html>";
        // Gửi email bằng lớp Email
        boolean emailSent = Email.sendEmail(toEmail, tieuDe, noiDung);
        InforUser dao = new InforUser();
        boolean updatePass = false;
        try {

         updatePass = dao.UpdatePassWord(dao.hashPassword(maXacNhan), toEmail);
        } catch (Exception e) {
            e.printStackTrace();
        }



        // Phản hồi dựa trên kết quả gửi email
        if (emailSent && updatePass) {
            HttpSession session = request.getSession();
            System.out.println("Update Pasword thanh cong");


            response.getWriter().write("success");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            response.getWriter().write("failure");
        }
    }

    public String generateVerificationCode() {
        int code = (int) (Math.random() * 900000) + 100000; // Tạo mã ngẫu nhiên 6 chữ số
        return String.valueOf(code);
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // TODO Auto-generated method stub
        System.out.println("Dang gui Email");
        processRequest(request, response);

    }

}
