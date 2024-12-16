package com.edu.hcmuaf.fit.model;

public class ProductImages {
    private int id;
    private int productId;
    private String imageId;

    public ProductImages(String imageId) {
        this.imageId = imageId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getImageId() {
        return imageId;
    }

    public void setImageId(String imageId) {
        this.imageId = imageId;
    }

    @Override
    public String toString() {
        return "ProductImages{" +
                "id=" + id +
                ", productId=" + productId +
                ", imageId='" + imageId + '\'' +
                '}';
    }
}
