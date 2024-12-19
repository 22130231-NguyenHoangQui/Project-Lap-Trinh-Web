package com.edu.hcmuaf.fit.service;

import com.edu.hcmuaf.fit.dao.DAOProduct;
import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.model.ProductImages;

import java.util.ArrayList;

public class ProductService {
    static ProductService instance;
    private ProductService() {

    }
    public static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();
        }
        return instance;
    }
    public static ArrayList<Product> listSixProduct(int offset) {
        ArrayList<Product> listProduct = DAOProduct.listProduct(offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        for(Product p:listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setProductImages(listImageOfProduct);
        }
        return listProduct;
    }
//    lấy ra sản phẩm đang là xu hướng
    public static ArrayList<Product> listProductBestSelling(int offset) {
        ArrayList<Product> listProduct = DAOProduct.listProductBestSelling(offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        for(Product p:listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setProductImages(listImageOfProduct);

        }
        return listProduct;
    }
//    lấy sản phẩm đang bán chạy trong tháng
    public static ArrayList<Product> listProductBestSellingInMonth(int offset) {
        ArrayList<Product> result = DAOProduct.listProductBessInMonth(offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        for (Product p: result) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setProductImages(listImageOfProduct);
        }
        return result;
    }
//    lấy sản phẩm ngẫu nhiên cho trang danh mục
    public static ArrayList<Product> listProductRandom(int offset) {
        ArrayList<Product> result = DAOProduct.listRandomProduct(offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        for (Product p: result) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setProductImages(listImageOfProduct);
        }
        return result;
    }
    public static void main(String[] args) {
//        listProductBestSelling(1);
//        System.out.println(listProductBestSelling(1));

        System.out.println(listProductRandom(1));

    }

}
