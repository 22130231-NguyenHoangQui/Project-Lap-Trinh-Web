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

@WebServlet(name = "homePage", value = "/homepage")
public class HomeController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");

//        ArrayList<Category> listCategory = CategoryService.getInstance().getListCategory(0);
//        request.setAttribute("listCategory", listCategory);

        ArrayList<Product> listSixProduct = ProductService.getInstance().listAllProduct(0);
        request.setAttribute("listP", listSixProduct);
//        load sản phẩm đang là xu hướng
        ArrayList<Product> listProductBestSelling = ProductService.getInstance().listProductBestSelling(0);
        request.setAttribute("listProductBestSelling", listProductBestSelling);
//        load sản phẩm đang bán chạy trong tháng
        ArrayList<Product> listProductMonth = ProductService.getInstance().listProductBestSellingInMonth(0);
        request.setAttribute("listProductMonth", listProductMonth);

        try {
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
    }
}