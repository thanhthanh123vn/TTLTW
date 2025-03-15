package services;

import dao.ProductDetailsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.Product;
import object.ProductDetail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/product-detail")
public class ProductDetailServlet extends HttpServlet {
    ProductDetailsDao dao = new ProductDetailsDao();

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        List<ProductDetail> productDetails = dao.listProductsDetail();

        request.setAttribute("productDetails", productDetails);

        request.getRequestDispatcher("product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
