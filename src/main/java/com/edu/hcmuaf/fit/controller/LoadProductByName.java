package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "LoadProductByNameServlet", value = "/LoadProductByName-servlet")
public class LoadProductByName extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String name = request.getParameter("name");
//        load danh sách nằm trong tên tìm kiếm được
        ArrayList<Product> listProductByName = ProductService.getInstance().listProductByName(name);
        request.setAttribute("listProductByName", listProductByName);
        request.setAttribute("exits", "CÓ " + listProductByName.size() + " KẾT QUẢ TÌM KIẾM PHÙ HỢP VỚI TỪ KHÓA " + "'" + name + "'");
    }

}