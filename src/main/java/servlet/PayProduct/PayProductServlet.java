package servlet.PayProduct;


import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.Product;

import java.io.IOException;

@WebServlet("/payProduct")
public class PayProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Your payment processing logic here
       String productID = request.getParameter("productId");
       HttpSession session = request.getSession();

        ProductsDao dao = new ProductsDao();
        try {

        Product product = dao.getProductOnId(Integer.parseInt(productID));
        if(product != null) {
            session.setAttribute("payProduct", product);

            request.getRequestDispatcher("index/payAddress.jsp").forward(request, response);
        }else {

        }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }





    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
