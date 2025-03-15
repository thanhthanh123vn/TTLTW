package servlet.PayProduct;

import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.Product;
import object.cart.Cart;
import object.cart.ProductCart;

import java.io.IOException;
import java.util.List;

@WebServlet("/cancelOrder")
public class CancelOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        ProductsDao dao = new ProductsDao();



        HttpSession session = req.getSession();
        Product product = (Product) session.getAttribute("productQL");
        Cart cartData = (Cart) session.getAttribute("cartQL");



        if(product != null) {
            session.removeAttribute("productQL");
            req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);
        }else{
            if(cartData != null) {
                cartData.remove(Integer.parseInt(id));
                session.removeAttribute("cartQL");
                session.setAttribute("cartQL", cartData);
                req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);
            }
        }



    }
}
