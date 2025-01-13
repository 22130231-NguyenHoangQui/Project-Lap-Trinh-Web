package com.edu.hcmuaf.fit.model;

public class Category {
    private int id;
    private String name;
    private int totalQuantity;
    private String imageUrl;

    public Category( String name, int totalQuantity, String imageUrl) {
        this.name = name;
        this.totalQuantity = totalQuantity;
        this.imageUrl = imageUrl;
    }

    public Category() {
    }

    public Category(int id, String name) {

    }

    public Category(String categoryName) {
        this.name = categoryName;
    }

    public Category(String categoryName, String imageCate) {
        this.name = categoryName;
        this.imageUrl = imageCate;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public int getTotalQuantity() {
        return totalQuantity;
    }
    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", totalQuantity=" + totalQuantity +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
    }
}
