package com.edu.hcmuaf.fit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Category;
import com.edu.hcmuaf.fit.util.JDBCUtil;

public class DAOCategory {

    // Sửa câu lệnh SQL trong phương thức listCategory(int offset)

    // Sửa câu lệnh SQL trong phương thức listCategory(int offset)
    public static ArrayList<Category> listCategory(int offset) {
        ArrayList<Category> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT c.categoryName AS category_name, c.imageUrl AS category_img, SUM(orr.quantity) AS total_quantity_sold " +
                "FROM OrderDetails orr " +
                "JOIN Products pro ON orr.orderId = pro.id " +  // sửa Id thành id
                "JOIN Categories c ON c.id = pro.id " + // sửa ct.id thành c.id
                "GROUP BY c.categoryName, c.imageUrl " +
                "JOIN Products pro ON orr.orderId = pro.id " +  // sửa Id thành id
                "JOIN Categories c ON c.id = pro.id " + // sửa ct.id thành c.id
                "GROUP BY c.categoryName, c.imageUrl " +
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

    // Sửa câu lệnh SQL trong phương thức listCategory()

    // Sửa câu lệnh SQL trong phương thức listCategory()
    public static ArrayList<Category> listCategory() {
        ArrayList<Category> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT ca.id, ca.categoryName FROM Categories ca";  // sửa category_id thành id và name_category thành Name
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet resultSet = pre.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                int idCategory = resultSet.getInt("id");  // sửa category_id thành id
                String categoryName = resultSet.getString("categoryName");  // sửa name_category thành Name
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
        ArrayList<Category> list1 = listCategory();
        for (Category category : list1) {
            System.out.println(category);
        }
    }
}