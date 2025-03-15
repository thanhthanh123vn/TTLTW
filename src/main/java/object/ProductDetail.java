package object;


import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


public class ProductDetail {


    private int id;


    private String productName;


    private String category;


    private String description;


    private String suitableSkin;


    private String skinSolution;


    private String highlight;


    private String ingredients;

    private String fullIngredients;

    private List<String> listImage;
    private String howToUse;


    private String storage;


    private String brand;


    private String brandOrigin;


    private String manufactureLocation;


    private String barcode;


    private String volume;


    private boolean isSensitiveSkinSafe;


    private LocalDateTime createdAt;

    // Default constructor
    public ProductDetail() {
        listImage = new ArrayList<String>();
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSuitableSkin() {
        return suitableSkin;
    }

    public void setSuitableSkin(String suitableSkin) {
        this.suitableSkin = suitableSkin;
    }

    public String getSkinSolution() {
        return skinSolution;
    }

    public void setSkinSolution(String skinSolution) {
        this.skinSolution = skinSolution;
    }

    public String getHighlight() {
        return highlight;
    }

    public void setHighlight(String highlight) {
        this.highlight = highlight;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public String getFullIngredients() {
        return fullIngredients;
    }

    public void setFullIngredients(String fullIngredients) {
        this.fullIngredients = fullIngredients;
    }

    public String getHowToUse() {
        return howToUse;
    }

    public void setHowToUse(String howToUse) {
        this.howToUse = howToUse;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getBrandOrigin() {
        return brandOrigin;
    }

    public void setBrandOrigin(String brandOrigin) {
        this.brandOrigin = brandOrigin;
    }

    public String getManufactureLocation() {
        return manufactureLocation;
    }

    public void setManufactureLocation(String manufactureLocation) {
        this.manufactureLocation = manufactureLocation;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public boolean isSensitiveSkinSafe() {
        return isSensitiveSkinSafe;
    }

    public void setSensitiveSkinSafe(boolean isSensitiveSkinSafe) {
        this.isSensitiveSkinSafe = isSensitiveSkinSafe;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public List<String> getListImage() {
        return listImage;
    }

    public void setListImage(List<String> listImage) {
        this.listImage = listImage;
    }

    @Override
    public String toString(){
        return "Brand"+this.brand;

    }

}


