package ServletAdmin.ManagerKho;

import com.google.gson.Gson;
import dao.ImportReceiptDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.ImportReceipt;
import object.Supplier;
import dao.SupplierDAO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "GetImportHistory", urlPatterns = {"/GetImportHistory"})
public class GetImportHistory extends HttpServlet {
    private ImportReceiptDAO importReceiptDAO;
    private SupplierDAO supplierDAO;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        importReceiptDAO = new ImportReceiptDAO();
        supplierDAO = new SupplierDAO();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            // Get all import receipts
            List<ImportReceipt> receipts = importReceiptDAO.getAllImportReceipts();
            List<Map<String, Object>> receiptData = new ArrayList<>();

            for (ImportReceipt receipt : receipts) {
                Map<String, Object> receiptMap = new HashMap<>();
                receiptMap.put("id", receipt.getId());
                receiptMap.put("receiptCode", "NK" + String.format("%03d", receipt.getId()));
                receiptMap.put("importDate", receipt.getImportDate());
                receiptMap.put("totalAmount", receipt.getTotalAmount());
                
                // Get supplier information
                Supplier supplier = supplierDAO.getSupplierById(receipt.getSupplierId());
                if (supplier != null) {
                    receiptMap.put("supplierName", supplier.getName());
                } else {
                    receiptMap.put("supplierName", "N/A");
                }

                // Get total products count
                int totalProducts = importReceiptDAO.getTotalProductsByReceiptId(receipt.getId());
                receiptMap.put("totalProducts", totalProducts);

                receiptData.add(receiptMap);
            }

            // Convert to JSON and send response
            String jsonResponse = gson.toJson(receiptData);
            response.getWriter().write(jsonResponse);

        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Lỗi khi lấy dữ liệu lịch sử nhập kho");
            response.getWriter().write(gson.toJson(error));
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
} 