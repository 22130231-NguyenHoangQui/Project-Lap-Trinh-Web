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
    public static ArrayList<Category> listCategory(int offset) {
        ArrayList<Category> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT c.categoryName AS category_name, c.imageUrl AS category_img, SUM(orr.quantity) AS total_quantity_sold " +
                "FROM OrderDetails orr " +
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
    public static ArrayList<Category> listCategory() {
        ArrayList<Category> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT ca.id, ca.categoryName, ca.imageUrl   FROM categories ca";  // sửa category_id thành id và name_category thành Name
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet resultSet = pre.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                int idCategory = resultSet.getInt("id");  // sửa category_id thành id
                String categoryName = resultSet.getString("categoryName");  // sửa name_category thành Name
                String imageUrl = resultSet.getString("imageUrl");
                category.setName(categoryName);
                category.setId(idCategory);
                category.setImageUrl(imageUrl);
                list.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBCUtil.closeConnection(connection);
        return list;
    }

    public static void main(String[] args) {
//        ArrayList<Category> list1 = listCategory(0);
//        for (Category category : list1) {
//            System.out.println(category);
//        }
//    getCategoryById(1);
        System.out.println(getCategoryById(1));
    }

    public static Category getCategoryById(int id) {
        Category category = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "Select id, categoryName, imageUrl from categories where id =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, id);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int idCate = resultSet.getInt("id");
                String name = resultSet.getString("categoryName");
                String imageUrl = resultSet.getString("imageUrl");
                category = new Category(id, name);
                category.setId(idCate);
                category.setName(name);
                category.setImageUrl(imageUrl);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return category;
    }
    //Xoá danh mục
    public static synchronized int delCategory(int id) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement s = connection.prepareStatement("select id from categories where id =?");
            s.setInt(1, id);
            ResultSet resultSet = s.executeQuery();
            if (resultSet.next()) {
                // Xóa tất cả các bản ghi trong bảng orderdetails có productId liên quan
                s = connection.prepareStatement("delete from orderdetails where productId in (select id from products where categoryId = ?)");
                s.setInt(1, id);
                s.executeUpdate();

                // Xóa tất cả các bản ghi trong bảng productImages có productId liên quan
                s = connection.prepareStatement("delete from productImages where productId in (select id from products where categoryId = ?)");
                s.setInt(1, id);
                s.executeUpdate();

                // Xóa tất cả các bản ghi trong bảng productSizes có productId liên quan
                s = connection.prepareStatement("delete from productSizes where productId in (select id from products where categoryId = ?)");
                s.setInt(1, id);
                s.executeUpdate();

                // Xóa tất cả các sản phẩm trong bảng products thuộc categoryId
                s = connection.prepareStatement("delete from products where categoryId =?");
                s.setInt(1, id);
                s.executeUpdate();

                // Cuối cùng, xóa category
                s = connection.prepareStatement("delete from categories where id =?");
                s.setInt(1, id);
                re = s.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.closeConnection(connection);
        }
        return re;
    }

    public static synchronized int updateCategory(Category c) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement s = connection.prepareStatement("select id from categories where id =?");
            s.setInt(1, c.getId());
            ResultSet resultSet = s.executeQuery();
            if (resultSet.next()) {
                s = connection.prepareStatement("UPDATE categories SET " + "name = ? " + "WHERE id =?");
                s.setString(1, c.getName());
                s.setInt(2, c.getId());
                re = s.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBCUtil.closeConnection(connection);
        return re;

    }

    public static int insertCategory(Category c) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into categories(categoryName, imageUrl) " +
                "values(?,?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, c.getName());
            pr.setString(2, c.getImageUrl());
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }


}
