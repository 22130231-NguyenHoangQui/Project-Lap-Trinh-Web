package com.edu.hcmuaf.fit.model;

import java.text.NumberFormat;
import java.util.Locale;

public class ProductSizes {
    private int id;
    private int idProduct;
    private String diameter;
    private String height;
    private double price;


    public ProductSizes(int id, int idProduct, String diameter, String height, double price) {
        this.id = id;
        this.idProduct = idProduct;
        this.diameter = diameter;
        this.height = height;
        this.price = price;
    }

    public ProductSizes(int id, String diameter, String height, double price) {
        this.id = id;
        this.diameter = diameter;
        this.height = height;
        this.price = price;
    }

    public ProductSizes(String diameter, String height, double price) {
        this.diameter = diameter;
        this.height = height;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "ProductSize{" +
                "id=" + id +
                ", diameter='" + diameter + '\'' +
                ", height='" + height + '\'' +
                ", price=" + price +
                '}';
    }
}

