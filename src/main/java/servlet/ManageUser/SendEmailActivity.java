package servlet.ManageUser;

import dao.InforUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.Email;
import java.util.UUID;

import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/sendEmailActivity")
public class SendEmailActivity extends HttpServlet {
    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Access-Control-Allow-Origin", "*");  // Cho phép mọi nguồn
        response.setHeader("Access-Control-Allow-Methods", "GET, POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        String token = UUID.randomUUID().toString();
        String linkDatLaiMatKhau = "/index/reset-password.jsp?token="+token;
        String toEmail = (String) request.getParameter("email");
        String fullName = (String) request.getParameter("username");
        System.out.println(toEmail);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String tieuDe = "Mã xác nhận tài khoản của bạn";
        String noiDung = "<html>" + "<body>" + "<h2>Xin chào,"+fullName+"</h2>"
                + "<p>Vui lòng bấm Đặt lại mật khẩu để thiết lập lại mật khẩu mới.</p>"
                +"<p><a href='http://localhost:8080/WebMyPham__" + linkDatLaiMatKhau + "' style='color: black; background-color:aqua; padding:15px; font-weight: bold;'>Đặt lại mật khẩu</a></p>"
                +  "<br>" + "<p>Trân trọng,</p>"
                + "<p><strong>Đội ngũ hỗ trợ</strong></p>" + "</body>" + "</html>";
        // Gửi email bằng lớp Email
        boolean emailSent = Email.sendEmail(toEmail, tieuDe, noiDung);
        if (emailSent) {
            InforUser inforUser = new InforUser();
            inforUser.UpdateToken(toEmail,token);
        }

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
        response.sendRedirect(request.getContextPath()+"/index/forgot-pass.jsp");

    }

}
