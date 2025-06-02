package ServletAdmin.ManagerKho.ExportKho;



import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Need a library for JSON, assuming Gson for now. Add dependency if not present.
import com.google.gson.Gson;
import object.Product;
import object.ProductDetail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/GetProductsWithStock")
public class GetProductsWithStock extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        ProductsDao productDAO = new ProductsDao();
        List<Product> productDetailsWithStock = productDAO.listProducts(); // This method needs to be implemented in ProductDAO

        Gson gson = new Gson();
        String json = gson.toJson(productDetailsWithStock);

        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }
}
