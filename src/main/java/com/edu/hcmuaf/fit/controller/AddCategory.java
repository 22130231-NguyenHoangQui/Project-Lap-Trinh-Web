package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.nio.file.Paths;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Category;
import com.edu.hcmuaf.fit.service.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "addCategory", value = "/addCategory")
public class AddCategory extends HttpServlet {
    // Thư mục để lưu ảnh
    private static final String IMAGE_DIR = "D:\\du_an\\GitHub\\Project-Lap-Trinh-Web\\src\\main\\webapp\\Products"; // Cập nhật lại đường dẫn đúng

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        // Lấy thông tin danh mục từ form
        String categoryName = request.getParameter("nameCateAdd");
        String imageCate = request.getParameter("imageCateAdd");

        // Tạo đối tượng Category
        Category category = new Category(categoryName,imageCate);
        String res = "";

        // Thêm danh mục vào cơ sở dữ liệu
        if (CategoryService.getInstance().insertCategory(category) > 0) {
            Category categoryLatest = CategoryService.getInstance().latestCategory();  // Lấy danh mục mới nhất

            // Xử lý phần hình ảnh nếu có
            for (Part part : request.getParts()) {
                if (isFilePart(part)) {
                    String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    if (fileName != null && !fileName.isEmpty()) {
                        // Thêm ảnh vào cơ sở dữ liệu
                        if (CategoryService.getInstance().insertImageOfCategory(categoryLatest.getId(), fileName) < 1) {
                            res = "Đã xảy ra lỗi!";
                        }
                        // Lưu ảnh vào thư mục
                        String filePath = IMAGE_DIR + File.separator + fileName;
                        part.write(filePath);
                        System.out.println(123);
                    }
                }
            }

            res = "Thêm danh mục thành công!";
        } else {
            res = "Đã xảy ra lỗi khi thêm danh mục!";
        }

        // Lấy danh sách danh mục từ cơ sở dữ liệu
        ArrayList<Category> listCategory = CategoryService.getInstance().listCategory();
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();

        for (Category c : listCategory) {
            JSONObject cateJSON = new JSONObject();
            cateJSON.put("id", c.getId());
            cateJSON.put("name", c.getName());
            cateJSON.put("imageUrl", c.getImageUrl());  // Cập nhật trường imageUrl để gửi lại URL ảnh
            htmlDataArray.put(cateJSON);
        }

        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);

        // Gửi JSON response về client
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }

    // Hàm kiểm tra xem phần này có phải là file không
    private boolean isFilePart(Part part) {
        String contentDisposition = part.getHeader("Content-Disposition");
        return contentDisposition != null && contentDisposition.contains("filename=");
    }
}