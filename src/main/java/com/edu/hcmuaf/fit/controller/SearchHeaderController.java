package com.edu.hcmuaf.fit.controller;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchProductByName", value = "/SearchProductByName")
public class SearchHeaderController extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");

        // Lấy tham số tìm kiếm từ request (tên sản phẩm)
        String name = request.getParameter("s");

        // Lấy danh sách sản phẩm từ Service
        List<Product> listProductByName = productService.searchProductsByName(name);

        // Lấy URL của ảnh đầu tiên cho từng sản phẩm và thêm vào thuộc tính của request
        for (Product product : listProductByName) {
            String firstImageUrl = productService.getFirstImageUrl(product);
            product.setFirstImageUrl(firstImageUrl);  // Thêm URL ảnh đầu tiên vào sản phẩm
        }

        // Đưa danh sách sản phẩm vào request attribute
        request.setAttribute("listProductByName", listProductByName);

        // Chuyển hướng đến trang cate.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("cate");
        dispatcher.forward(request, response);
    }
}