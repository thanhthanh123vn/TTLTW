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

@WebServlet("/CheckedBrand")
public class CheckedBrand extends HttpServlet {


    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ProductsDao productsDao = new ProductsDao();
        String brands = request.getParameter("filterBrand");

        List<Product> brandsProduct = productsDao.searchBrand(brands);
        if(brandsProduct.size() > 0){
            request.setAttribute("products", brandsProduct);
            request.getRequestDispatcher("SearchProduct.jsp").forward(request, response);

        }else{
            System.out.println("No brands found");

            request.getRequestDispatcher("SearchProduct.jsp").forward(request, response);
        }



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}


