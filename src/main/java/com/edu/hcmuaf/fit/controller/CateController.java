package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Category;
import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.CategoryService;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "CateControllerServlet", value = "/CateController-servlet")
public class CateController extends HttpServlet {
     public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
//        load danh mục bán chạy nhất
        ArrayList<Category> listCateOk = CategoryService.getInstance().getListCategory(0);
        request.setAttribute("listCateOk", listCateOk);
//        load danh sách danh mục
        ArrayList<Category> listCate = CategoryService.getInstance().getListCategory();
        request.setAttribute("listCate", listCate);
//        load sản phẩm ngẫu nhiên nếu vô trang danh mục
        ArrayList<Product> listProduct = ProductService.getInstance().listProductRandom(0);
        request.setAttribute("listProductRandom", listProduct);

         // Tìm sản phẩm có giá cao nhất và thấp nhất
         Product highestPricedProduct = null;
         Product lowestPricedProduct = null;

         for (Product p : listProduct) {
             if (highestPricedProduct == null || p.getPrice() > highestPricedProduct.getPrice()) {
                 highestPricedProduct = p;
             }
             if (lowestPricedProduct == null || p.getPrice() < lowestPricedProduct.getPrice()) {
                 lowestPricedProduct = p;

             }

         }
         int highestPrice = (int) Math.round(highestPricedProduct.getPrice());
         int lowestPrice = (int) Math.round(lowestPricedProduct.getPrice());

         request.setAttribute("lowestPrice", lowestPrice);
         request.setAttribute("highestPrice", highestPrice);
        try {
            request.getRequestDispatcher("ProductCatalog.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
    }
}