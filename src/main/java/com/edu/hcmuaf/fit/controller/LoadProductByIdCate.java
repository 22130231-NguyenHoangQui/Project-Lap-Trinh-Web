package com.edu.hcmuaf.fit.controller;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "LoadProductByIdCate", value = "/LoadProductByIdCate")
public class LoadProductByIdCate extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Đặt mã hóa UTF-8 cho request và response
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json"); // Đổi content type thành JSON

        // Lấy tham số categoryId từ request
        String cid = request.getParameter("cid");
        ArrayList<Product> productsCate = ProductService.listProductByIdCate(Integer.parseInt(cid), 0);
        System.out.println(productsCate);
        // Tạo JSONArray để chứa danh sách sản phẩm
        JSONArray jsonArray = new JSONArray();

        // Duyệt qua danh sách sản phẩm và thêm vào JSON array
        for (Product p : productsCate) {
            JSONObject jsonProduct = new JSONObject();
            jsonProduct.put("id", p.getId());
            jsonProduct.put("name", p.getNameProduct());
            jsonProduct.put("price", p.getSizePrices().get(0).getPrice());
            jsonProduct.put("image", p.getProductImages().get(0).getUrl()); // Lưu URL hình ảnh
            jsonProduct.put("description", p.getDescription());
            jsonProduct.put("quantity", p.getQuantity());

            // Thêm sản phẩm vào mảng JSON
            jsonArray.put(jsonProduct);
        }

        // Trả về JSON
        PrintWriter out = response.getWriter();
        out.print(jsonArray.toString());
        out.flush();
    }

    public void destroy() {
    }

}
