package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.nio.file.Paths;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.UUID;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "addProduct", value = "/addProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class AddProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        String name = request.getParameter("nameProduct");
        System.out.println(name);
        String price = request.getParameter("priceProductAdd");
        String idCate = request.getParameter("idCate");
        int idCategory=4;
        if(idCate.equals("Bánh Sinh Nhật")){
            idCategory =1;
        }
        String height = request.getParameter("height");
        String diameter = request.getParameter("diameter");
        String detail = request.getParameter("detail");

        Product p = new Product();
        p.setIdCate(idCategory);
        p.setNameProduct(name);
        p.setDescription(detail);
        String realPath = getServletContext().getRealPath("/Products");
        String res = "Thêm sản phẩm thành công!";

        // Thêm sản phẩm vào cơ sở dữ liệu
        if (ProductService.getInstance().insertProduct(p) > 0) {
            Product productLatest = ProductService.getInstance().latestProduct();

            // Thêm giá của sản phẩm vào ProductSizes
            int priceInt = Integer.parseInt(price);
            ProductService.getInstance().insertPriceProduct(productLatest.getId(), diameter, height, priceInt);

            // Xử lý phần hình ảnh nếu có
            for (Part part : request.getParts()) {
                if (isFilePart(part)) {
                    String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    if (fileName != null && !fileName.isEmpty()) {
                        if (ProductService.getInstance().insertImageOfProduct(productLatest.getId(), fileName) < 1) {
                            res = "Đã xảy ra lỗi!";
                        }
                        part.write(realPath + File.separator + fileName);
                        part.write("D:\\du_an\\GitHub\\Project-Lap-Trinh-Web\\src\\main\\webapp\\Products" + File.separator + fileName);

                    }
                }
            }
        }

        // Lấy danh sách sản phẩm và trả về JSON
        ArrayList<Product> listProduct = ProductService.getInstance().listAllProduct(0);
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

//        for (Product p : listProduct) {
//            JSONObject productJSON = new JSONObject();
//            productJSON.put("idProduct", p.getId());
//            productJSON.put("imageUrl", url + "/Products/" + ((p.getProductImages().isEmpty()) ? "" : p.getProductImages().get(0).getUrl()));
//            productJSON.put("name", p.getNameProduct());
////            productJSON.put("price", nF.format(p.getPrice()));
//            productJSON.put("quantity", p.getQuantity());
//            htmlDataArray.put(productJSON);
//        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);

        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }


    private boolean isFilePart(Part part) {
        return part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty();
    }
    public static String generateUniqueIdentifier() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }

}
