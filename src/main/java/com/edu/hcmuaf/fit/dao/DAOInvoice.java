package com.edu.hcmuaf.fit.dao;

import com.edu.hcmuaf.fit.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAOInvoice {
    public static double getTotalRevenueForToday() {
        double total = 0;
        Connection conn = JDBCUtil.getConnection();
        try {
            String sql = "SELECT SUM(total_invoice) \n" +
                    "from orders\n" +
                    "WHERE date(created_at)= CURDATE()";
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
}
