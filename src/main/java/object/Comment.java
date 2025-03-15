package object;

public class Comment {
    private int id;             // ID của comment
    private int productId;      // ID sản phẩm
    private int userId;         // ID người dùng
    private String content;     // Nội dung comment
    private String createdAt;   // Thời gian tạo

    // Constructor mặc định
    public Comment() {
    }

    // Constructor đầy đủ
    public Comment(int id, int productId, int userId, String content, String createdAt) {
        this.id = id;
        this.productId = productId;
        this.userId = userId;
        this.content = content;
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", productId=" + productId +
                ", userId=" + userId +
                ", content='" + content + '\'' +
                ", createdAt='" + createdAt + '\'' +
                '}';
    }
}
