package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import org.json.JSONObject;
import org.json.JSONArray;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "PriceFilterServlet", value = "/PriceFilter-servlet")
public class PriceFilter extends HttpServlet {
    private String message;


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");

        String priceMin = request.getParameter("priceMin");
        String priceMax = request.getParameter("priceMax");
        int priceMinInt = Integer.parseInt(priceMin);
        int priceMaxInt = Integer.parseInt(priceMax);
        PrintWriter out = response.getWriter();
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        ArrayList<Product> listProduct = ProductService.getProductsByRange(priceMinInt,priceMaxInt,0);
        JSONObject jsonRespon = new JSONObject();
        JSONArray   htmlDataArray = new JSONArray();
        for(Product p : listProduct) {
            JSONObject productJson = new JSONObject();
            productJson.put("id", p.getId());
//            productJson.put("idCate",p.getCategoryId());
            productJson.put("imageUrl",url + "\\Products\\" + ((p.getProductImages().isEmpty())?"":p.getProductImages().get(0).getUrl()));
            productJson.put("price",p.getPrice());
            productJson.put("name",p.getNameProduct());
            htmlDataArray.put(productJson);
        }
        jsonRespon.put("data", htmlDataArray);
        jsonRespon.put("url", url);
        out.println(jsonRespon.toString());
    }
}