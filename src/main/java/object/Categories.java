package object;

import java.sql.Timestamp;

public class Categories {
    private int categoryID;
    private String categoryName;
    private String description;
    private String image;
    private Timestamp createdAt;

    // Constructor không tham số
    public Categories() {
    }

    // Constructor đầy đủ
    public Categories(int categoryID, String categoryName,String image, String description, Timestamp createdAt) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.description = description;
        this.image = image;
        this.createdAt = createdAt;
    }

    // Getter và Setter
    public int getCategoryID() {
        return categoryID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    // Phương thức toString để hiển thị thông tin
    @Override
    public String toString() {
        return "Categories{" +
                "categoryID=" + categoryID +
                ", categoryName='" + categoryName + '\'' +
                ", description='" + description + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}
