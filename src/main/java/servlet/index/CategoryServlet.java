package servlet.index;

import dao.CategoryDao;
import gson.GsonUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.Categories;

import java.io.IOException;
import java.util.List;

@WebServlet("/categoryList")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Đặt loại nội dung trả về là JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        CategoryDao categoryDao = new CategoryDao();
            int startIndex = 0;
            startIndex = request.getParameter("startIndex") != null ? Integer.parseInt(request.getParameter("startIndex")) : 0;
            List<Categories> categories = categoryDao.getAllCategories(startIndex);



            String json = new GsonUtil().getGson().toJson(categories);
            
            response.getWriter().write(json);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
