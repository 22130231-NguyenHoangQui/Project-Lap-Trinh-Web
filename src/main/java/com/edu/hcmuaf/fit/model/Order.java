package com.edu.hcmuaf.fit.model;

import java.util.Date;

public class Order {
    private int id;
    private int idAccount;
    private Date createdAt;
    private double totalInvoice;
    private String statusOrder;
    private String address;
    private String description;
    public Order(int id, int idAccount, Date createdAt, double totalInvoice, String statusOrder, String address) {
        this.id = id;
        this.idAccount = idAccount;
        this.createdAt = createdAt;
        this.totalInvoice = totalInvoice;
        this.statusOrder = statusOrder;
        this.address = address;
    }

    public Order(int id, int idAccount, Date createdAt, double totalInvoice, String statusOrder, String address, String description) {
        this.id = id;
        this.idAccount = idAccount;
        this.createdAt = createdAt;
        this.totalInvoice = totalInvoice;
        this.statusOrder = statusOrder;
        this.address = address;
        this.description = description;
    }

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(int idAccount) {
        this.idAccount = idAccount;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public double getTotalInvoice() {
        return totalInvoice;
    }

    public void setTotalInvoice(double totalInvoice) {
        this.totalInvoice = totalInvoice;
    }

    public String getStatusOrder() {
        return statusOrder;
    }

    public void setStatusOrder(String statusOrder) {
        this.statusOrder = statusOrder;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
