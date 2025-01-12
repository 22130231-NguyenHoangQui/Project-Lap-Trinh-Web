package com.edu.hcmuaf.fit.model;

import com.edu.hcmuaf.fit.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Product {
    private int id;
    private String nameProduct;
    private int quantity;
    private String description;
    private Date createdAt;
    private Date updatedAt;
    private ArrayList<ProductImages> productImages;
    private ArrayList<ProductSizes> productSizes;
    private List<Integer> categoryId;

    public Product() {
    }


    public Product(String nameProduct, int quantity, ArrayList<ProductSizes> productSizes, String description) {
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.productSizes = productSizes;
        this.description = description;
    }

    public Product(int id, String nameProduct, int quantity, ArrayList<ProductSizes> productSizes, String description, Date createdAt, Date updated_at, ArrayList<ProductImages> productImages) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.createdAt = createdAt;
        this.description = description;
        this.updatedAt = createdAt;
        this.productSizes = productSizes;
        this.productImages = productImages;
    }

    public Product(int id, String nameProduct, int quantity, String description, ArrayList<ProductSizes> productSizes) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.description = description;
        this.productSizes = productSizes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public List<ProductSizes> getSizes() {
        return productSizes;
    }

    public void setSizes(List<ProductSizes> sizes) {
        this.productSizes = productSizes;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreated_at() {
        return createdAt;
    }

    public void setCreated_at(Date created_at) {
        this.createdAt = createdAt;
    }

    public Date getUpdated_at() {
        return updatedAt;
    }

    public void setUpdated_at(Date updated_at) {
        this.updatedAt = updated_at;
    }

    public ArrayList<ProductImages> getProductImages() {
        return productImages;
    }

    public void setProductImages(ArrayList<ProductImages> productImages) {
        this.productImages = productImages;
    }


    public List<Integer> getCategoryId() {
        if(categoryId == null) {
            categoryId = new ArrayList<>();
            loadCategoryId();

        }
        return categoryId;
    }

    private void loadCategoryId() {
        String sql ="SELECT ca.category_id \n" +
                "FROM categoryproduct cp\n" +
                "JOIN category ca ON cp.category_id = ca.category_id\n" +
                "WHERE cp.product_id = ?\n" +
                "LIMIT 1";
        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement pr = connection.prepareStatement(sql)) {

            pr.setInt(1, this.id); // Sử dụng id của sản phẩm hiện tại
            ResultSet resultSet = pr.executeQuery();

            while (resultSet.next()) {
                categoryId.add(resultSet.getInt("category_id"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Product {")
                .append("id=").append(id)
                .append(", productName='").append(nameProduct).append('\'')
                .append(", quantity=").append(quantity)
                .append(", description='").append(description).append('\'')
                .append(", createdAt=").append(createdAt)
                .append(", updatedAt=").append(updatedAt)
                .append(", categoryId=").append(categoryId)
                .append(", images=").append(productImages != null ? productImages.toString() : "[]")
                .append(", sizes=").append(productSizes != null ? productSizes.toString() : "[]")
                .append('}');
        return sb.toString();
    }
}
