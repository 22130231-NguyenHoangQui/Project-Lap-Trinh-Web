package com.edu.hcmuaf.fit.model;

public class OrderDetail {
    private int idOrder;
    private int idProduct;
    private double totalPrice;
    private int quantity;
    private Account account;
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

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "idOrder=" + idOrder +
                ", idProduct=" + idProduct +
                ", totalPrice=" + totalPrice +
                ", quantity=" + quantity +
                ", account=" + account +
                '}';
    }
}
