package object;


public class ExportReceiptDetail {
    private int id;
    private int receiptId;
    private int productId;
    private String size;
    private int quantity;
    private double price;
    private double total;

    // Additional fields for display (not in database)
    private String productName;

    public ExportReceiptDetail() {
    }

    public ExportReceiptDetail(int id, int receiptId, int productId, String size, int quantity, double price, double total) {
        this.id = id;
        this.receiptId = receiptId;
        this.productId = productId;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
        this.total = total;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(int receiptId) {
        this.receiptId = receiptId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
}