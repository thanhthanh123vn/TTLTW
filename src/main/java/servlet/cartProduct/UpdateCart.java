package servlet.cartProduct;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.cart.Cart;
import object.cart.ProductCart;

import java.io.IOException;

@WebServlet("/UpdateCart")
public class UpdateCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy ID sản phẩm và số lượng mới từ yêu cầu
        String productIdStr = req.getParameter("productId");
        String quantityStr = req.getParameter("quantity");

        int productId = Integer.parseInt(productIdStr);
        int quantity = Integer.parseInt(quantityStr);

        // Lấy giỏ hàng từ session
        Cart cart = (Cart) req.getSession().getAttribute("cart");

        if (cart != null) {
            ProductCart updatedProductCart = cart.update(productId, quantity);
            if (updatedProductCart != null) {
                // Cập nhật số lượng thành công
                System.out.println("Updated product cart "+quantity);
                resp.setStatus(HttpServletResponse.SC_OK);
            } else {
                // Không tìm thấy sản phẩm để cập nhật
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            // Giỏ hàng không tồn tại trong session
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }


}
