package com.edu.hcmuaf.fit.controller;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "product", value = "/DetailProduct")
public class ProductController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String productIdParam = request.getParameter("id"); // Kiểm tra tham số 'id' thay vì 'productId'
        if (productIdParam != null && !productIdParam.isEmpty()) {
            try {
                int productId = Integer.parseInt(productIdParam);
                // Gọi ProductService để lấy thông tin sản phẩm từ DB
                Product product = ProductService.getInstance().getDetailProductById(productId);

                if (product != null) {
                    request.setAttribute("product", product); // Chuyển sản phẩm vào request
                    request.getRequestDispatcher("detailProduct.jsp").forward(request, response); // Chuyển đến trang chi tiết
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Sản phẩm không tồn tại"); // Nếu không tìm thấy sản phẩm
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu tham số id");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
