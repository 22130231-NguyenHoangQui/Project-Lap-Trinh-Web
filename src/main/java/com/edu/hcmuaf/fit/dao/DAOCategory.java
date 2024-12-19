package com.edu.hcmuaf.fit.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Category;
import com.edu.hcmuaf.fit.util.JDBCUtil;

public class DAOCategory {
    public static ArrayList<Category> listCategory(int offset) {
        ArrayList<Category> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT c.name_category AS category_name, c.imageUrl AS category_img, SUM(orr.quantity) AS total_quantity_sold " +
                "FROM OrderDetails orr " +
                "JOIN Product pro ON orr.product_id = pro.product_id " +
                "JOIN CategoryProduct ct ON pro.product_id = ct.product_id " +
                "JOIN Category c ON ct.category_id = c.category_id " +
                "GROUP BY c.name_category, c.imageUrl " +
                "ORDER BY total_quantity_sold DESC " +
                "LIMIT 6;";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
//            pr.setInt(1, offset);
//            pr.setInt(2, offset);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                String categoryName = resultSet.getString("category_name");
                int totalQuantitySold = resultSet.getInt("total_quantity_sold");
                String categoryImg = resultSet.getString("category_img");
                Category category = new Category();
                category.setName(categoryName);
                category.setImageUrl(categoryImg);
                category.setTotalQuantity(totalQuantitySold);
                list.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBCUtil.closeConnection(connection);
        return list;
    }
    public static ArrayList<Category> listCategory() {
        ArrayList<Category> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT ca.category_id,ca.name_category FROM Category ca";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet resultSet = pre.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                int idCategory = resultSet.getInt("category_id");
                String categoryName = resultSet.getString("name_category");
                category.setName(categoryName);
                category.setId(idCategory);
                list.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBCUtil.closeConnection(connection);
        return list;
    }

    public static void main(String[] args) {
//        ArrayList<Category> list = listCategory(0);
//        for (Category category : list) {
//            System.out.println(category);
//        }

        ArrayList<Category> list1 = listCategory();
        for (Category category : list1) {
            System.out.println(category);
        }
    }
}
