package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.text.NumberFormat;

import com.edu.hcmuaf.fit.model.Category;
import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.CategoryService;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

@WebServlet(name = "LoadDetailProductServlet", value = "/LoadDetailProduct-servlet")
public class LoadDetailProduct extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Đoạn mã hiện tại để lấy chi tiết sản phẩm...
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String id = request.getParameter("idProduct");
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        Product p = ProductService.getInstance().getProductById(Integer.parseInt(id));
        Category category = CategoryService.getInstance().getCategoryById(p.getIdCate());
        JSONObject jsonRes = new JSONObject();
        JSONObject productJSON = new JSONObject();
        productJSON.put("idProduct", p.getId());
        productJSON.put("imageCenter", url +"\\Products\\" +((p.getProductImages().isEmpty())?"":p.getProductImages().get(0).getUrl()));
        productJSON.put("imageDetail",p.getProductImages());
        productJSON.put("name", p.getNameProduct());
        productJSON.put("priceImport", nF.format(p.getSizePrices().get(0).getPrice()));
        productJSON.put("price", nF.format(p.getSizePrices().get(0).getPrice()));
        productJSON.put("quantity", p.getQuantity());
        productJSON.put("description", p.getDescription());
        productJSON.put("diameter", p.getSizePrices().get(0).getDiameter());
        productJSON.put("height", p.getSizePrices().get(0).getHeight());
        productJSON.put("typeCate", category.getName());
        jsonRes.put("product", productJSON);
        PrintWriter out = response.getWriter();
        response.getWriter().write(jsonRes.toString());
    }
}
