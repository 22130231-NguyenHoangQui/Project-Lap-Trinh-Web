package com.edu.hcmuaf.fit.controller;


import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.model.ProductImages;
import com.edu.hcmuaf.fit.model.SizePrice;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "editProduct", value = "/editProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class EditProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        String name = request.getParameter("nameProductEdit");
        String price = request.getParameter("priceProductEdit");
        String idCate = request.getParameter("idCate");
        String diameter = request.getParameter("diameterEdit");
        String height = request.getParameter("heightEdit");
        int quantity = Integer.parseInt(request.getParameter("quantityEdit"));
        String des = request.getParameter("desEdit");
        String[] imgs = request.getParameterValues("imageAvai");

        if (imgs != null) {
            for (int i = 0; i < imgs.length; i++) {
                imgs[i] = imgs[i].substring(9);
            }
        }
        String res = "Chỉnh sửa thành công!";
        int idCategory = 4;
        if (idCate.equals("Bánh Sinh Nhật")) {
            idCategory = 1;
        }
        Product newProduct = new Product(id,name, quantity, des);
        try {
            if (ProductService.getInstance().updateProduct(newProduct) > 0) {
                // Xử lý hình ảnh sản phẩm
                ArrayList<ProductImages> imgList = ProductService.getInstance().getImgsByIdP(id);
                List<String> urlList = new ArrayList<>();
                for (ProductImages img : imgList) {
                    urlList.add(img.getUrl());
                }
                // Xác định và xóa các phần tử lặp lại
                List<String> elementsToRemove = new ArrayList<>();
                if (imgs != null) {
                    elementsToRemove.addAll(Arrays.asList(imgs));
                }
                urlList.removeAll(elementsToRemove);
                for (String url : urlList) {
                    if (ProductService.getInstance().deleteImgProduct(id, url) <= 0) {
                        res = "Đã xảy ra lỗi!";
                    }
                }

                // Lấy danh sách size-price cũ
                ArrayList<SizePrice> priceList = ProductService.getInstance().getPriceByIdP(id);

                // Lấy danh sách kích thước và giá từ request
//                if (diameter != null && height != null && price != null
//                        && diameter.length == heights.length && heights.length == prices.length) {
//
//                    // Tạo danh sách size-price mới
//                    List<SizePrice> updatedPriceList = new ArrayList<>();
//                    for (int i = 0; i < diameters.length; i++) {
//                        SizePrice sizePrice = new SizePrice();
//                        sizePrice.setDiameter(diameters[i].trim());
//                        sizePrice.setHeight(heights[i].trim());
//                        sizePrice.setPrice(Integer.parseInt(prices[i].trim())); // Parse giá sang số nguyên
//                        sizePrice.setIdProduct(id); // Gắn productId làm khóa ngoại
//                        updatedPriceList.add(sizePrice);
//                    }
//
//                    // Xác định và xóa size-price không còn tồn tại
//                    List<SizePrice> sizesToRemove = new ArrayList<>(priceList);
//                    sizesToRemove.removeAll(updatedPriceList);
//                    for (SizePrice sizeToRemove : sizesToRemove) {
//                        if (ProductService.getInstance().deleteSizePrice(sizeToRemove) <= 0) {
//                            res = "Đã xảy ra lỗi khi xóa size-price!";
//                        }
//                    }
//
//                    // Thêm mới hoặc cập nhật size-price
//                    for (SizePrice updatedPrice : updatedPriceList) {
//                        boolean isExisting = false;
//                        for (SizePrice oldPrice : priceList) {
//                            if (oldPrice.getDiameter().equals(updatedPrice.getDiameter()) &&
//                                    oldPrice.getHeight().equals(updatedPrice.getHeight())) {
//                                // Nếu tồn tại, cập nhật giá
//                                oldPrice.setPrice(updatedPrice.getPrice());
//                                if (ProductService.getInstance().updateSizePrice(oldPrice) <= 0) {
//                                    res = "Đã xảy ra lỗi khi cập nhật size-price!";
//                                }
//                                isExisting = true;
//                                break;
//                            }
//                        }
//                        // Nếu không tồn tại, thêm mới
//                        if (!isExisting) {
//                            if (ProductService.getInstance().insertSizePrice(updatedPrice) <= 0) {
//                                res = "Đã xảy ra lỗi khi thêm size-price!";
//                            }
//                        }
//                    }
//                } else {
//                    res = "Dữ liệu size hoặc price không hợp lệ!";
//                }
            } else {
                res = "Đã xảy ra lỗi!";
            }

            String realPath = getServletContext().getRealPath("/Products");
            for (Part part : request.getParts()) {
                if (isFilePart(part)) {
                    String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    String newFileName = generateUniqueIdentifier() + "_" + fileName;
                    if (fileName != null && !fileName.isEmpty()) {
                        if (ProductService.getInstance().insertImageOfProduct(id, newFileName) < 1) {
                            res = "Đã xảy ra lỗi!";
                        }
                    }
                    part.write(realPath + File.separator + fileName);
                    part.write("D:\\du_an\\GitHub\\Project-Lap-Trinh-Web\\src\\main\\webapp\\Products" + File.separator + fileName);
                }
            }
        } catch (SQLException e) {
            res = "Đã xảy ra lỗi!";
        }
        ArrayList<Product> listProduct = ProductService.getInstance().listAllProduct(0);
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        for (Product p : listProduct) {
            JSONObject productJSON = new JSONObject();
            productJSON.put("idProduct", p.getId());
            productJSON.put("imageUrl", url + "/Products/" + ((p.getProductImages().isEmpty()) ? "" : p.getProductImages().get(0).getUrl()));
            productJSON.put("name", p.getNameProduct());
            productJSON.put("price",
                    p.getSizePrices().isEmpty() ? "" : nF.format(p.getSizePrices().get(0).getPrice())
            );
            productJSON.put("quantity", p.getQuantity());
            productJSON.put("status", (p.isStatus()) ? "Đang bán" : "Ngưng bán");
            htmlDataArray.put(productJSON);
        }
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