package com.edu.hcmuaf.fit.model;

import com.edu.hcmuaf.fit.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class Product {
    private int id;
    public String nameProduct;
    private int quantity;
    private String description;
    private Date created_at;
    private Date updated_at;
    private ArrayList<ProductImages> productImages;
    private ArrayList<ProductSizes> productSizes;
    private int categoryId;
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
        this.idCate = idCate;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.description = description;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.productImages = productImages;
        this.sizePrices = sizePrices;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCate() {
        return idCate;
    }

    public void setIdCate(int idCate) {
        this.idCate = idCate;
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

    public ArrayList<ProductSizes> getSizes() {
        return productSizes;
    }

    public void setSizes(ArrayList<ProductSizes> sizes) {
        this.productSizes = productSizes;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public ArrayList<ProductImages> getProductImages() {
        return productImages;
    }

    public void setProductImages(ArrayList<ProductImages> productImages) {
        this.productImages = productImages;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    private void loadCategoryId() {
        String sql = "SELECT ca.category_id \n" +
                "FROM categoryproduct cp\n" +
                "JOIN category ca ON cp.category_id = ca.category_id\n" +
                "WHERE cp.product_id = ?\n" +
                "LIMIT 1";
        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement pr = connection.prepareStatement(sql)) {

            pr.setInt(1, this.id); // Sử dụng id của sản phẩm hiện tại
            ResultSet resultSet = pr.executeQuery();

            while (resultSet.next()) {
//                categoryId.add(resultSet.getInt("category_id"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

//    public String getFormattedPrice() {
//        NumberFormat format = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
//        return format.format(this.price);
//    }

    public double getPrice() {
        if (productSizes != null && !productSizes.isEmpty()) {
            return productSizes.get(0).getPrice(); // Lấy giá của kích cỡ đầu tiên
        }
        return 0;
    }

    public ArrayList<String> getAllProductImages() {
        ArrayList<String> imageUrls = new ArrayList<>();

        if (this.productImages != null) {
            for (ProductImages productImage : this.productImages) {
                imageUrls.add(productImage.getUrl());
            }
        }

        return imageUrls;
    }

    public double getMinPrice() {
        double minPrice = Double.MAX_VALUE; // Khởi tạo giá trị tối đa

        if (productSizes != null && !productSizes.isEmpty()) {
            for (ProductSizes size : productSizes) {
                double price = size.getPrice();
                if (price < minPrice) {
                    minPrice = price;
                }
            }
        }

        return minPrice;
    }

    public double getMaxPrice() {
        double maxPrice = Double.MIN_VALUE; // Khởi tạo giá trị tối thiểu

        if (productSizes != null && !productSizes.isEmpty()) {
            for (ProductSizes size : productSizes) {
                double price = size.getPrice();
                if (price > maxPrice) {
                    maxPrice = price;
                }
            }
        }

        return maxPrice;
    }

    public String getFormattedPrice(double price) {
        NumberFormat format = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
        format.setGroupingUsed(true); // Kích hoạt phân cách hàng nghìn
        return format.format(price); // Trả về giá đã định dạng
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

    public static void main(String[] args) {
        Product p = new Product();
//        p.setPrice(5000000.0);
//
//        System.out.println(p.getFormattedPrice());
    }
}
