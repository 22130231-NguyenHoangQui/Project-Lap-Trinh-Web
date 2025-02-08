package com.edu.hcmuaf.fit.dao;

import com.edu.hcmuaf.fit.model.Account;
import com.edu.hcmuaf.fit.model.Order;
import com.edu.hcmuaf.fit.model.OrderDetail;
import com.edu.hcmuaf.fit.util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class DAOInvoice {
    public static int soLuongBan() {

        int total = 0;
        Connection conn = JDBCUtil.getConnection();
        try {
            String sql = "SELECT SUM(od.quantity)\n" +
                    "FROM orderdetails  od \n" +
                    "JOIN products p ON od.orderId = p.id\n" +
                    "JOIN orders o ON od.orderId = o.id\n" +
                    "WHERE DATE(o.createdAt) = CURDATE()";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                total = rs.getInt(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return total;

    }
    public static double tongDoanhThu() {
        double total = 0;
        Connection conn = JDBCUtil.getConnection();
        try {
            String sql = "SELECT SUM(totalInvoice) AS doanh_thu_trong_thang\n" +
                    "FROM orders\n" +
                    "WHERE \tYEAR(createdAt)=YEAR(CURDATE())AND MONTH(createdAt) = MONTH(CURDATE());";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                total = rs.getDouble(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return total;
    }
    public static int doanhThuToday() {
        int total = 0;
        Connection conn = JDBCUtil.getConnection();
        try {
            String sql = "SELECT COUNT(id) \n" +
                    "FROM orders\n" +
                    "WHERE DATE(createdAt) = CURDATE();";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                total = rs.getInt(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return total;
    }

    public static double getTotalRevenueForToday() {
        double total = 0;
        Connection conn = JDBCUtil.getConnection();
        try {
            String sql = "SELECT SUM(totalInvoice) \n" +
                    "from orders\n" +
                    "WHERE date(createdAt)= CURDATE()";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                total = rs.getDouble(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return total;
    }
      public static Order latestOrder() {
        Order order = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT id, totalInvoice, createdAt, statusOrder, accountId " +
                "FROM orders " +
                "ORDER BY id DESC " +
                "LIMIT 1";

        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                double totalInvoice = resultSet.getDouble("totalInvoice");
                Date createdAt = resultSet.getTimestamp("createdAt");
                int statusOrder = resultSet.getInt("statusOrder");
                int accountId = resultSet.getInt("accountId");

                order = new Order(id, accountId, createdAt, totalInvoice, statusOrder, null);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return order;
    }




    public static ArrayList<OrderDetail> getOrderDetailsWithAccounts() {
        ArrayList<OrderDetail> orderDetails = new ArrayList<>();

        String sql = """
            SELECT u.id, u.userName, u.email, u.phoneNumber, SUM(od.quantity) AS total_quantity
            FROM accounts u
            JOIN Orders o ON u.id = o.accountId
            JOIN OrderDetails od ON o.id = od.orderId
            GROUP BY u.id, u.userName, u.email, u.phoneNumber
            ORDER BY total_quantity DESC
            LIMIT 20;
        """;

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                // Tạo đối tượng Account
                Account account = new Account(
                        resultSet.getInt("id"),
                        resultSet.getString("userName"),
                        resultSet.getString("email"),
                        resultSet.getString("phoneNumber")
                );

                // Tạo đối tượng OrderDetail
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setQuantity(resultSet.getInt("total_quantity"));
                orderDetail.setAccount(account);

                // Thêm vào danh sách
                orderDetails.add(orderDetail);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderDetails;
    }

    public static void main(String[] args) {
       ;
        System.out.println( getOrderDetailsWithAccounts());
    }

    public static ArrayList<Order> listAllOrder() throws SQLException {
        ArrayList<Order> orders = new ArrayList<>();
        String sql = "SELECT o.id, o.totalInvoice, o.createdAt, o.statusOrder, o.accountId, "
                + "od.productId, od.totalPrice, od.quantity "
                + "FROM orders o "
                + "LEFT JOIN orderdetails od ON o.id = od.orderId";

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            // Map dữ liệu từ ResultSet vào danh sách Order
            while (resultSet.next()) {
                int orderId = resultSet.getInt("id");
                Order order = findOrderById(orders, orderId);

                if (order == null) {
                    // Tạo đối tượng Order mới nếu chưa có trong danh sách
                    order = new Order();
                    order.setId(orderId);
                    order.setTotalInvoice(resultSet.getInt("totalInvoice"));
                    order.setCreatedAt(resultSet.getTimestamp("createdAt"));
                    order.setStatusOrder(resultSet.getInt("statusOrder"));
                    order.setIdAccount(resultSet.getInt("accountId"));
//                    order.setOrderDetails(new ArrayList<>());
                    orders.add(order);
                }

                // Nếu có chi tiết đơn hàng, thêm vào danh sách OrderDetail
                int productId = resultSet.getInt("productId");
                if (!resultSet.wasNull()) {  // Kiểm tra nếu có dữ liệu chi tiết đơn hàng
                    OrderDetail detail = new OrderDetail();
                    detail.setIdProduct(productId);
                    detail.setTotalPrice(resultSet.getInt("totalPrice"));
                    detail.setQuantity(resultSet.getInt("quantity"));
//                    order.getOrderDetails().add(detail);
                }
            }
        }
        return orders;
    }
    private static Order findOrderById(ArrayList<Order> orders, int orderId) {
        for (Order order : orders) {
            if (order.getId() == orderId) {
                return order;
            }
        }
        return null;
    }
//    public static Order selectById(int idInvoice) {
//        Order invoice = null;
//        Connection connection = JDBCUtil.getConnection();
//        String sql = "select id, totaLInvoice, createdAt,statusOrder,accountId from orders";
//        try {
//            PreparedStatement pr = connection.prepareStatement(sql);
//            ResultSet resultSet = pr.executeQuery();
//            while(resultSet.next()) {
//                int id = resultSet.getInt("id");
//                int idAccount = resultSet.getInt("idAccount");
////                String address = resultSet.getString("address");
//                Date startDate = resultSet.getDate("startDate");
//                int status = resultSet.getInt("status");
//                invoice = new Order(id, idAccount, startDate, status);
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return invoice;
//    }
    public static synchronized int delOrder(int orderId) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement pr = connection.prepareStatement("UPDATE orders SET statusOrder = ? WHERE id = ?");
            pr.setString(1, "Cancelled"); // Example: Mark the order as cancelled
            pr.setInt(2, orderId);
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    public static synchronized int updateOrderStatus(int orderId, String status) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement pr = connection.prepareStatement("UPDATE orders SET statusOrder = ? WHERE id = ?");
            pr.setString(1, status);
            pr.setInt(2, orderId);
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

//    public static ArrayList<Order> getOrdersByStatus(String status) {
//        ArrayList<Order> list = new ArrayList<>();
//        Connection connection = JDBCUtil.getConnection();
//        String sql = "SELECT id, totalInvoice, createdAt, statusOrder, accountId FROM orders WHERE statusOrder = ?";
//        try {
//            PreparedStatement pr = connection.prepareStatement(sql);
//            pr.setString(1, status);
//            ResultSet resultSet = pr.executeQuery();
//            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
//                int totalInvoice = resultSet.getInt("totalInvoice");
//                Date createdAt = resultSet.getTimestamp("createdAt");
//                String statusOrder = resultSet.getString("statusOrder");
//                int accountId = resultSet.getInt("accountId");
//                Order order = new Order(id, totalInvoice, createdAt, statusOrder, accountId);
//                list.add(order);
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return list;
//    }



    public static ArrayList<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT orderId, productId, totalPrice, quantity FROM orderdetails WHERE orderId = ?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, orderId);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int productId = resultSet.getInt("productId");
                int totalPrice = resultSet.getInt("totalPrice");
                int quantity = resultSet.getInt("quantity");
                OrderDetail orderDetail = new OrderDetail(orderId, productId, totalPrice, quantity);
                list.add(orderDetail);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static int insertOrder(Order order) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "INSERT INTO orders (totalInvoice, statusOrder, accountId) VALUES (?, ?, ?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pr.setDouble(1, order.getTotalInvoice());
            pr.setInt(2, order.getStatusOrder());
            pr.setInt(3, order.getIdAccount());
            re = pr.executeUpdate();
            if (re > 0) {
                ResultSet generatedKeys = pr.getGeneratedKeys();
                if (generatedKeys.next()) {
                    order.setId(generatedKeys.getInt(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static int insertOrderDetail(OrderDetail orderDetail) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "INSERT INTO orderdetails (orderId, productId, totalPrice, quantity) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, orderDetail.getIdOrder());
            pr.setInt(2, orderDetail.getIdProduct());
            pr.setDouble(3, orderDetail.getTotalPrice());
            pr.setInt(4, orderDetail.getQuantity());
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }


    public static synchronized int updateStatus(int idInvoice, int status) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement pr = connection.prepareStatement( "select id, totalInvoice, createdAt,statusOrder,accountId from orders where id =?");
            pr.setInt(1, idInvoice);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                pr = connection.prepareStatement("update statusOrder set status =? where id =?");
                pr.setInt(1, status);
                pr.setInt(2, idInvoice);
                re = pr.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
}

