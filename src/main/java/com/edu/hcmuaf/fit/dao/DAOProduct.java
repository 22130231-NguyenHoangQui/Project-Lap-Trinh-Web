package com.edu.hcmuaf.fit.dao;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.model.ProductImages;
import com.edu.hcmuaf.fit.model.SizePrice;
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
            String sql = "select * from products LIMIT 10 OFFSET ?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, offset);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                String nameProduct = rs.getString("productName");
                int quantity = rs.getInt("quantity");
//                String diameter = rs.getString("diameter");
//                String height = rs.getString("height");
//                int price = rs.getInt("price");
                String description = rs.getString("description");
//                Product product = new Product(nameProduct, quantity, description);
//                re.add(product);
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
            String sql = "SELECT pro.product_id, pro.productName,pi.image_url, SUM(orr.quantity * pro.price) AS total_revenue\n" +
                    "FROM OrderDetails orr\n" +
                    "JOIN Products pro ON orr.product_id = pro.product_id\n" +
                    "JOIN productimages pi ON pro.product_id = pi.product_id\n" +
                    "GROUP BY pro.product_id\n" +
                    "ORDER BY total_revenue DESC\n" +
                    "LIMIT 10 OFFSET ?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, offset);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String nameProduct = rs.getString("productName");
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
            String sql = "SELECT p.id, p.name_product, SUM(od.quantity) AS totalQuantity\n" +
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
    public static ArrayList<ProductImages> listImageOfProduct(int idP) {
        ArrayList<ProductImages> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "Select id, imageUrl, productId from productimages  where productId = ?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idP);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
                String urlImage = resultSet.getString("imageUrl");
                int idProduct = resultSet.getInt("productId");

                ProductImages img = new ProductImages(urlImage,idProduct);

                re.add(img);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;

    }
    public static ArrayList<SizePrice> listPriceOfProduct(int idP) {
        ArrayList<SizePrice> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "Select id, diameter, price, height, productId from productsizes  where productId = ?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idP);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String diameter = resultSet.getString("diameter");
                double price = resultSet.getDouble("price");
                String height = resultSet.getString("height");
                int idProduct = resultSet.getInt("productId");

                SizePrice sp = new SizePrice(id,idProduct,diameter,height,price);
                re.add(sp);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;

    }

    //    load sản phẩm theo mã danh mục
    public static ArrayList<Product> listProductByIdCate(int id, int offset) {
        ArrayList<Product> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "SELECT p.product_id,ca.category_id,p.name_product,p.quantity,p.diameter,p.price,p.height,p.description\n" +
                    "FROM product as p\n" +
                    "JOIN categoryproduct capo ON p.product_id = capo.product_id\n" +
                    "JOIN category ca ON capo.category_id = ca.category_id\n" +
                    "WHERE ca.category_id = ?\n" +
                    "LIMIT 6 OFFSET ?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, id);
            pr.setInt(2, offset);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int product_id = resultSet.getInt("product_id");
                int category = resultSet.getInt("category_id");
                String name = resultSet.getString("name_product");
                int price = resultSet.getInt("price");
                Product product = new Product();
                product.setNameProduct(name);
                product.setId(product_id);
//                product.setPrice(price);
//                product.getCategoryId();
                re.add(product);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;

    }

    // load 12 sản phẩm ngẫu nhiên
    public static ArrayList<Product> listRandomProduct(int offset) {
        ArrayList<Product> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "SELECT * FROM Products WHERE id = 138 ORDER BY RAND() LIMIT 1";
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int product_id = resultSet.getInt("id");
                String name = resultSet.getString("productName");
//                double price = resultSet.getDouble("price");
                Product product = new Product();
                product.setNameProduct(name);
                product.setId(product_id);
//                product.setPrice(price);
                re.add(product);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBCUtil.closeConnection(connection);
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


    public static ArrayList<Product> getProductsByPriceRange(int minPrice, int maxPrice, int offset) {
        ArrayList<Product> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT p.product_id,p.name_product, p.price, p.quantity, p.description, pi.image_url\n" +
                "FROM Product p\n" +
                "JOIN ProductImages pi ON p.product_id = pi.product_id\n" +
                "WHERE p.price BETWEEN ? AND ? LIMIT 12 OFFSET ?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, minPrice);
            pr.setInt(2, maxPrice);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int product_id = resultSet.getInt("product_id");
                String name = resultSet.getString("name_product");
                double price = resultSet.getDouble("price");
                Product product = new Product();
                product.setNameProduct(name);
                product.setId(product_id);
//                product.setPrice(price);
                re.add(product);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static int insertProduct(Product p) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "INSERT INTO Products ( productName, quantity, description, createdAt, updatedAt, categoryId)\n" +
                "VALUES (?,?,?,NOW(),NOW(),?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            Product product = new Product();
            pr.setString(1, p.getNameProduct());
            pr.setInt(2, p.getQuantity());
            pr.setString(3, p.getDescription());
            pr.setInt(4, p.getIdCate());
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    public static int insertImageProduct(int id, String url) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into productimages(productId, imageUrl) " +
                "values(?,?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1,id);
            pr.setString(2,url);
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static int insertPriceProduct(int productId, String diameter, String height, int price) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "INSERT INTO ProductSizes (productId, diameter, height, price) " +
                "VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, productId);
            pr.setString(2, diameter);
            pr.setString(3, height);
            pr.setInt(4, price);
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;  // Trả về số lượng bản ghi bị ảnh hưởng
    }


    public static Product latestProduct() {
        Product latestProduct = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT * FROM Products ORDER BY id DESC LIMIT 1"; // Lấy sản phẩm mới nhất theo createdAt
        // Hoặc nếu bạn muốn theo id: "SELECT * FROM Products ORDER BY id DESC LIMIT 1"

        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                latestProduct = new Product();
                latestProduct.setId(rs.getInt("id"));
                latestProduct.setNameProduct(rs.getString("productName"));
                latestProduct.setQuantity(rs.getInt("quantity"));
                latestProduct.setDescription(rs.getString("description"));
                latestProduct.setCreated_at(rs.getTimestamp("createdAt"));
                latestProduct.setUpdated_at(rs.getTimestamp("updatedAt"));
                latestProduct.setIdCate(rs.getInt("categoryId"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return latestProduct;
    }

    public static void main(String[] args) {
//        p.setId(1);
//        System.out.println(listImageOfProduct(p));

//        for (Product product : listProductByIdCate(1, 0)) {
//            System.out.println(product);
//        }

        Product product = new Product();
        product.setId(1);

        ArrayList<ProductImages> images = listImageOfProduct(1);
        // Gọi phương thức listImageOfProduct
        ArrayList<SizePrice> sizePrices = listPriceOfProduct(1);
        for (SizePrice pi : sizePrices) {
//            System.out.println(pi.getUrl());
            System.out.println(pi);
        }
//        for (Product product : getProductsByPriceRange(0, 10000)) {
//            System.out.println(product);
//        }

//        LoadProductByName loadProductByName = new LoadProductByName();
//        String name = "product";
//        ArrayList<Product> listProductByName = ProductService.getInstance().listProductByName(name);
//        for (Product product : listProductByName) {
//            System.out.println(product);
//        }


    }
}
