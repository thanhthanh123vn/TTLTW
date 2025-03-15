package object;

import java.math.BigDecimal;
import java.sql.Date;


public class Promotions {
    private int id;
    private int productId;
    private String name;
    private BigDecimal discountPercentage;
    private String discount;
    private Date startDate;
    private Date endDate;
    private Date createdAt;

    // Constructor không tham số
    public Promotions() {}

    // Constructor đầy đủ tham số
    public Promotions(int id, int productId, String name, BigDecimal discountPercentage, String discount, Date startDate, Date endDate, Date createdAt) {
        this.id = id;
        this.productId = productId;
        this.name = name;
        this.discountPercentage = discountPercentage;
        this.discount = discount;
        this.startDate = startDate;
        this.endDate = endDate;
        this.createdAt = createdAt;
    }

    // Getter và Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(BigDecimal discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    // Phương thức toString()
    @Override
    public String toString() {
        return "Promotions{" +
                "id=" + id +
                ", productId=" + productId +
                ", name='" + name + '\'' +
                ", discountPercentage=" + discountPercentage +
                ", discount='" + discount + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", createdAt=" + createdAt +
                '}';
    }
}
