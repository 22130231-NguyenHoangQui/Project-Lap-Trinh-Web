package com.edu.hcmuaf.fit.model;

public class ProductImages {
    private int id;
    private String url;
    private int productId;

    public ProductImages(int id, String url, int productId) {
        this.id = id;
        this.url = url;
        this.productId = productId;
    }

    public ProductImages(String url, int productId) {
        this.url = url;
        this.productId = productId;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "ProductImages{" +
                "id=" + id +
                ", productId=" + productId +
                ", url='" + url + '\'' +
                '}';
    }
}
