package servlet.cartProduct;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.Product;
import object.cart.Cart;

import java.io.IOException;

@WebServlet(name ="CartServlet"  , urlPatterns = "/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        String action = request.getParameter("action");

        System.out.println("action: " + action);
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        switch (action) {
            case "add":
                int productId = Integer.parseInt(request.getParameter("productId"));

                String name = request.getParameter("name");
                String detail = request.getParameter("detail");
                double price = Double.parseDouble(request.getParameter("price"));
                String image = request.getParameter("image");

                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String modifier = request.getParameter("modifier");

                Product item = new Product(productId, name,detail, price, image );
                cart.put(item);
                break;

            case "update":
                productId = Integer.parseInt(request.getParameter("productId"));
                quantity = Integer.parseInt(request.getParameter("quantity"));
                cart.update(productId, quantity);
                break;

            case "remove":
                productId = Integer.parseInt(request.getParameter("productId"));
                cart.remove(productId);
                break;

            default:
                break;
        }
        session.setAttribute("cart", cart);
        request.getRequestDispatcher("index/cartProduct.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
