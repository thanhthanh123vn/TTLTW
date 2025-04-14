package servlet.PayProduct;

import com.google.gson.Gson;
import dao.OrderDao;
import dao.ProductsDao;
import dao.UserInfDao;
import gson.GsonUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.*;
import object.cart.Cart;
import object.cart.ProductCart;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ManagerProduct")
public class ManagerProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDao dao = new OrderDao();
        UserInfDao userInfDao = new UserInfDao();
        HttpSession session = req.getSession();
        String action = null;

        Date date = new Date(System.currentTimeMillis());
        User user = (User) req.getSession().getAttribute("user");
        UserInf userAddress = (UserInf) session.getAttribute("UserAddress");
        int id  ;




         id = user.getId();
        Order order = new Order();

        order.setUserId(id);
        System.out.println(order.getUserId()+"Nguoi dung order");
        order.setCreate_date(date);
        Product product = (Product) session.getAttribute("payProduct");


        Cart cart = (Cart) session.getAttribute("cart");
        OrderDetail orderDetail = new OrderDetail();
        if (product != null) {

        orderDetail.setProductId(product.getId());
        orderDetail.setAddress(userAddress.getAddress());
        orderDetail.setDate(new Date(System.currentTimeMillis()));
        orderDetail.setMethodPay("COD");


        orderDetail.setTotalQuantity(product.getQuantity());
        orderDetail.setTotalPrice(product.getPrice());


            int isSuccess = dao.insertOrderWithDetails(order, orderDetail);

            System.out.println(isSuccess+"Order");

            if (isSuccess>0) {
                action = "success";
                session.setAttribute("action",action);
                session.setAttribute("order",order);
                Date date1 = new Date(System.currentTimeMillis());

                orderDetail.setDate(date1);
                session.setAttribute("orderDetail",orderDetail);
                session.setAttribute("productQL", product);
                session.removeAttribute("payProduct");
                req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);
            } else {
//                System.out.println("Mua ngay đó nha"+product.toString());
//                req.setAttribute("product", product);
                req.setAttribute("errorMessage", "Khong the chen Order");
                req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);
            }


        }
        if (cart != null ){

            List<ProductCart> productCarts = cart.getList();
            List<Product> products = getProducts(productCarts);

            if (!products.isEmpty()) {
                for (Product cproduct : products) {
                    Order order2 = new Order();
                    order2.setUserId(id);
                    order2.setCreate_date(date);
                    OrderDetail orderDetail2 = new OrderDetail();
                    orderDetail2.setAddress(userAddress.getAddress());
                    orderDetail2.setDate(new Date(System.currentTimeMillis()));
                    orderDetail2.setMethodPay("COD");
                    orderDetail2.setProductId(cproduct.getId());
                    orderDetail2.setTotalQuantity(cproduct.getQuantity());
                    orderDetail2.setTotalPrice(cproduct.getPrice());

                    int isSuccess = dao.insertOrderWithDetails(order2, orderDetail2);
                    if (isSuccess>0) {
                        action = "success";
                        Date date1 = new Date(System.currentTimeMillis());

                        orderDetail.setDate(date1);
                        session.setAttribute("order",order2);

                        session.setAttribute("orderDetail",orderDetail2);
                        session.setAttribute("action",action);
                        session.setAttribute("cartQL", cart);
                        req.setAttribute("cart", cart);
                        session.removeAttribute("cart");
                        req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);
                    } else {

//                session.setAttribute("cartQL", cart);
                        req.setAttribute("errorMessage", "Khong the chen Order");
                        req.getRequestDispatcher("index/qldonhang.jsp").forward(req, resp);
                    }

                }
            }


        }
    }

    public List<Product> getProducts(List<ProductCart> list) {

        List<Product> products = new ArrayList<>();
        for (ProductCart cart : list) {
            Product product = new Product();
            product.setId(cart.getId());
            product.setName(cart.getName());
            product.setPrice(cart.getPrice());
            product.setQuantity(cart.getCount());

            products.add(product);

        }
        return products;

    }
}