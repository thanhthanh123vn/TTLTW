package object;

import java.sql.Timestamp;
import java.util.Date;

public class ExportReceipt {
    private int id;
    private Date exportDate;
    private int customerId;
    private String reason;
    private double totalAmount;
    private String note;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    
    // Additional field for customer name (not in database)
    private String customerName;

    public ExportReceipt() {
    }

    public ExportReceipt(int id, Date exportDate, int customerId, String reason, double totalAmount, String note, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.exportDate = exportDate;
        this.customerId = customerId;
        this.reason = reason;
        this.totalAmount = totalAmount;
        this.note = note;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getExportDate() {
        return exportDate;
    }

    public void setExportDate(Date exportDate) {
        this.exportDate = exportDate;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
} 