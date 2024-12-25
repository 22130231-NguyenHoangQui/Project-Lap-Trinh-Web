package com.edu.hcmuaf.fit.controller;import java.io.*;
import java.text.NumberFormat;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "LoadProductByIdCate", value = "/LoadProductByIdCate")
public class LoadProductByIdCate extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        String cid = request.getParameter("cid");
        ArrayList<Product> productsCate = ProductService.listProductByIdCate(Integer.parseInt(cid), 0);
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        PrintWriter out = response.getWriter();
        NumberFormat nf = NumberFormat.getCurrencyInstance();
        for (Product p : productsCate) {

            out.println(" <div class=\"col\">\n" +
                    "    <div class=\"col-inner\">\n" +
                    "        <div class=\"product-small box\">\n" +
                    "            <div class=\"box-image\">\n" +
                    "                <a href=\"#\" class=\"product-link\" onclick=\"saveProductData('${productData}')\">\n" +
                    "                    <img width=\"247\" height=\"296\" src=\"${product.image}\" alt=\"${product.name}\">\n" +
                    "                </a>\n" +
                    "            </div>\n" +
                    "            <div class=\"box-text text-center\">\n" +
                    "                <div class=\"title-wrapper\">\n" +
                    "                    <p>\n" +
                    "                        <a href=\"#\" > p.getNameProduct()</a>\n" +
                    "                    </p>\n" +
                    "                </div>\n" +
                    "                <div class=\"price-wrapper\">\n" +
                    "                    <span class=\"price\">\n" +
                    "                        <span class=\"woocommerce-Price-amount amount\">\n" +
                    "                            <bdi style=\"font-weight: bold;\">p.getPrice()</bdi>\n" +
                    "                        </span>\n" +
                    "                    </span>\n" +
                    "                </div>\n" +
                    "                <div class=\"add-to-cart-button\">\n" +
                    "                    <a href=\"#\" onclick=\"saveProductData('${productData}')\">THÊM VÀO GIỎ</a>\n" +
                    "                </div>\n" +
                    "                <div class=\"product-description\" style=\"display:none;\">\n" +
                    "                    <span class=\"description-id\">Mã: <span class=\"sku\">${product.id}</span></span>\n" +
                    "                    <span class=\"description-content\">Mô tả: <br>${product.description}</span>\n" +
                    "                </div>\n" +
                    "                 <div class=\"size-wrapper\" style=\"display:none;\">\n" +
                    "                    <p ><strong>Đường kính:</strong> ${product.diameter}</p> <!-- Hiển thị đường kính -->\n" +
                    "                    <p><strong>Chiều cao:</strong> ${product.height}</p> <!-- Hiển thị chiều cao -->\n" +
                    "                </div>\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "</div>");
        }

    }

    public void destroy() {
    }

}