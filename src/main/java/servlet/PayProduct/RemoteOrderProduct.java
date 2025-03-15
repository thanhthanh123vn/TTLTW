package servlet.PayProduct;

import dao.OrderDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.User;

import java.io.IOException;

@WebServlet("/remoteOrderProduct")
public class RemoteOrderProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDao dao = new OrderDao() ;
        User user = (User) req.getSession().getAttribute("user");
        int id = user.getId();

        int productId = Integer.parseInt(req.getParameter("productId"));

        boolean isROrder = dao.removerOrder(id);
        boolean isROrderDetail = dao.removerOrderDetail(id,productId);
        if(isROrder && isROrderDetail){
            req.setAttribute("isSuccess", "Hủy đơn hàng thành công");
            req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);

        }else{
            req.setAttribute("errorMessage", "Hủy đơn hàng không thành công");
            req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);
        }








    }
}
