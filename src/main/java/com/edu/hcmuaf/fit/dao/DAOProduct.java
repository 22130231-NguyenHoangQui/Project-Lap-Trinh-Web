package com.edu.hcmuaf.fit.dao;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.model.ProductImages;
import com.edu.hcmuaf.fit.model.SizePrice;
import com.edu.hcmuaf.fit.util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
            String sql = "SELECT \n" +
                    "    pro.id AS product_id,\n" +
                    "    pro.productName,\n" +
                    "    pi.imageUrl,\n" +
                    "    SUM(orr.quantity * ps.price) AS total_revenue\n" +
                    "FROM \n" +
                    "    OrderDetails orr\n" +
                    "JOIN \n" +
                    "    products pro ON orr.productId = pro.id\n" +
                    "JOIN \n" +
                    "    productsizes ps ON ps.productId = pro.id\n" +
                    "JOIN \n" +
                    "    productimages pi ON pro.id = pi.productId\n" +
                    "GROUP BY \n" +
                    "    pro.id, pro.productName, pi.imageUrl\n" +
                    "ORDER BY \n" +
                    "    total_revenue DESC\n" +
                    "LIMIT 10 OFFSET ?;\n";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, offset);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String nameProduct = rs.getString("productName");
//                String imageUrl = rs.getString("image_url");
//                int total_revenue = rs.getInt("total_revenue");
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
            String sql = "SELECT p.id AS product_id, p.productName AS name_product, " +
                    "SUM(od.quantity) AS total_quantity " +
                    "FROM products p " +
                    "JOIN orderdetails od ON p.id = od.productId " +
                    "JOIN orders o ON od.orderId = o.id " +
                    "WHERE o.createdAt BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE() " +
                    "GROUP BY p.id, p.productName " +
                    "ORDER BY total_quantity DESC " +
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
            String sql = "Select id, imageUrl, productId from productimages  where productId = ?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, p.getId());
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
                String urlImage = resultSet.getString("imageUrl");
                int idProduct = resultSet.getInt("productId");

                ProductImages img = new ProductImages(urlImage, idProduct);

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

                SizePrice sp = new SizePrice(id, idProduct, diameter, height, price);
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
            // Sửa lại câu SQL phù hợp với cấu trúc bảng mới
            String sql = "SELECT p.id, p.productName, p.quantity, p.description, p.createdAt, p.updatedAt " +
                    "FROM products AS p " +
                    "JOIN categories AS ca ON p.categoryId = ca.id " +
                    "WHERE ca.id = ? " +
                    "LIMIT 6 OFFSET ?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, id); // Truyền vào categoryId
            pr.setInt(2, offset); // Truyền vào offset để phân trang
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int product_id = resultSet.getInt("id"); // Lấy id sản phẩm
                String productName = resultSet.getString("productName"); // Lấy tên sản phẩm
                int quantity = resultSet.getInt("quantity"); // Lấy số lượng
                String description = resultSet.getString("description"); // Lấy mô tả
                // Các trường khác như createdAt và updatedAt nếu cần cũng có thể lấy thêm

                Product product = new Product();
                product.setId(product_id); // Set id sản phẩm
                product.setNameProduct(productName); // Set tên sản phẩm
                product.setQuantity(quantity); // Set số lượng
                product.setDescription(description); // Set mô tả

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
            String sql = "SELECT * FROM Products  ORDER BY RAND() LIMIT 12";
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
        StringBuilder sqlbuilder = new StringBuilder("SELECT p.id, p.productName, p.quantity, p.description\n" +
                "FROM Products p\n" +
                "WHERE");
        for (int i = 0; i < tuKhoa.length; i++) {
            sqlbuilder.append(" p.productName COLLATE utf8mb4_general_ci LIKE ?");
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
                int product_id = resultSet.getInt("id");
                String name = resultSet.getString("productName");
//                int price = resultSet.getInt("price");
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
            pr.setInt(1, id);
            pr.setString(2, url);
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

    public static ArrayList<ProductImages> getImagesByProductId(int productId) {
        ArrayList<ProductImages> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT * FROM ProductImages WHERE id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, productId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                //                int id = resultSet.getInt("id");
                String urlImage = rs.getString("imageUrl");
                int idProduct = rs.getInt("productId");

                ProductImages img = new ProductImages(urlImage, idProduct);

                re.add(img);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    public static synchronized int updateProduct(Product p) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement s = connection.prepareStatement("select id from products where id =?");
            s.setInt(1, p.getId());
            ResultSet resultSet = s.executeQuery();
            if (resultSet.next()) {
                s = connection.prepareStatement("UPDATE products SET " +
                        "productName = ?, " +
                        "quantity = ?, " +
                        "description = ?, " +
                        "updatedAt = NOW() " +
                        "WHERE id = ?");
                s.setString(1, p.getNameProduct());
                s.setInt(2, p.getQuantity());
                s.setString(3, p.getDescription());
                s.setInt(4, p.getId());
                re = s.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBCUtil.closeConnection(connection);
        return re;
    }

    public static int delImgOfProduct(int id, String urlImage) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        Statement s = connection.createStatement();
        synchronized (s) {
            try {
                ResultSet resultSet = s.executeQuery("select id from productimages where id=" + id);
                if (resultSet.next()) {
                    re = s.executeUpdate("DELETE FROM productimages WHERE imageUrl = '" + urlImage + "'");

                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            JDBCUtil.closeConnection(connection);
        }
        return re;
    }

    public static ArrayList<SizePrice> getPriceByIdP(int id) {
        ArrayList<SizePrice> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT * FROM ProductSizes WHERE productId =  ?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, id);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                double price = rs.getDouble("price");
                String diameter = rs.getString("diameter");
                String height = rs.getString("height");
                int idProduct = rs.getInt("productId");
                SizePrice sizePrice = new SizePrice();
                sizePrice.setIdProduct(idProduct);
                sizePrice.setDiameter(diameter);
                sizePrice.setHeight(height);
                sizePrice.setPrice(price);
                re.add(sizePrice);
            }
            JDBCUtil.closeConnection(connection);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    public static int insertSizePrice(SizePrice sizePrice) {
        String sql = "INSERT INTO productsizes (diameter, height, price, productId) VALUES (?, ?, ?, ?)";
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, sizePrice.getDiameter());
            stmt.setString(2, sizePrice.getHeight());
            stmt.setDouble(3, sizePrice.getPrice());
            stmt.setInt(4, sizePrice.getIdProduct());
            return stmt.executeUpdate(); // Trả về số hàng bị ảnh hưởng
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu xảy ra lỗi
    }

    public static int updateSizePrice(SizePrice sizePrice) {
        String sql = "UPDATE productsizes SET price = ? WHERE diameter = ? AND height = ? AND productId = ?";
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDouble(1, sizePrice.getPrice());
            stmt.setString(2, sizePrice.getDiameter());
            stmt.setString(3, sizePrice.getHeight());
            stmt.setInt(4, sizePrice.getIdProduct());
            return stmt.executeUpdate(); // Trả về số hàng bị ảnh hưởng
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu xảy ra lỗi
    }

    public static int deleteSizePrice(SizePrice sizePrice) {
        String sql = "DELETE FROM productsizes WHERE diameter = ? AND height = ? AND productId = ?";
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, sizePrice.getDiameter());
            stmt.setString(2, sizePrice.getHeight());
            stmt.setInt(3, sizePrice.getIdProduct());
            return stmt.executeUpdate(); // Trả về số hàng bị ảnh hưởng
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu xảy ra lỗi
    }

    public static Product getProductById(int id) {
        Product re = null;
        String sql = "SELECT id,productName,quantity,description,categoryId FROM products WHERE id= ?";
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet resultSet = stmt.executeQuery();
            while (resultSet.next()) {
                int idProduct = resultSet.getInt("id");
                String name = resultSet.getString("productName");
                String description = resultSet.getString("description");
                int quantity = resultSet.getInt("quantity");
//                boolean status = resultSet.getBoolean("status");
                re = new Product(idProduct, name, quantity, description);
            }
            JDBCUtil.closeConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return re;
    }

    public static void main(String[] args) {
        Product p = getProductById(1);
        System.out.println(p);
    }

    public static int delProduct(int id) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement  s = connection.prepareStatement("select id from products where id =?");
            s.setInt(1, id);
            ResultSet resultSet = s.executeQuery();
            if (resultSet.next()) {
                s = connection.prepareStatement("delete from productimages where productId =?");
                s.setInt(1, id);
                s.executeUpdate();
                s = connection.prepareStatement("delete from productsizes where productId =?");
                s.setInt(1, id);
                s.executeUpdate();
                s = connection.prepareStatement("delete from products where id =?");
                s.setInt(1, id);
                re = s.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBCUtil.closeConnection(connection);
        return re;
    }


    public static String getCategoriesByProductId(int productId) {
        return null;
    }
    
}
