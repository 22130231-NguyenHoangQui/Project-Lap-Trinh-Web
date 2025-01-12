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
            listImageOfProduct = DAOProduct.listImageOfProduct(p.getId());
            p.setProductImages(listImageOfProduct);
        }
        return listProduct;
    }
//    lấy ra sản phẩm đang là xu hướng
    public static ArrayList<Product> listProductBestSelling(int offset) {
        ArrayList<Product> listProduct = DAOProduct.listProductBestSelling(offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        for(Product p:listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p.getId());
            p.setProductImages(listImageOfProduct);

        }
        return listProduct;
    }
//    lấy sản phẩm đang bán chạy trong tháng
    public static ArrayList<Product> listProductBestSellingInMonth(int offset) {
        ArrayList<Product> result = DAOProduct.listProductBessInMonth(offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        for (Product p: result) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p.getId());
            p.setProductImages(listImageOfProduct);
        }
        return result;
    }
//    lấy sản phẩm ngẫu nhiên cho trang danh mục
    public static ArrayList<Product> listProductRandom(int offset) {
        ArrayList<Product> result = DAOProduct.listRandomProduct(offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        for (Product p: result) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p.getId());
            p.setProductImages(listImageOfProduct);
        }
        return result;
    }
    public static ArrayList<Product> listProductByIdCate(int id,int offset) {
        ArrayList<Product> listProduct = DAOProduct.listProductByIdCate(id,offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        for (Product p: listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p.getId());
            p.setProductImages(listImageOfProduct);

        }
        return listProduct;
    }
//    lấy ra sản phẩm tìm kiếm theo tên
    public static  ArrayList<Product> listProductByName(String name) {
        ArrayList<Product> listProduct = DAOProduct.listProductByName(name);
        ArrayList<ProductImages> listImageOfProduct = null;
        for (Product p: listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p.getId());
            p.setProductImages(listImageOfProduct);
        }
    return listProduct;
    }
//    cat nhat san pham theo gia
public static ArrayList<Product> getProductsByRange(int minPrice, int maxPrice, int offset) {
    ArrayList<Product> listProduct = DAOProduct.getProductsByPriceRange(minPrice, maxPrice, offset);
    ArrayList<ProductImages> listImageOfProduct = null;
    for (Product p : listProduct) {
        listImageOfProduct = DAOProduct.listImageOfProduct(p.getId());
        p.setProductImages(listImageOfProduct);
    }
    return listProduct;
}

    public static void main(String[] args) {
        ArrayList<Product> listProduct = ProductService.getInstance().listProductRandom(0);
        Product highestPricedProduct = null;
        Product lowestPricedProduct = null;
for (Product p : listProduct) {

                System.out.println(p);
}
//        for (Product p : listProduct) {
//            if (highestPricedProduct == null || p.getPrice() > highestPricedProduct.getPrice()) {
//                highestPricedProduct = p;
//            }
//            if (lowestPricedProduct == null || p.getPrice() < lowestPricedProduct.getPrice()) {
//                lowestPricedProduct = p;
//                System.out.println(lowestPricedProduct.getPrice());
//
//            }
//        }
    }

}
