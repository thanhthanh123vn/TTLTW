package dao;

import object.ProductDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDetailsDao {
    private Utils utils;
    private Connection conn;

    public ProductDetailsDao() {
        utils = new Utils();
        conn = utils.getConnection();
    }
    public void closeConnection(){
        utils.closeConnection(conn);
    }
    public List<ProductDetail> listProductsDetail() {
        String sql = "SELECT * FROM product_details";
        List<ProductDetail> products = new ArrayList<>();

        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                System.out.println("ProductDetails success");
                ProductDetail productDetail = new ProductDetail();

                productDetail.setProductName(rs.getString("detail_product_name"));
                productDetail.setCategory(rs.getString("Category"));
                productDetail.setDescription(rs.getString("Description"));
                productDetail.setSuitableSkin(rs.getString("SuitableSkin"));
                productDetail.setSkinSolution(rs.getString("SkinSolution"));
                productDetail.setHighlight(rs.getString("Highlight"));
                productDetail.setIngredients(rs.getString("Ingredients"));
                productDetail.setFullIngredients(rs.getString("FullIngredients"));
                productDetail.setHowToUse(rs.getString("HowToUse"));
                productDetail.setStorage(rs.getString("Storage"));
                productDetail.setBrand(rs.getString("Brand"));
                productDetail.setBrandOrigin(rs.getString("BrandOrigin"));
                productDetail.setManufactureLocation(rs.getString("ManufactureLocation"));
                productDetail.setBarcode(rs.getString("Barcode"));
                productDetail.setVolume(rs.getString("Volume"));
                productDetail.setSensitiveSkinSafe(rs.getBoolean("IsSensitiveSkinSafe"));
                productDetail.setCreatedAt(rs.getTimestamp("CreatedAt").toLocalDateTime());

                products.add(productDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //utils.closeConnection(conn);
        return products;
    }
}