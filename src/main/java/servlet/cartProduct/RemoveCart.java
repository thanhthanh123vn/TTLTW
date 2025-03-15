package servlet.cartProduct;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.cart.Cart;

import java.io.IOException;

@WebServlet("/removeProductFromCart")
public class RemoveCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy ID sản phẩm từ yêu cầu
        String productIdStr = req.getParameter("productId");
        int productId = Integer.parseInt(productIdStr);

        // Lấy giỏ hàng từ session
        Cart cart = (Cart) req.getSession().getAttribute("cart");

        if (cart != null && cart.remove(productId)) {
            // Xóa sản phẩm thành công
            resp.setStatus(HttpServletResponse.SC_OK);
        } else {
            // Xóa sản phẩm không thành công
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }


}
