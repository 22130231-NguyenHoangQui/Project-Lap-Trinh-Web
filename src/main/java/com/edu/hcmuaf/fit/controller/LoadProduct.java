package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.text.NumberFormat;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

//@WebServlet(name = "LoadProductServlet", value = "/LoadProduct-servlet")
//public class LoadProduct extends HttpServlet {
//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html");
//        String name = request.getParameter("s");
//
//        ArrayList<Product> listProduct = ProductService.getInstance().listProductRandom(0);
//
//        // Tìm sản phẩm có giá cao nhất
//        Product highestPricedProduct = null;
//        for (Product p : listProduct) {
//            if (highestPricedProduct == null || p.getPrice() > highestPricedProduct.getPrice()) {
//                highestPricedProduct = p;
//            }
//        }
//
//        // Đặt sản phẩm có giá cao nhất vào request để sử dụng trong JSP
//        request.setAttribute("highestPricedProduct", highestPricedProduct);
//
//        // In ra danh sách sản phẩm (có thể sẽ chuyển sang JSP sau này)
//        PrintWriter out = response.getWriter();
//        NumberFormat nf = NumberFormat.getCurrencyInstance();
//        for (Product p : listProduct) {
//            out.println("<div class=\"col\">\n" +
//                    "    <div class=\"col-inner\">\n" +
//                    "        <div class=\"product-small box\">\n" +
//                    "            <div class=\"box-image\">\n" +
//                    "                <a href=\"#\" class=\"product-link\">\n" +
//                    "                    <img width=\"247\" height=\"296\" src=\""  + "\" alt=\"" + p.getNameProduct() + "\">\n" +
//                    "                </a>\n" +
//                    "            </div>\n" +
//                    "            <div class=\"box-text text-center\">\n" +
//                    "                <div class=\"title-wrapper\">\n" +
//                    "                    <p><a href=\"#\">" + p.getNameProduct() + "</a></p>\n" +
//                    "                </div>\n" +
//                    "                <div class=\"price-wrapper\">\n" +
//                    "                    <span class=\"price\">\n" +
//                    "                        <span class=\"woocommerce-Price-amount amount\">\n" +
//                    "                            <bdi style=\"font-weight: bold;\">" + nf.format(p.getPrice()) + "</bdi>\n" +
//                    "                        </span>\n" +
//                    "                    </span>\n" +
//                    "                </div>\n" +
//                    "                <div class=\"add-to-cart-button\">\n" +
//                    "                    <a href=\"#\">THÊM VÀO GIỎ</a>\n" +
//                    "                </div>\n" +
//                    "            </div>\n" +
//                    "        </div>\n" +
//                    "    </div>\n" +
//                    "</div>");
//        }
//
//        // Chuyển đến JSP nếu cần, hoặc làm tiếp xử lý khác
//        // request.getRequestDispatcher("ProductCatalog.jsp").forward(request, response);
//    }
//
//    public void destroy() {
//    }
//}
@WebServlet(name = "LoadProductServlet", value = "/LoadProduct-servlet")
public class LoadProduct extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");

        ArrayList<Product> listProduct = ProductService.getInstance().listProductRandom(0);
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();



    }

    public void destroy() {
    }


}

