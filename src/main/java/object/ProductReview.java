package object;

import java.sql.Timestamp;

public class ProductReview {
    private int id;
    private int userId;
    private int productId;
    private int rating;
    private String comment;
    private Timestamp reviewDate;
    public ProductReview() {

    }
    public ProductReview(int userId, int productId, int rating, String comment, Timestamp reviewDate) {
        this.userId = userId;
        this.productId = productId;
        this.rating = rating;
        this.comment = comment;
        this.reviewDate = reviewDate;

    }
    public int getId() {return id;}
    public void setId(int id) {this.id = id;}
    public int getUserId() {return userId;}
    public void setUserId(int userId) {this.userId = userId;}
    public int getProductId() {return productId;}
    public void setProductId(int productId) {this.productId = productId;}
    public int getRating() {return rating;}
    public void setRating(int rating) {this.rating = rating;}
    public String getComment() {return comment;}
    public void setComment(String comment) {this.comment = comment;}
    public Timestamp getReviewDate() {return reviewDate;}
    public void setReviewDate(Timestamp reviewDate) {this.reviewDate = reviewDate;}

}
