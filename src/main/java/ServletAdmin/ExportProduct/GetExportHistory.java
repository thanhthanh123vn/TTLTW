package ServletAdmin.ExportProduct;

import dao.ExportReceiptDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.ExportReceipt;

import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;

@WebServlet(name = "GetExportHistory", urlPatterns = {"/GetExportHistory"})
public class GetExportHistory extends HttpServlet {
    private ExportReceiptDAO exportReceiptDAO;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        exportReceiptDAO = new ExportReceiptDAO();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            List<ExportReceipt> receipts = exportReceiptDAO.getAllExportReceipts();
            response.getWriter().write(gson.toJson(receipts));
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write(gson.toJson(new ErrorResponse("Lỗi khi lấy lịch sử xuất kho: " + e.getMessage())));
        }
    }

    private static class ErrorResponse {
        private String message;

        public ErrorResponse(String message) {
            this.message = message;
        }
    }
} 