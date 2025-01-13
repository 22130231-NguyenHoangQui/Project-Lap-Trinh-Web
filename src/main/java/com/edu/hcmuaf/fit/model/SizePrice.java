package com.edu.hcmuaf.fit.model;

public class SizePrice {
    private int id;
    private int idProduct;
    private String diameter;
    private String height;
    private double price;

    public SizePrice(int id, int idProduct, String diameter, String height, double price) {
        this.id = id;
        this.idProduct = idProduct;
        this.diameter = diameter;
        this.height = height;
        this.price = price;
    }

    public SizePrice() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
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

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "SizePrice{" +
                "id=" + id +
                ", idProduct=" + idProduct +
                ", diameter='" + diameter + '\'' +
                ", height='" + height + '\'' +
                ", price=" + price +
                '}';
    }
}
