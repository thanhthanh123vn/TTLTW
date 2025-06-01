package ServletAdmin.ImportProduct;

import dao.ImportReceiptDAO;
import dao.ImportReceiptDetailDAO;
import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import object.ImportReceipt;
import object.ImportReceiptDetail;
import object.Product;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(name = "SaveImportReceiptServlet", urlPatterns = {"/SaveImportReceipt"})
public class SaveImportReceiptServlet extends HttpServlet {
    private ImportReceiptDAO importReceiptDAO;
    private ImportReceiptDetailDAO importReceiptDetailDAO;
    private ProductsDao productsDao;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        importReceiptDAO = new ImportReceiptDAO();
        importReceiptDetailDAO = new ImportReceiptDetailDAO();
        productsDao = new ProductsDao();
        gson = new Gson();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            // Parse the JSON request body
            Map<String, Object> requestData = gson.fromJson(request.getReader(), Map.class);
            
            // Create ImportReceipt object
            ImportReceipt receipt = new ImportReceipt();
            receipt.setImportDate(new Timestamp(new Date().getTime()));
            receipt.setSupplierId(Integer.parseInt(requestData.get("supplierId").toString()));
            receipt.setNote((String) requestData.get("note"));
            receipt.setTotalAmount(Double.parseDouble(requestData.get("totalAmount").toString()));
            
            // Save the receipt and get its ID
            int receiptId = importReceiptDAO.createImportReceipt(receipt);
            
            // Process import details
            List<Map<String, Object>> details = (List<Map<String, Object>>) requestData.get("details");
            for (Map<String, Object> detail : details) {
                ImportReceiptDetail importDetail = new ImportReceiptDetail();
                importDetail.setImportReceiptId(receiptId);
                importDetail.setProductId(Integer.parseInt(detail.get("productId").toString()));
                importDetail.setQuantity(Integer.parseInt(detail.get("quantity").toString()));
                importDetail.setPrice(Double.parseDouble(detail.get("price").toString()));
                
                // Save import detail
                importReceiptDetailDAO.createImportReceiptDetail(importDetail);
                
                // Update product quantity
                Product product = productsDao.getProductById(importDetail.getProductId());

                product.setQuantity(product.getQuantity() + importDetail.getQuantity());
                productsDao.updateProductQuantity(product);
            }
            
            // Send success response
            Map<String, Object> responseData = new HashMap<>();
            responseData.put("success", true);
            responseData.put("message", "Lưu phiếu nhập thành công");
            responseData.put("receiptId", receiptId);
            
            response.getWriter().write(gson.toJson(responseData));
            
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Map<String, String> error = new HashMap<>();
            error.put("success", String.valueOf(false));
            error.put("message", "Lỗi khi lưu phiếu nhập: " + e.getMessage());
            response.getWriter().write(gson.toJson(error));
        }
    }
} 