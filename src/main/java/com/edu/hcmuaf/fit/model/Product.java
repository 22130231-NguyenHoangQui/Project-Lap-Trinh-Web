package com.edu.hcmuaf.fit.model;

import com.edu.hcmuaf.fit.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class Product {
    private int id;
    private int idCate;
    private String nameProduct;
    private int quantity;
    private String description;
    private Date created_at;
    private Date updated_at;
    private ArrayList<ProductImages> productImages;
    private ArrayList<SizePrice> sizePrices;
    private boolean status;
    private int quatityOrder;

    public Product(int id, int idCate, String nameProduct, int quantity, String description, Date created_at, Date updated_at, ArrayList<ProductImages> productImages, ArrayList<SizePrice> sizePrices, boolean status) {
        this.id = id;
        this.idCate = idCate;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.description = description;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.productImages = productImages;
        this.sizePrices = sizePrices;
        this.status = status;
    }

    public Product(int id, int idCate, String nameProduct, int quantity, String description,boolean status) {
        this.id = id;
        this.idCate = idCate;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.description = description;
        this.status = status;
    }

    public Product(int id, String nameProduct, int quantity, String description) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.description = description;
    }

    public Product(String nameProduct, int quantity, String description) {
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.description = description;
    }

    public Product(int idCate, String nameProduct, int quantity, String description, boolean status) {
        this.idCate = idCate;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.description = description;
        this.status = status;
    }

    public Product() {

    }

    public int getQuatityOrder() {
        return quatityOrder;
    }

    public void setQuatityOrder(int quatityOrder) {
        this.quatityOrder = quatityOrder;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", idCate=" + idCate +
                ", nameProduct='" + nameProduct + '\'' +
                ", quantity=" + quantity +
                ", description='" + description + '\'' +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                ", productImages=" + productImages +
                ", sizePrices=" + sizePrices +
                ", status=" + status +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCate() {
        return idCate;
    }

    public void setIdCate(int idCate) {
        this.idCate = idCate;
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

    public ArrayList<SizePrice> getSizePrices() {
        return sizePrices;
    }

    public void setSizePrices(ArrayList<SizePrice> sizePrices) {
        this.sizePrices = sizePrices;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }


    public void quantityUp() {
        this.quantity++;
    }

    public void quantityUp(int quantity) {
        setQuantity(quantity);
    }

    public void setFirstImageUrl(String firstImageUrl) {

    }
}