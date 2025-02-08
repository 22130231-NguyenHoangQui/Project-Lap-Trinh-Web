package com.edu.hcmuaf.fit.model;

import java.util.ArrayList;
import java.util.Date;

public class Order {
    private int id;
    private int idAccount;
    private Date createdAt;
    private double totalInvoice;
    private int statusOrder;
    private String address;
    private String description;
    private ArrayList<OrderDetail> details;
    public Order(int id, int idAccount, Date createdAt, double totalInvoice, int statusOrder, String address) {
        this.id = id;
        this.idAccount = idAccount;
        this.createdAt = createdAt;
        this.totalInvoice = totalInvoice;
        this.statusOrder = statusOrder;
        this.address = address;
    }

    public Order(int id, int idAccount, Date startDate, int status) {
        this.id = id;
        this.idAccount = idAccount;
        this.createdAt = startDate;
        this.statusOrder = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<OrderDetail> getDetails() {
        return details;
    }

    public void setDetails(ArrayList<OrderDetail> details) {
        this.details = details;
    }

    public Order(int id, int idAccount, Date createdAt, double totalInvoice, int statusOrder, String address, String description) {
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

    public Order(int id, int idAccount, String address, Date startDate, int status) {
        this.id = id;
            this.address = address;
            this.statusOrder = status;
    }

    public Order(int id, int id1, String address, int totalInvoice, int statusOrder, Date date) {
            this.id = id;
            this.idAccount = id1;
            this.address = address;
            this.totalInvoice = totalInvoice;
            this.statusOrder = statusOrder;
            this.createdAt = date;
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

    public int getStatusOrder() {
        return statusOrder;
    }

    public void setStatusOrder(int statusOrder) {
        this.statusOrder = statusOrder;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
