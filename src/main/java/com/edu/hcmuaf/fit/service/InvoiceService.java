package com.edu.hcmuaf.fit.service;

import com.edu.hcmuaf.fit.dao.DAOInvoice;

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
}
