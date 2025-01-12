package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.text.NumberFormat;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "delProduct", value = "/delProduct")
public class DelProduct extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        String res = "";
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        ArrayList<Product> listProduct = null;
        if(ProductService.getInstance().delProduct(id)>0) {
            listProduct = ProductService.getInstance().listAllProduct(0);
            res = "Xóa thành công!";
        }else {
            res = "Đã xảy ra lỗi!";
            listProduct = ProductService.getInstance().listAllProduct(0);
        }
        for (Product p : listProduct) {
            JSONObject productJSON = new JSONObject();
            productJSON.put("idProduct", p.getId());
            productJSON.put("imageUrl", url +"/Products/" +((p.getProductImages().isEmpty())?"":p.getProductImages().get(0).getUrl()));
            productJSON.put("name", p.getNameProduct());
            productJSON.put("price", nF.format(p.getSizePrices().get(0).getPrice()));
            productJSON.put("quantity", p.getQuantity());
//            productJSON.put("status", (p.isStatus())?"Đang bán":"Ngưng bán");
            htmlDataArray.put(productJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }


}