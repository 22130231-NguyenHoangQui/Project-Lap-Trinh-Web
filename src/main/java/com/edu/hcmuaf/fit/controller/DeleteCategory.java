package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Category;
import com.edu.hcmuaf.fit.service.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "delCategory", value = "/delCategory")
public class DeleteCategory extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String idCategoryText = request.getParameter("id");
        int idCate = Integer.parseInt(idCategoryText);
        String res = "";
        JSONObject jsonResponse = new JSONObject();

        JSONArray htmlDataArray = new JSONArray();
        ArrayList<Category> listCategory = null;
        try {
            if (CategoryService.getInstance().delCategory(idCate) > 0) {
                listCategory = CategoryService.getInstance().listCategory();
                res = "Xóa thành công!";
            } else {
                res = "Đã xảy ra lỗi!";
                listCategory = CategoryService.getInstance().listCategory();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        for (Category c : listCategory) {
            JSONObject cateJSON = new JSONObject();
            cateJSON.put("id", c.getId());
            cateJSON.put("name", c.getName());
            htmlDataArray.put(cateJSON);
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