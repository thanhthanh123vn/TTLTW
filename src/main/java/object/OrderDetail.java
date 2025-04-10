package object;

import java.sql.Date;
import java.util.List;

public class OrderDetail {
    private int orderId;
    private String recipientName;
    private String phoneNumber;
    private String address;
    private int productID;
    private Date date;
    private int totalQuantity;
    private double totalPrice;
    private List<Product> productList;
    private String methodPay;
    // Constructor
    public OrderDetail(int orderId , String recipientName, String phoneNumber, String address, int productList, int totalQuantity, double totalPrice) {
        this.recipientName = recipientName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.productID = productList;
        this.totalQuantity = totalQuantity;
        this.totalPrice = totalPrice;
        this.orderId = orderId;
    }

    public OrderDetail(int totalQuantity, double totalPrice, int productID, int orderId) {
        this.totalQuantity = totalQuantity;
        this.totalPrice = totalPrice;
        this.productID = productID;
        this.orderId = orderId;
    }

    public OrderDetail() {
    }

    // Getters and Setters

    public String getMethodPay() {
        return methodPay;
    }

    public void setMethodPay(String methodPay) {
        this.methodPay = methodPay;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getProductId() {
        return productID;
    }

    public void setProductId(int productList) {
        this.productID = productList;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public int getTotalQuantity() {
     return  totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }



}
