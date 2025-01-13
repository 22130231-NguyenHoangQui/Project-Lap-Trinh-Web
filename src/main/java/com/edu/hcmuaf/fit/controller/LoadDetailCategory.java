package com.edu.hcmuaf.fit.controller;

import java.io.*;

import com.edu.hcmuaf.fit.model.Category;
import com.edu.hcmuaf.fit.service.CategoryService;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

@WebServlet(name = "loadDetailCategory", value = "/loadDetailCategory")
public class LoadDetailCategory extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String categoryId = request.getParameter("id");
        int categoryIdInt = Integer.parseInt(categoryId);

        Category c = CategoryService.getInstance().getCategoryById(categoryIdInt);
        JSONObject jsonRes = new JSONObject();
        JSONObject categoryJSON = new JSONObject();
        categoryJSON.put("id", c.getId());
        categoryJSON.put("name", c.getName());
        categoryJSON.put("imageUrl", c.getImageUrl());
        jsonRes.put("category", categoryJSON);

        PrintWriter out = response.getWriter();
        out.write(jsonRes.toString());
    }
}