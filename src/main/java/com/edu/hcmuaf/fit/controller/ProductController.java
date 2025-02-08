package com.edu.hcmuaf.fit.controller;

import com.edu.hcmuaf.fit.model.*;
import com.edu.hcmuaf.fit.service.CategoryService;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "product", value = "/DetailProduct")
public class ProductController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String productIdParam = request.getParameter("pid");
        String sizeParam = request.getParameter("size");
        String cateIdParam = request.getParameter("cid");

        if (productIdParam != null && !productIdParam.isEmpty()) {
            try {
                int productId = Integer.parseInt(productIdParam);
                int cateId = -1; // Giá trị mặc định khi không có tham số `cid`

                // Kiểm tra xem tham số `cid` có tồn tại không
                if (cateIdParam != null && !cateIdParam.isEmpty()) {
                    cateId = Integer.parseInt(cateIdParam);
                }

                // Gọi ProductService để lấy thông tin sản phẩm từ DB
                Product product = ProductService.getInstance().getDetailProductById(productId);
                Category category = null;

                // Nếu có `cateId`, lấy category theo id
                if (cateId != -1) {
                    category = CategoryService.getInstance().getCategoryById(cateId);
                }

                if (product != null) {
                    // Lấy giá trị min và max của sản phẩm
                    String minPrice = ProductService.getInstance().getMinPriceByProductId(productId);
                    String maxPrice = ProductService.getInstance().getMaxPriceByProductId(productId);
                    ArrayList<Integer> diameters = ProductService.getInstance().getDiametersByProductId(productId);
                    double price = -1; // Giá mặc định nếu không có kích thước hợp lệ
                    ArrayList<SizePrice> sizePriceList  = ProductService.getInstance().getProductSizeByProductIdAndDiameter(productId);
                    SizePrice lowestSizePrice = sizePriceList.isEmpty() ? null : sizePriceList.get(0);
                    String nameCate = category != null ? category.getName() : "";
                    ArrayList<String> imageUrls = new ArrayList<>();
                    ArrayList<ProductImages> productImages = ProductService.getInstance().getProductImages(productId);
                    for (ProductImages productImage : productImages) {
                        imageUrls.add(productImage.getUrl()); // Lấy URL của từng hình ảnh
                    }
                    request.setAttribute("cateName", nameCate);
                    request.setAttribute("lowestSizePrice", lowestSizePrice);
                    request.setAttribute("priceSize", sizePriceList);
                    request.setAttribute("product", product);
                    request.setAttribute("minPrice", minPrice);
                    request.setAttribute("maxPrice", maxPrice);
                    request.setAttribute("diameters", diameters);
                    request.setAttribute("selectedPrice", price);
                    request.setAttribute("product.getProductImages", imageUrls);

                    request.getRequestDispatcher("detailProduct.jsp").forward(request, response);
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
