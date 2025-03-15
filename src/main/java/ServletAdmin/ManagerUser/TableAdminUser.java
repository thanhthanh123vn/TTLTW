package ServletAdmin.ManagerUser;

import dao.UserInfDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.UserInf;

import java.io.IOException;
import java.util.List;

@WebServlet("/table-admin-User")
public class TableAdminUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserInfDao dao =  new UserInfDao();
        resp.setContentType("text/html");
        List<UserInf> listUserInf = dao.getListUserInf();
        System.out.println(listUserInf.size());
        if(listUserInf.size()>0){
            req.setAttribute("userInf", listUserInf);
            req.getRequestDispatcher("admin/tableEmployees.jsp").forward(req, resp);
            return ;
        }
        req.setAttribute("error", "Không thể load sản phẩm");

    }
}
