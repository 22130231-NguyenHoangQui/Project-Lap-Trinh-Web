package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "homePage", value = "/homepage1234")
public class ProductController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        //load 6 sản phẩm
        ArrayList<Product> listSixProduct = ProductService.getInstance().listSixProduct(1);
        request.setAttribute("listP", listSixProduct);
//
        try {
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
    }

    public static void main(String[] args) {


    }
}