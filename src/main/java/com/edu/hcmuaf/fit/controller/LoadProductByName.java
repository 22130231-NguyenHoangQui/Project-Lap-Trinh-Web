package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.text.NumberFormat;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.model.ProductSizes;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@WebServlet(name = "LoadProductByNameServlet", value = "/LoadProductByName-servlet")
public class LoadProductByName extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");

        String name = request.getParameter("s");

        // Lấy danh sách sản phẩm theo tên
        ArrayList<Product> listProductByName = ProductService.getInstance().listProductByName(name);
        request.setAttribute("listProductRandom", listProductByName);
        // Tạo đối tượng PrintWriter để gửi phản hồi về client
        PrintWriter out = response.getWriter();
        NumberFormat nf = NumberFormat.getCurrencyInstance();

        // Lặp qua danh sách sản phẩm và in HTML
        for (Product product : listProductByName) {
            // Lấy danh sách kích cỡ của sản phẩm
            ArrayList<ProductSizes> productSizes = product.getSizes();
            if (productSizes != null && !productSizes.isEmpty()) {
                out.println(" <div class=\"col\">\n" +
                        "    <div class=\"col-inner\">\n" +
                        "        <div class=\"product-small box\">\n" +
                        "            <div class=\"box-image\">\n" +
                        "                <a href=\"#\" class=\"product-link\" onclick=\"saveProductData('" + product.getId() + "')\">\n" +
                        "                    <img width=\"247\" height=\"296\" src=\"" + product.getProductImages() + "\" alt=\"" + product.getNameProduct() + "\">\n" +
                        "                </a>\n" +
                        "            </div>\n" +
                        "            <div class=\"box-text text-center\">\n" +
                        "                <div class=\"title-wrapper\">\n" +
                        "                    <p>\n" +
                        "                        <a href=\"#\">" + product.getNameProduct() + "</a>\n" +
                        "                    </p>\n" +
                        "                </div>\n" +
                        "                <div class=\"price-wrapper\">\n" +
                        "                    <span class=\"price\">\n");

                // Lặp qua từng kích cỡ và hiển thị giá và thông tin kích cỡ
                for (ProductSizes size : productSizes) {
                    double price = size.getPrice();  // Lấy giá của từng kích cỡ
                    out.println("                        <span class=\"woocommerce-Price-amount amount\">\n" +
                            "                            <bdi style=\"font-weight: bold;\">" + nf.format(price) + "</bdi>\n" +
                            "                        </span>\n");
                }

                out.println("                    </span>\n" +
                        "                </div>\n" +
                        "                <div class=\"add-to-cart-button\">\n" +
                        "                    <a href=\"#\" onclick=\"saveProductData('" + product.getId() + "')\">THÊM VÀO GIỎ</a>\n" +
                        "                </div>\n" +
                        "                <div class=\"product-description\" style=\"display:none;\">\n" +
                        "                    <span class=\"description-id\">Mã: <span class=\"sku\">" + product.getId() + "</span></span>\n" +
                        "                    <span class=\"description-content\">Mô tả: <br>" + product.getDescription() + "</span>\n" +
                        "                </div>\n");

                // Hiển thị thông tin của tất cả các kích cỡ
                out.println("                 <div class=\"size-wrapper\">\n");
                for (ProductSizes size : productSizes) {
                    out.println("                    <p><strong>Đường kính:</strong> " + size.getDiameter() + "</p>\n" +
                            "                    <p><strong>Chiều cao:</strong> " + size.getHeight() + "</p>\n" +
                            "                    <p><strong>Giá:</strong> " + nf.format(size.getPrice()) + "</p>\n");
                }
                out.println("                </div>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "    </div>\n" +
                        "</div>");
            }
        }
    }
}