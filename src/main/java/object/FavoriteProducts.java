package object;
public class FavoriteProducts {
    private int id;
    private int userId;
    private int productId;
    private String addedDate; // hoặc dùng java.sql.Timestamp

    public FavoriteProducts() {
    }

    public FavoriteProducts(int id, int userId, int productId, String addedDate) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.addedDate = addedDate;
    }

    public FavoriteProducts(  int productId, int userId) {
      
        this.productId = productId;
        this.userId = userId;
    }
// Getters & Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(String addedDate) {
        this.addedDate = addedDate;
    }
}
