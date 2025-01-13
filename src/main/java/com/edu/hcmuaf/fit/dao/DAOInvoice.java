package com.edu.hcmuaf.fit.dao;

import com.edu.hcmuaf.fit.model.Account;
import com.edu.hcmuaf.fit.model.Order;
import com.edu.hcmuaf.fit.model.OrderDetail;
import com.edu.hcmuaf.fit.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    public static int insertOrder(Order in) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String date = new java.sql.Date(System.currentTimeMillis()).toString();
        String sql = "insert into orders(accountId , address, totalInvoice, createdAt) " +
                "values(?,?,?,NOW())";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, in.getIdAccount());
            pr.setString(2, in.getAddress());
            pr.setDouble(3, in.getTotalInvoice());
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    public static Order latestOrder() {
        Order order = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT o.id, o.totalInvoice, o.createdAt, o.statusOrder, o.accountId, o.address " +
                "FROM orders AS o " +
                "ORDER BY o.id DESC " +
                "LIMIT 1";

        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double totalInvoice = resultSet.getInt("totalInvoice");
                Date createdAt = resultSet.getTimestamp("createdAt");
                String statusOrder = resultSet.getString("statusOrder");
                int accountId = resultSet.getInt("accountId");
                String address = resultSet.getString("address");

                // Khởi tạo đối tượng Order với các giá trị lấy được từ resultSet
                order = new Order(id,accountId,createdAt,  totalInvoice,statusOrder,address);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return order;
    }


    public static int insertOrderDetail(OrderDetail idt) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into invoice_details(id, IdProduct, price, quantity) " +
                "values(?,?,?,?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idt.getIdOrder());
            pr.setInt(2, idt.getIdProduct());
            pr.setDouble(3, idt.getTotalPrice());
            pr.setInt(4, idt.getQuantity());
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
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


}
