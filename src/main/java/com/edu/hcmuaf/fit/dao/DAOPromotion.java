package com.edu.hcmuaf.fit.dao;

import com.edu.hcmuaf.fit.model.Promotion;
import com.edu.hcmuaf.fit.util.JDBCUtil;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAOPromotion {
    // Thêm một promotion vào cơ sở dữ liệu (Create)
    public boolean addPromotion(Promotion promotion) throws SQLException {
        String sql = "INSERT INTO promotions (id, startDate, durationDays, discountValue, description, paymentId) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, promotion.getId());
            stmt.setTimestamp(2, new Timestamp(promotion.getStartDate().getTime()));  // Chuyển Date sang Timestamp
            stmt.setInt(3, promotion.getDurationDays());
            stmt.setBigDecimal(4, promotion.getDiscountValue());
            stmt.setString(5, promotion.getDescription());
            stmt.setInt(6, promotion.getPaymentId());

            return stmt.executeUpdate() > 0;  // Nếu có ít nhất một dòng bị ảnh hưởng, trả về true
        }
    }

    // Lấy danh sách các promotions (Read)
    public List<Promotion> getAllPromotions() throws SQLException {
        List<Promotion> promotions = new ArrayList<>();
        String sql = "SELECT id, startDate, durationDays, discountValue, description, paymentId FROM promotions";
        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String id = rs.getString("id");
                Timestamp startDate = rs.getTimestamp("startDate");
                int durationDays = rs.getInt("durationDays");
                BigDecimal discountValue = rs.getBigDecimal("discountValue");
                String description = rs.getString("description");
                int paymentId = rs.getInt("paymentId");

                Promotion promotion = new Promotion(id, startDate, durationDays, discountValue, description, paymentId);
                promotions.add(promotion);
            }
        }

        return promotions;
    }

    // Lấy promotion theo ID (Read)
    public Promotion getPromotionById(String id) throws SQLException {
        String sql = "SELECT id, startDate, durationDays, discountValue, description, paymentId "
                + "FROM promotions WHERE id = ?";

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Timestamp startDate = rs.getTimestamp("startDate");
                    int durationDays = rs.getInt("durationDays");
                    BigDecimal discountValue = rs.getBigDecimal("discountValue");
                    String description = rs.getString("description");
                    int paymentId = rs.getInt("paymentId");

                    return new Promotion(id, startDate, durationDays, discountValue, description, paymentId);
                }
            }
        }
        return null;  // Nếu không tìm thấy
    }

    // Cập nhật promotion (Update)
    public boolean updatePromotion(Promotion promotion) throws SQLException {
        String sql = "UPDATE promotions SET startDate = ?, durationDays = ?, discountValue = ?, description = ?, paymentId = ? "
                + "WHERE id = ?";

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setTimestamp(1, new Timestamp(promotion.getStartDate().getTime()));
            stmt.setInt(2, promotion.getDurationDays());
            stmt.setBigDecimal(3, promotion.getDiscountValue());
            stmt.setString(4, promotion.getDescription());
            stmt.setInt(5, promotion.getPaymentId());
            stmt.setString(6, promotion.getId());

            return stmt.executeUpdate() > 0;  // Nếu có ít nhất một dòng bị ảnh hưởng, trả về true
        }
    }

    // Xóa promotion (Delete)
    public boolean deletePromotion(String id) throws SQLException {
        String sql = "DELETE FROM promotions WHERE id = ?";

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, id);

            return stmt.executeUpdate() > 0;  // Nếu có ít nhất một dòng bị ảnh hưởng, trả về true
        }
    }
}
