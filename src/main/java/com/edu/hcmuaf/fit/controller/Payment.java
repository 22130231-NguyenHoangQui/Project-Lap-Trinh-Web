package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Iterator;

import com.edu.hcmuaf.fit.model.Account;
import com.edu.hcmuaf.fit.model.Cart;
import com.edu.hcmuaf.fit.model.Order;
import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.InvoiceService;
import com.edu.hcmuaf.fit.service.ProductService;
import com.edu.hcmuaf.fit.util.Email;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "Payment", value = "/Payment")
public class Payment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("Cart");
        Iterator<Product> it = cart.list().iterator();
        double sum=(double) session.getAttribute("Sum");
        String name = a.getName();
        String phone=a.getPhoneNumber();
        String email=a.getEmail();
        String address=a.getAddressReceive();
        String startContent="Thông tin khách hàng: "+"<br>"+"Họ và tên: "+name+"<br>"+"Số điện thoại: "+phone+"<br>"+"Email: "+email+"<br>"+"Địa chỉ nhận hàng: "+address+"<br>";
        String content="Các sản phẩm đã đặt hàng:"+"<br>";
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String endContent="Tổng tiền: "+nF.format(sum);
        Product p;
        Order invoice = new Order(0,a.getId(),address,0,"Thanh toán khi nhận hàng",new Date(2024,01,15),0);
        if(InvoiceService.getInstance().insertOrder(invoice)>0) {
            Order lastest = InvoiceService.getInstance().latestInvoice();
            while (it.hasNext()) {
                p = it.next();
                OrderDetail idt = new OrderDetail(lastest.getIdInvoice(), p.getId(), p.getPrice(), p.getQuantity());
                InvoiceService.getInstance().insertInvoiceDetail(idt);
                ProductService.getInstance().decreaseQuantity(p, p.getQuantity());
                content += "-Sản phẩm: " + p.getNameProduct() +" Giá: "+nF.format(p.getPrice())+ " Số lượng: " + p.getQuantity() + "<br>";
            }
            session.setAttribute("donePayment","done");
            session.setAttribute("Cart", null);
            Email.sendEmail(a.getEmail(), "Xác nhận đơn hàng từ ITCAKE", startContent + "<br>" + content + endContent);
            response.sendRedirect(url + "/Payment.jsp");
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}