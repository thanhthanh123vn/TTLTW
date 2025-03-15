package servlet.Comment;

import dao.CommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.Comment;
import object.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/sendComment")
public class SendComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CommentDAO dao = new CommentDAO();
        User user = (User) req.getSession().getAttribute("user");
        int userID = user.getId();

        int productID = Integer.parseInt(req.getParameter("productID"));
        Comment comment = new Comment();
        comment.setProductId(productID);
        comment.setUserId(userID);
        comment.setContent(req.getParameter("comment"));
        boolean isSuccess = false;
        List<Comment> comments = new ArrayList<>();
        try {
            isSuccess =  dao.addComment(comment);
        } catch (SQLException e) {
          e.printStackTrace();
        }
        if(isSuccess){
            try {

                comments = dao.getCommentsByProductId(productID);
                comments.add(comment);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            req.setAttribute("comments", comments);
            req.getRequestDispatcher("productDetail?id="+productID).forward(req, resp);

        }else{
            req.setAttribute("errorMesage", "Lỗi Comment");
            req.getRequestDispatcher("productDetail?id="+productID).forward(req, resp);
        }


    }
}
