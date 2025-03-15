package dao;

import object.Promotions;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class PromotionsDao {
    private Connection con;
    Utils utils;
    // Constructor
    public PromotionsDao() {
         utils = new Utils();
        this.con = utils.getConnection();
    }

    // Lấy danh sách promotions
    public List<Promotions> getAllPromotions() {
        List<Promotions> promotionsList = new ArrayList<>();
        String sql = "SELECT * FROM promotions";

        try {
                PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Promotions promotion = new Promotions();
                promotion.setId(rs.getInt("id"));
                promotion.setProductId(rs.getInt("ProductID"));
                promotion.setName(rs.getString("Name"));
                promotion.setDiscountPercentage(rs.getBigDecimal("discountPercentage"));
                promotion.setDiscount(rs.getString("discount"));
                promotion.setStartDate(rs.getDate("startDate"));
                promotion.setEndDate(rs.getDate("endDate"));
                promotion.setCreatedAt(rs.getDate("createdAt"));
                promotionsList.add(promotion);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return promotionsList;
    }


    // Thêm promotion mới
    public boolean addPromotion(Promotions promotion) {
        String sql = "INSERT INTO promotions (ProductID, Name, discountPercentage, discount, startDate, endDate, createdAt) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, promotion.getProductId());
            ps.setString(2, promotion.getName());
            ps.setBigDecimal(3, promotion.getDiscountPercentage());
            ps.setString(4, promotion.getDiscount());
            ps.setDate(5, promotion.getStartDate());
            ps.setDate(6,promotion.getEndDate());
            ps.setDate(7, promotion.getCreatedAt());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Sửa promotion theo id
    public boolean updatePromotion(Promotions promotion) {
        String sql = "UPDATE promotions SET ProductID = ?, Name = ?, discountPercentage = ?, discount = ?, startDate = ?, endDate = ? WHERE id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, promotion.getProductId());
            ps.setString(2, promotion.getName());
            ps.setBigDecimal(3, promotion.getDiscountPercentage());
            ps.setString(4, promotion.getDiscount());
            ps.setDate(5, promotion.getStartDate());
            ps.setDate(6, promotion.getEndDate());
            ps.setInt(7, promotion.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Xóa promotion theo id
    public boolean deletePromotion(int id) {
        String sql = "DELETE FROM promotions WHERE id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
