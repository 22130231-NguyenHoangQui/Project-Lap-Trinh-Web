package com.edu.hcmuaf.fit.model;

public class OrderDetail {
    private int idOrder;
    private int idProduct;
    private double totalPrice;
    private int quantity;

    public OrderDetail(int idOrder, int idProduct, double totalPrice, int quantity) {
        this.idOrder = idOrder;
        this.idProduct = idProduct;
        this.totalPrice = totalPrice;
        this.quantity = quantity;
    }

    public OrderDetail() {
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
