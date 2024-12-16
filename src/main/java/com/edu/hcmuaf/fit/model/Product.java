package com.edu.hcmuaf.fit.model;

import java.util.ArrayList;
import java.util.Date;

public class Product {
    private int id;
    private String nameProduct;
    private int quantity;
    private String diameter;
    private String height;
    private int price;
    private String description;
    private Date created_at;
    private Date updated_at;
    private ArrayList<ProductImages> productImages;


    public Product() {
    }


    public Product(String nameProduct, int quantity, String diameter, String height, int price, String description) {
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.diameter = diameter;
        this.height = height;
        this.price = price;
        this.description = description;
    }

    public Product(int id, String nameProduct, int quantity, String diameter, String height, int price, String description, Date created_at, Date updated_at, ArrayList<ProductImages> productImages) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.diameter = diameter;
        this.height = height;
        this.price = price;
        this.description = description;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.productImages = productImages;
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

    public String getDiameter() {
        return diameter;
    }

    public void setDiameter(String diameter) {
        this.diameter = diameter;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", nameProduct='" + nameProduct + '\'' +
                ", quantity=" + quantity +
                ", diameter='" + diameter + '\'' +
                ", height='" + height + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                ", productImages=" + productImages +
                '}';
    }


}
