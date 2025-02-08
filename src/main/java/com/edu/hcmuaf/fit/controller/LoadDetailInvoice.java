//package com.edu.hcmuaf.fit.controller;
//
//import com.edu.hcmuaf.fit.model.Account;
//import com.edu.hcmuaf.fit.model.Order;
//import com.edu.hcmuaf.fit.model.OrderDetail;
//import com.edu.hcmuaf.fit.model.Product;
//import com.edu.hcmuaf.fit.service.AccountService;
//import com.edu.hcmuaf.fit.service.InvoiceService;
//import com.edu.hcmuaf.fit.service.ProductService;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import org.json.JSONArray;
//import org.json.JSONObject;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.text.NumberFormat;
//import java.util.ArrayList;
//
//@WebServlet(name = "loadDetailInvoice", value = "/loadDetailInvoice")
//public class LoadDetailInvoice extends HttpServlet {
//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("application/json");
//        String idText = request.getParameter("id");
//        int id = Integer.parseInt(idText);
////        Order i = InvoiceService.getInstance().selectById(id);
////        Account a = AccountService.getInstance().selectById(i.getIdAccount());
////        ArrayList<Product> listP = new ArrayList<>();
////        double total = 0;
////        for (OrderDetail detail : i.getDetails()) {
////            Product p = ProductService.getInstance().getProductById(detail.getIdProduct());
////            p.setQuantity(detail.getQuantity());
////            listP.add(p);
////            total += detail.getTotalPrice();
////        }
////        JSONObject jsonRes = new JSONObject();
////        JSONObject invoiceJSON = new JSONObject();
////        JSONArray htmlDataArray = new JSONArray();
////        invoiceJSON.put("idInvoice", i.getId());
////        invoiceJSON.put("address", i.getAddress());
////        invoiceJSON.put("name", a.getName());
////        invoiceJSON.put("phoneNumber", a.getPhoneNumber());
////        invoiceJSON.put("totalInvoice", total);
//
//        NumberFormat nF = NumberFormat.getCurrencyInstance();
//        double totalPrice = 0;
//        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
//        for(Product p: listP) {
//            JSONObject productJSON = new JSONObject();
//            productJSON.put("idProduct", p.getId());
//            productJSON.put("idCate", p.getIdCate());
//            productJSON.put("nameProduct", p.getNameProduct());
//            productJSON.put("price", nF.format(totalPrice));
//            productJSON.put("quantity", p.getQuantity());
//            String urlImage = (p.getProductImages().isEmpty())?"":p.getProductImages().get(0).getUrl();
//            productJSON.put("image", url +"/Products/" +urlImage);
//            productJSON.put("totalPrice", nF.format(totalPrice*p.getQuantity()));
//            htmlDataArray.put(productJSON);
//            totalPrice += totalPrice*p.getQuantity();
//        }
//        jsonRes.put("htmlData", htmlDataArray);
//        jsonRes.put("invoice", invoiceJSON);
//        jsonRes.put("total",nF.format(totalPrice));
//        PrintWriter out = response.getWriter();
//        response.getWriter().write(jsonRes.toString());
//    }
//}
//
