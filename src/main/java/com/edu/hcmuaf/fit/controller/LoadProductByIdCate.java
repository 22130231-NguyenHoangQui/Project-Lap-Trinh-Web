package com.edu.hcmuaf.fit.controller;

import com.edu.hcmuaf.fit.model.Cart;
import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;
import java.text.NumberFormat;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "LoadProductByIdCate", value = "/LoadProductByIdCate")
public class LoadProductByIdCate extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Đặt mã hóa UTF-8 cho request và response
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Lấy tham số categoryId từ request
        String cid = request.getParameter("cid");
        ArrayList<Product> productsCate = ProductService.listProductByIdCate(Integer.parseInt(cid), 0);

        // Khởi tạo PrintWriter để ghi ra response
        PrintWriter out = response.getWriter();

        // Lấy session và giỏ hàng từ session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("Cart");

        // URL gốc để tạo link cho ảnh sản phẩm
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

        // Khởi tạo định dạng tiền tệ
        NumberFormat nF = NumberFormat.getCurrencyInstance();

        // Duyệt qua danh sách sản phẩm và tạo HTML cho từng sản phẩm
        for (Product p : productsCate) {
            int quantity = 1;

            // Kiểm tra số lượng sản phẩm trong giỏ hàng
            if (cart != null) {
                if (cart.get(p.getId()) != null) {
                    quantity = cart.get(p.getId()).getQuantity() + 1;
                } else {
                    quantity = p.getQuantity();
                }
            }

            // Kiểm tra nếu danh sách SizePrices không trống để tránh lỗi IndexOutOfBoundsException
            String productPrice = "Liên hệ để biết giá"; // Giá mặc định nếu không có giá
            if (!p.getSizePrices().isEmpty()) {
                productPrice = nF.format(p.getSizePrices().get(0).getPrice());
            }

            // Tạo HTML cho sản phẩm
            out.println("<div class=\"col\">\n" +
                    "    <div class=\"col-inner\">\n" +
                    "        <div class=\"product-small box\">\n" +
                    "            <div class=\"box-image\">\n" +
                    "                <a href=\"detail-product?pid=" + p.getId() + "&cid=" + p.getIdCate() + "\" class=\"product-link\">\n" +
                    "                    <img src=\"" + url + "\\Products\\" + ((p.getProductImages().isEmpty()) ? "" : p.getProductImages().get(0).getUrl()) + "\" class=\"card-img-top img_p\" id=\"img_center\" alt=\"...\">\n" +
                    "                </a>\n" +
                    "            </div>\n" +
                    "            <div class=\"box-text text-center\">\n" +
                    "                <div class=\"title-wrapper\">\n" +
                    "                    <p><a href=\"detail-product?pid=" + p.getId() + "&cid=" + p.getIdCate() + "\">" + p.getNameProduct() + "</a></p>\n" +
                    "                </div>\n" +
                    "                <div class=\"price-wrapper\">\n" +
                    "                    <span class=\"price\">\n" +
                    "                        <span class=\"woocommerce-Price-amount amount\">\n" +
                    "                            <bdi style=\"font-weight: bold;\">" + productPrice + "</bdi>\n" +
                    "                        </span>\n" +
                    "                    </span>\n" +
                    "                </div>\n" +
                    "                <div class=\"description-wrapper\">\n" +
                    "                    <p>" + (p.getDescription() == null ? "No description available" : p.getDescription()) + "</p>\n" +
                    "                </div>\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "</div>");

        }
    }
}
