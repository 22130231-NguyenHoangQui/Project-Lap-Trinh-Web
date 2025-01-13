package com.edu.hcmuaf.fit.model;

public class SizePrice {
    private int id;
    private int idProduct;
    private int diameter;
    private int height;
    private double price;

  public SizePrice(int id, int idProduct, int diameter, int height, double price) {
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

    public int getDiameter() {
        return diameter;
    }

    public void setDiameter(int diameter) {
        this.diameter = diameter;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
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
