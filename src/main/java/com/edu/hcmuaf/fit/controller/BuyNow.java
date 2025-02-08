package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.text.NumberFormat;
import java.util.Date;

import com.edu.hcmuaf.fit.model.Account;
import com.edu.hcmuaf.fit.model.Order;
import com.edu.hcmuaf.fit.model.OrderDetail;
import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.InvoiceService;
import com.edu.hcmuaf.fit.service.ProductService;
import com.edu.hcmuaf.fit.util.Email;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "BuyNow", value = "/BuyNow")
public class BuyNow extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        Product p = (Product) session.getAttribute("BuyNowProduct");
        int quantity = (Integer) session.getAttribute("BuyNowQuantity");
        int diameter = session.getAttribute("diameter") != null
                ? (int) session.getAttribute("diameter")
                : 20; // Giá trị mặc định là 0

        double sum=(double) session.getAttribute("Sum");
        String name = a.getName();
        String phone=a.getPhoneNumber();
        String email=a.getEmail();
        String address=a.getAddressReceive();
        String startContent="Thông tin khách hàng: "+"<br>"+"Họ và tên: "+name+"<br>"+"Số điện thoại: "+phone+"<br>"+"Email: "+email+"<br>"+"Địa chỉ nhận hàng: "+address+"<br>";
        String content="Các sản phẩm đã đặt hàng:"+"<br>";
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String endContent="Tổng tiền: "+nF.format(sum);
        Order invoice = new Order(0,a.getId(),address,0,0,new Date(2023,12,27));
        if(InvoiceService.getInstance().insertInvoice(invoice)>0) {
            int desiredDiameter = diameter; // Hoặc giá trị bạn nhận từ người dùng
            // Lấy giá theo kích thước sản phẩm
            double productPrice = ProductService.getInstance().getPriceByDiameter(p.getId(),desiredDiameter );

            // Tính tổng giá cho từng sản phẩm (giá x số lượng)
            double totalProductPrice = productPrice * p.getQuantity();

            Order lastest = InvoiceService.getInstance().latestInvoice();
            OrderDetail idt = new OrderDetail(lastest.getId(), p.getId(), productPrice, quantity);
            InvoiceService.getInstance().insertInvoiceDetail(idt);
            ProductService.getInstance().decreaseQuantity(p,quantity);
            content = "-Sản phẩm: " + p.getNameProduct() +" Giá: "+nF.format(totalProductPrice)+ " Số lượng: " + quantity + "<br>";
        }
        session.setAttribute("BuyNowProduct", null);
        session.setAttribute("BuyNowQuantity", null);
        session.setAttribute("doneBuyNow","done");
        Email.sendEmail(a.getEmail(), "Xác nhận đơn hàng từ HomeDecor", startContent + "<br>" + content + endContent);
        response.sendRedirect(url + "/BuyNow.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}