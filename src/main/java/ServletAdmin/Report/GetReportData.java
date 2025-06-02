package ServletAdmin.Report;

import dao.CategoryDao;
import dao.ExportReceiptDAO;
import dao.ImportReceiptDAO;
import dao.ProductsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import object.Categories;
import object.ExportReceipt;
import object.ImportReceipt;
import object.Product;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;
import com.google.gson.Gson;

@WebServlet(name = "GetReportData", urlPatterns = {"/GetReportData"})
public class GetReportData extends HttpServlet {
    private CategoryDao categoryDao;
    private ImportReceiptDAO importReceiptDAO;
    private ExportReceiptDAO exportReceiptDAO;
    private ProductsDao productsDao;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        categoryDao = new CategoryDao();
        importReceiptDAO = new ImportReceiptDAO();
        exportReceiptDAO = new ExportReceiptDAO();
        productsDao = new ProductsDao();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String period = request.getParameter("period");
            Date startDate = getStartDate(period);
            Date endDate = new Date();

            Map<String, Object> reportData = new HashMap<>();
            
            // Get category distribution
            Map<String, Integer> categoryDistribution = calculateCategoryDistribution();
            reportData.put("categoryDistribution", categoryDistribution);

            // Get import/export statistics
            List<ImportReceipt> importReceipts = importReceiptDAO.getImportReceiptsByDateRange(startDate, endDate);
            List<ExportReceipt> exportReceipts = exportReceiptDAO.getExportReceiptsByDateRange(
                new java.sql.Date(startDate.getTime()), 
                new java.sql.Date(endDate.getTime())
            );
            
            double totalImportValue = importReceipts.stream()
                .mapToDouble(ImportReceipt::getTotalAmount)
                .sum();
            double totalExportValue = exportReceipts.stream()
                .mapToDouble(ExportReceipt::getTotalAmount)
                .sum();

            // Calculate inventory value trend
            List<Map<String, Object>> inventoryTrend = calculateInventoryTrend(startDate, endDate);
            reportData.put("inventoryTrend", inventoryTrend);

            // Summary statistics
            Map<String, Object> summary = new HashMap<>();
            summary.put("totalImportValue", totalImportValue);
            summary.put("totalExportValue", totalExportValue);
            summary.put("totalInventoryValue", calculateTotalInventoryValue());
            summary.put("importCount", importReceipts.size());
            summary.put("exportCount", exportReceipts.size());
            summary.put("totalProducts", productsDao.listProducts().size());
            
            // Calculate trends (compared to previous period)
            Date previousStartDate = getPreviousPeriodStartDate(period);
            double previousImportValue = calculatePreviousPeriodValue(previousStartDate, startDate, true);
            double previousExportValue = calculatePreviousPeriodValue(previousStartDate, startDate, false);
            
            summary.put("importTrend", calculateTrendPercentage(totalImportValue, previousImportValue));
            summary.put("exportTrend", calculateTrendPercentage(totalExportValue, previousExportValue));
            
            reportData.put("summary", summary);

            // Get top products
            List<Map<String, Object>> topProducts = getTopProducts(startDate, endDate);
            reportData.put("topProducts", topProducts);

            // Get low stock alerts
            List<Map<String, Object>> lowStockAlerts = getLowStockAlerts();

            reportData.put("lowStockAlerts", lowStockAlerts);

            response.getWriter().write(gson.toJson(reportData));
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write(gson.toJson(new ErrorResponse("Lỗi khi lấy dữ liệu báo cáo: " + e.getMessage())));
        }
    }

    private Date getStartDate(String period) {
        Calendar cal = Calendar.getInstance();
        switch (period) {
            case "today":
                cal.set(Calendar.HOUR_OF_DAY, 0);
                break;
            case "week":
                cal.add(Calendar.WEEK_OF_YEAR, -1);
                break;
            case "month":
                cal.add(Calendar.MONTH, -1);
                break;
            case "quarter":
                cal.add(Calendar.MONTH, -3);
                break;
            case "year":
                cal.add(Calendar.YEAR, -1);
                break;
            default:
                cal.add(Calendar.MONTH, -1); // Default to last month
        }
        return cal.getTime();
    }

    private Date getPreviousPeriodStartDate(String period) {
        Calendar cal = Calendar.getInstance();
        switch (period) {
            case "today":
                cal.add(Calendar.DAY_OF_YEAR, -1);
                break;
            case "week":
                cal.add(Calendar.WEEK_OF_YEAR, -2);
                break;
            case "month":
                cal.add(Calendar.MONTH, -2);
                break;
            case "quarter":
                cal.add(Calendar.MONTH, -6);
                break;
            case "year":
                cal.add(Calendar.YEAR, -2);
                break;
            default:
                cal.add(Calendar.MONTH, -2);
        }
        return cal.getTime();
    }

    private List<Map<String, Object>> calculateInventoryTrend(Date startDate, Date endDate) {
        List<Map<String, Object>> trend = new ArrayList<>();
        Calendar cal = Calendar.getInstance();
        cal.setTime(startDate);
        
        while (cal.getTime().before(endDate)) {
            Map<String, Object> point = new HashMap<>();
            point.put("date", new Timestamp(cal.getTime().getTime()));
            point.put("value", calculateInventoryValueAtDate(cal.getTime()));
            trend.add(point);
            
            cal.add(Calendar.DAY_OF_MONTH, 1);
        }
        
        return trend;
    }

    private double calculateInventoryValueAtDate(Date date) {
        // Implement logic to calculate inventory value at a specific date
        return 0.0; // Placeholder
    }

    private double calculateTotalInventoryValue() {
        // Implement logic to calculate current total inventory value
        return 0.0; // Placeholder
    }

    private double calculatePreviousPeriodValue(Date startDate, Date endDate, boolean isImport) {
        // Implement logic to calculate previous period value
        return 0.0; // Placeholder
    }

    private double calculateTrendPercentage(double current, double previous) {
        if (previous == 0) return 0;
        return ((current - previous) / previous) * 100;
    }

    private List<Map<String, Object>> getTopProducts(Date startDate, Date endDate) {
        // Implement logic to get top products by export quantity
        List<Map<String, Object>> topProducts = new ArrayList<>();
        try {
            // Assuming ProductsDao has a method like getTopSellingProductsByQuantity(Date startDate, Date endDate)
            topProducts = productsDao.getTopSellingProductsByQuantity(startDate, endDate);
        } catch (Exception e) {
            e.printStackTrace(); // Log the error
        }
        return topProducts;
    }

    private List<Map<String, Object>> getLowStockAlerts() {
        List<Map<String, Object>> lowStockAlerts = new ArrayList<>();
        try {
            List<Product> products = productsDao.listProducts(); // Assuming this gets all products
            // TODO: Implement logic to get actual minimum stock if available, currently using a hardcoded threshold
            int lowStockThreshold = 10;
            int criticalStockThreshold = 5;

            for (Product product : products) {
                // Assuming Product object has getQuantity()
                int currentStock = product.getQuantity();
                
                if (currentStock < lowStockThreshold) {
                    Map<String, Object> alert = new HashMap<>();
                    alert.put("name", product.getName());
                    alert.put("currentStock", currentStock);
                    // TODO: Replace with actual minimum stock if available
                    alert.put("minimumStock", lowStockThreshold); 
                    
                    // Determine status based on thresholds
                    String status = currentStock <= criticalStockThreshold ? "critical" : "warning";
                    alert.put("status", status);
                    
                    lowStockAlerts.add(alert);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the error
        }
        return lowStockAlerts;
    }

    // Helper method to calculate category distribution
    private Map<String, Integer> calculateCategoryDistribution() {
        Map<String, Integer> distribution = new HashMap<>();
        try {
            List<Product> products = productsDao.listProducts();
            List<Categories> categories = categoryDao.getAllCategories(0); // Assuming 0 gets all categories
            
            // Create a map for quick lookup of category names by ID
            Map<Integer, String> categoryNames = new HashMap<>();
            for (Categories category : categories) {
                categoryNames.put(category.getCategoryID(), category.getCategoryName());
            }

            // Count products per category
            for (Product product : products) {
                int categoryId = product.getCategory_id();
                String categoryName = categoryNames.getOrDefault(categoryId, "Unknown Category");
                distribution.put(categoryName, distribution.getOrDefault(categoryName, 0) + 1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return distribution;
    }

    private static class ErrorResponse {
        private String message;

        public ErrorResponse(String message) {
            this.message = message;
        }
    }
} 