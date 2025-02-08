package com.edu.hcmuaf.fit.service;

import com.edu.hcmuaf.fit.dao.DAOInvoice;
import com.edu.hcmuaf.fit.model.Order;
import com.edu.hcmuaf.fit.model.OrderDetail;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;

import java.sql.SQLException;
import java.util.ArrayList;

public class InvoiceService {
    static InvoiceService instance;
    private InvoiceService() {

    }
    public static InvoiceService getInstance() {
        if (instance == null) {
            instance = new InvoiceService();

        }
        return instance;
    }
    public static double getTotalRevenueForToday() {
            double res = DAOInvoice.getTotalRevenueForToday();
            return res;
    }

    public static void main(String[] args) {
        System.out.println(getTotalRevenueForToday());
    }

    public int insertOrder(Order invoice) {
        return DAOInvoice.insertOrder(invoice);
    }

    public Order latestInvoice() {
        return DAOInvoice.latestOrder();
    }

    public int insertInvoiceDetail(OrderDetail idt) {
        return DAOInvoice.insertOrderDetail(idt);
    }

    public  int doanhThu() {
        return DAOInvoice.doanhThuToday();
    }
    public int productBN() {
        return DAOInvoice.soLuongBan();
    }
    public double totalPriceMonth() {
        return DAOInvoice.tongDoanhThu();
    }
    public ArrayList<OrderDetail> getListOrderDetail() {
        return DAOInvoice.getOrderDetailsWithAccounts();
    }

    public ArrayList<Order> listOrder() throws SQLException {
        return DAOInvoice.listAllOrder();
    }

    public int insertInvoice(Order invoice) {
        return DAOInvoice.insertOrder(invoice);
    }

    public int updateStatus(int id, int i) {
        return DAOInvoice.updateStatus(id, i);
    }

//    public Order selectById(int id) {
//        return DAOInvoice.selectById(id);
//    }
}
