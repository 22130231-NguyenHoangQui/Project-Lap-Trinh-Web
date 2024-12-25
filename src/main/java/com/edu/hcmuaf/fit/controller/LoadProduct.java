package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "LoadProductServlet", value = "/LoadProduct-servlet")
public class LoadProduct extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        ArrayList<Product> listProduct = ProductService.getInstance().listProductRandom(0);
        request.setAttribute("listProductRandom", listProduct);

    }

    public void destroy() {
    }
}