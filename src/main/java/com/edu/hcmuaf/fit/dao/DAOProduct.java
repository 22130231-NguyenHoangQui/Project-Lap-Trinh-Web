package com.edu.hcmuaf.fit.dao;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.model.ProductImages;
import com.edu.hcmuaf.fit.model.ProductSizes;
import com.edu.hcmuaf.fit.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DAOProduct {
    //    test
    public static ArrayList<Product> listProduct(int offset) {
        ArrayList<Product> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "select * from product LIMIT 10 OFFSET ?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, offset);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("product_id");
                String nameProduct = rs.getString("name_product");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                ArrayList<ProductSizes> productSizes = listSizeOfProduct(id);
                Product product = new Product(id, nameProduct, quantity, description, productSizes);
                re.add(product);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return re;
    }

    //    lấy ra sản phẩm đang là xu hướng
    public static ArrayList<Product> listProductBestSelling(int offset) {
        ArrayList<Product> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "SELECT pro.product_id, pro.name_product,pi.image_url, SUM(orr.quantity * pro.price) AS total_revenue\n" +
                    "FROM OrderDetails orr\n" +
                    "JOIN Product pro ON orr.product_id = pro.product_id\n" +
                    "JOIN productimages pi ON pro.product_id = pi.product_id\n" +
                    "GROUP BY pro.product_id\n" +
                    "ORDER BY total_revenue DESC\n" +
                    "LIMIT 10 OFFSET ?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, offset);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String nameProduct = rs.getString("name_product");
                String imageUrl = rs.getString("image_url");
                int total_revenue = rs.getInt("total_revenue");
                Product product = new Product();
                product.setNameProduct(nameProduct);
                product.setId(product_id);
                re.add(product);
            }
            JDBCUtil.closeConnection(connection);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    //   lấy ra sản phẩm bán chạy trong tháng
    public static ArrayList<Product> listProductBessInMonth(int offset) {
        ArrayList<Product> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "SELECT p.product_id, p.name_product, SUM(od.quantity) AS totalQuantity\n" +
                    "FROM product p\n" +
                    "JOIN orderdetails od ON p.product_id = od.product_id\n" +
                    "JOIN orders o ON od.order_id = o.order_id\n" +
                    "WHERE o.created_at BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()\n" +
                    "GROUP BY p.product_id, p.name_product\n" +
                    "ORDER BY totalQuantity DESC\n" +
                    "LIMIT 10 OFFSET ?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, offset);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String nameProduct = rs.getString("name_product");
                int totalQuantity = rs.getInt("totalQuantity");
                Product product = new Product();
                product.setNameProduct(nameProduct);
                product.setId(product_id);
                re.add(product);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return re;
    }


    //  lấy danh sách hình ảnh của 1 sản phẩm
    public static ArrayList<ProductImages> listImageOfProduct(Product p) {
        ArrayList<ProductImages> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "Select pi.imageUrl " + "from productimages pi " + "where pi.productId = ?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, p.getId());
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                String url = resultSet.getString("image_url");
                ProductImages img = new ProductImages(url);
                re.add(img);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;

    }

//    load sản phẩm theo mã danh mục
public static ArrayList<Product> listProductByIdCate(int categoryId, int offset) {
    ArrayList<Product> products = new ArrayList<>();
    String sql = """
            SELECT p.product_id, ca.category_id, p.name_product, p.quantity, p.description,
                   ps.diameter, ps.height, ps.price
            FROM product p
            JOIN categoryproduct capo ON p.product_id = capo.product_id
            JOIN category ca ON capo.category_id = ca.category_id
            LEFT JOIN productsizes ps ON p.product_id = ps.product_id
            WHERE ca.category_id = ?
            LIMIT 6 OFFSET ?""";

    try (Connection connection = JDBCUtil.getConnection();
         PreparedStatement pr = connection.prepareStatement(sql)) {
        pr.setInt(1, categoryId);
        pr.setInt(2, offset);

        try (ResultSet rs = pr.executeQuery()) {
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String name = rs.getString("name_product");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");

                String diameter = rs.getString("diameter");
                String height = rs.getString("height");
                int price = rs.getInt("price");

                Product product = new Product();
                product.setId(productId);
                product.setNameProduct(name);
                product.setQuantity(quantity);
                product.setDescription(description);

                if (diameter != null || height != null || price > 0) {
                    ProductSizes size = new ProductSizes(diameter, height, price);
                    product.getSizes().add(size);
                }

                products.add(product);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return products;
}

    // load 12 sản phẩm ngẫu nhiên
    public static ArrayList<Product> listRandomProduct(int offset) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = """
            SELECT p.product_id, p.name_product, p.quantity, p.description,
                   ps.diameter, ps.height, ps.price
            FROM product p
            LEFT JOIN productsizes ps ON p.product_id = ps.product_id
            ORDER BY RAND()
            LIMIT 12 OFFSET ?""";

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement pr = connection.prepareStatement(sql)) {
            pr.setInt(1, offset); // Sử dụng offset để phân trang

            try (ResultSet rs = pr.executeQuery()) {
                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    String name = rs.getString("name_product");
                    int quantity = rs.getInt("quantity");
                    String description = rs.getString("description");
                    Product product = new Product();
                    product.setId(productId);
                    product.setNameProduct(name);
                    product.setQuantity(quantity);
                    product.setDescription(description);
                    products.add(product); // Thêm sản phẩm vào danh sách
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }


    // Lấy danh sách sizes của sản phẩm
    public static ArrayList<ProductSizes> listSizeOfProduct(int productId) {
        ArrayList<ProductSizes> productSizes = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "SELECT * FROM productsizes WHERE productId = ?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, productId);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                String diameter = rs.getString("diameter");
                String hight = rs.getString("hight");
                int price = rs.getInt("price");
                productSizes.add(new ProductSizes(diameter, hight, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.closeConnection(connection);
        }
        return productSizes;
    }

    // Lấy danh sách image của sản phẩm theo Id
    public static ArrayList<ProductImages> getImagesByProductId(int productId) {
        ArrayList<ProductImages> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT * FROM ProductImages WHERE productId = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1,productId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                //                int id = resultSet.getInt("id");
                String urlImage = rs.getString("imageUrl");
                int idProduct = rs.getInt("productId");

                ProductImages img = new ProductImages(urlImage,idProduct);

                re.add(img);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    //  danh sách sản phẩm tìm kiểm bởi tên
    public static ArrayList<Product> listProductByName(String nameProduct) {
        nameProduct = nameProduct.trim();
        ArrayList<Product> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String[] tuKhoa = nameProduct.split("\\s+");
        StringBuilder sqlbuilder = new StringBuilder("SELECT p.product_id, p.name_product, p.price, p.quantity, p.description, pi.image_url\n" +
                "FROM Product p\n" +
                "JOIN ProductImages pi ON p.product_id = pi.product_id\n" +
                "WHERE");
        for (int i = 0; i < tuKhoa.length; i++) {
            sqlbuilder.append(" p.name_product COLLATE utf8mb4_general_ci LIKE ?");
            if (i < tuKhoa.length - 1) {
                sqlbuilder.append(" AND");
            }
        }
        try {
            PreparedStatement pr = connection.prepareStatement(sqlbuilder.toString());
            for (int i = 0; i < tuKhoa.length; i++) {
                pr.setString(i + 1, "%" + tuKhoa[i] + "%");
            }
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int product_id = resultSet.getInt("product_id");
                String name = resultSet.getString("name_product");
                int price = resultSet.getInt("price");
                Product product = new Product();
                product.setNameProduct(name);
                product.setId(product_id);
//                product.setPrice(price);
                re.add(product);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    // Lấy thông tin chi tiết của sản phẩm theo ID
    public static Product getDetailProductById(int productId) {
        Product product = null;
        Connection connection = JDBCUtil.getConnection();
        try {
            // Truy vấn thông tin sản phẩm
            String sql = """
            SELECT p.id, p.productName, p.quantity, p.description, 
                   pi.imageUrl, ps.diameter, ps.height, ps.price
            FROM products p
            LEFT JOIN productimages pi ON p.id = pi.productId
            LEFT JOIN productsizes ps ON p.id = ps.productId
            WHERE p.id = ?""";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, productId);
            ResultSet rs = pr.executeQuery();

            // Lấy thông tin sản phẩm từ kết quả truy vấn
            if (rs.next()) {
                String nameProduct = rs.getString("productName");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");

                // Tạo đối tượng Product
                product = new Product();
                product.setId(productId);
                product.setNameProduct(nameProduct);
                product.setQuantity(quantity);
                product.setDescription(description);

                // Lấy các hình ảnh của sản phẩm
                ArrayList<ProductImages> images = getImagesByProductId(productId);
                product.setProductImages(images);

                // Lấy các kích thước của sản phẩm (nếu có)
                ArrayList<ProductSizes> sizes = listSizeOfProduct(productId);
                product.setSizes(sizes);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public static void main(String[] args) {
//        p.setId(1);
//        System.out.println(listImageOfProduct(p));

//        for (Product product : listProductByIdCate(1, 0)) {
//            System.out.println(product);
//        }

//
//            Product product = new Product();
//            product.setId(1);  // Giả sử sản phẩm có ID là 1
//
//        ArrayList<ProductImages> images = listImageOfProduct(product);
//            // Gọi phương thức listImageOfProduct
//            System.out.println(product.getProductImages().get(0).getUrl());
//        for (Product product : getProductsByPriceRange(0, 10000)) {
//            System.out.println(product);
//        }

//        LoadProductByName loadProductByName = new LoadProductByName();
//        String name = "product";
//        ArrayList<Product> listProductByName = ProductService.getInstance().listProductByName(name);
//        for (Product product : listProductByName) {
//            System.out.println(product);
//        }

        // ID sản phẩm cần kiểm tra
        int productId = 14;

        // Gọi phương thức để lấy chi tiết sản phẩm
        Product product1 = getDetailProductById(productId);

        if (product1 != null) {
            System.out.println("Thông tin sản phẩm:");
            System.out.println("ID: " + product1.getId());
            System.out.println("Tên: " + product1.getNameProduct());
            System.out.println("Giá: " + product1.getPrice());
            System.out.println("url: " + product1.getAllProductImages());
            System.out.println("Mô tả: " + product1.getDescription());
        } else {
            System.out.println("Không tìm thấy sản phẩm với ID: " + productId);
        }
    }
}
