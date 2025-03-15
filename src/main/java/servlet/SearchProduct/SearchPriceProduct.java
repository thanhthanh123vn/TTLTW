package servlet.SearchProduct;

import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.Product;

import java.io.IOException;
import java.util.List;

@WebServlet("/searchPriceProduct")
public class SearchPriceProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductsDao dao = new ProductsDao();
        String stringtoPrice = req.getParameter("toPrice");
        String stringfromPrice = req.getParameter("fromPrice");
        double toPrice =0;
        double fromPrice =0;

       try {
           toPrice = Double.parseDouble(stringtoPrice);
           fromPrice = Double.parseDouble(stringfromPrice);
           System.out.println(toPrice);

       } catch (NumberFormatException e) {
        e.printStackTrace();
       }
        List<Product> searchPrice =
                dao.searchPriceProduct(toPrice, fromPrice);
       if(!searchPrice.isEmpty()) {
           req.setAttribute("products", searchPrice);
           req.getRequestDispatcher("SearchProduct.jsp").forward(req, resp);
       }else {
           req.setAttribute("errorMessage" , "Không tìm thấy sản phẩm");
           req.getRequestDispatcher("SearchProduct.jsp").forward(req, resp);
       }

    }
}
