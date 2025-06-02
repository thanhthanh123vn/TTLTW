package ServletAdmin.ManagerKho;

import dao.ImportReceiptDAO;
import dao.ImportReceiptDetailDAO;
import dao.SupplierDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.ImportReceipt;
import object.ImportReceiptDetail;
import object.Supplier;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "PrintImportReceiptServlet", urlPatterns = {"/PrintImportReceipt"})
public class PrintImportReceiptServlet extends HttpServlet {
    private ImportReceiptDAO importReceiptDAO;
    private ImportReceiptDetailDAO importReceiptDetailDAO;
    private SupplierDAO supplierDAO;

    @Override
    public void init() throws ServletException {
        importReceiptDAO = new ImportReceiptDAO();
        importReceiptDetailDAO = new ImportReceiptDetailDAO();
        supplierDAO = new SupplierDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String receiptIdParam = request.getParameter("id");
        int receiptId = -1;
        if (receiptIdParam != null && !receiptIdParam.isEmpty()) {
            try {
                receiptId = Integer.parseInt(receiptIdParam);
            } catch (NumberFormatException e) {
                // Handle invalid ID format
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid receipt ID format.");
                return;
            }
        }

        if (receiptId == -1) {
            // Handle missing ID
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing receipt ID.");
            return;
        }

        try {
            ImportReceipt receipt = importReceiptDAO.getImportReceiptById(receiptId);
            
            if (receipt == null) {
                // Handle receipt not found
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Import receipt not found.");
                return;
            }

            List<ImportReceiptDetail> details = importReceiptDetailDAO.getDetailsByReceiptId(receiptId);
            Supplier supplier = supplierDAO.getSupplierById(receipt.getSupplierId());

            request.setAttribute("receipt", receipt);
            request.setAttribute("details", details);
            request.setAttribute("supplier", supplier);
            
            request.getRequestDispatcher("/admin/PrintImportReceipt.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving import receipt data.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
} 