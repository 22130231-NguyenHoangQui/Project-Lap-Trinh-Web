package com.edu.hcmuaf.fit.service;

import com.edu.hcmuaf.fit.dao.DAOPromotion;
import com.edu.hcmuaf.fit.model.Promotion;

import java.sql.SQLException;
import java.util.List;

public class PromotionService {

    private DAOPromotion daoPromotion;

    // Constructor
    public PromotionService() {
        this.daoPromotion = new DAOPromotion();
    }

    // Thêm một promotion mới
    public boolean addPromotion(Promotion promotion) {
        try {
            return daoPromotion.addPromotion(promotion);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Lấy tất cả các promotions
    public List<Promotion> getAllPromotions() {
        try {
            return daoPromotion.getAllPromotions();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Lấy promotion theo ID
    public Promotion getPromotionById(String id) {
        try {
            return daoPromotion.getPromotionById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Cập nhật một promotion
    public boolean updatePromotion(Promotion promotion) {
        try {
            return daoPromotion.updatePromotion(promotion);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Xóa promotion theo ID
    public boolean deletePromotion(String id) {
        try {
            return daoPromotion.deletePromotion(id);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
