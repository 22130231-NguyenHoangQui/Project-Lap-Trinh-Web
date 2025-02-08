package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Order;
import com.edu.hcmuaf.fit.service.InvoiceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "acceptInvoice", value = "/acceptInvoice")
public class AcceptInvoice extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        String res = "";
        if (InvoiceService.getInstance().updateStatus(id, 1) > 0) {
            res = "Đã xác nhận đơn hàng!";
        } else {
            res = "Đã xảy ra lỗi!";
        }
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        ArrayList<Order> listInvoice = null;
        try {
            listInvoice = InvoiceService.getInstance().listOrder();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        for (Order i : listInvoice) {
            JSONObject invoiceJSON = new JSONObject();
            invoiceJSON.put("id", i.getId());
            invoiceJSON.put("idAccount", i.getIdAccount());
            invoiceJSON.put("startDate", i.getCreatedAt());
            String status ="";
            if(i.getStatusOrder() == 0) {
                status = "Chờ xác nhận";
            }else if(i.getStatusOrder() == 1) {
                status ="Đã xác nhận";
            }else {
                status = "Đã hủy";
            }
            invoiceJSON.put("status", status);
            htmlDataArray.put(invoiceJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
}