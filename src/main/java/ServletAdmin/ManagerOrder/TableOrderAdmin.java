package ServletAdmin.ManagerOrder;

import dao.OrderDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.Order;

import java.io.IOException;
import java.util.List;

@WebServlet("/order-table")
public class TableOrderAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDao dao = new OrderDao();

        List<Order> userOrder = dao.getUserOrder();
        System.out.println(userOrder.toString());
        if(!userOrder.isEmpty()){
            req.setAttribute("userOrder", userOrder);
            System.out.println(userOrder.toString());
            req.getRequestDispatcher("admin/managerOrder.jsp").forward(req, resp);
            return ;


        }
        req.setAttribute("errorMessage","Không thể tải danh sách Order Table");
        req.getRequestDispatcher("admin/managerOrder.jsp").forward(req, resp);
    }
}
