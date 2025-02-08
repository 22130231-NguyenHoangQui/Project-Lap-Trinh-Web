package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;

import com.edu.hcmuaf.fit.model.*;
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
        double sum = (double) session.getAttribute("Sum"); // Tổng tiền từ giỏ hàng
        int diameter = (int) session.getAttribute("diameter");
        String name = a.getName();
        String phone = a.getPhoneNumber();
        String email = a.getEmail();
        String address = a.getAddressReceive();

        // Thông tin khách hàng
        String startContent = "Thông tin khách hàng: " + "<br>" + "Họ và tên: " + name + "<br>" + "Số điện thoại: " + phone
                + "<br>" + "Email: " + email + "<br>" + "Địa chỉ nhận hàng: " + address + "<br>";

        String content = "Các sản phẩm đã đặt hàng:" + "<br>";
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String endContent = "Tổng tiền: " + nF.format(sum);

        Product p;
        Order invoice = new Order(0, a.getId(), Calendar.getInstance().getTime(), sum, 1, address);

        if (InvoiceService.getInstance().insertOrder(invoice) > 0) {
            Order latest = InvoiceService.getInstance().latestInvoice();

            // Duyệt qua tất cả sản phẩm trong giỏ hàng
            while (it.hasNext()) {
                p = it.next();
                // Giả sử bạn có một giá trị diameter cụ thể cần tìm, ví dụ:
                int desiredDiameter = diameter; // Hoặc giá trị bạn nhận từ người dùng

                // Lấy giá theo kích thước sản phẩm
                double productPrice = ProductService.getInstance().getPriceByDiameter(p.getId(),desiredDiameter );

                // Tính tổng giá cho từng sản phẩm (giá x số lượng)
                double totalProductPrice = productPrice * p.getQuantity();

                // Tạo OrderDetail cho từng sản phẩm
                OrderDetail idt = new OrderDetail(latest.getId(), p.getId(), totalProductPrice, p.getQuantity());

                // Lưu thông tin OrderDetail vào cơ sở dữ liệu
                InvoiceService.getInstance().insertInvoiceDetail(idt);

                // Cập nhật số lượng sản phẩm
                ProductService.getInstance().decreaseQuantity(p, p.getQuantity());

                // Thêm thông tin sản phẩm vào nội dung email
                content += "- Sản phẩm: " + p.getNameProduct() + " Giá: " + nF.format(productPrice) + " Số lượng: "
                        + p.getQuantity() + " Tổng giá: " + nF.format(totalProductPrice) + "<br>";
            }

            // Gửi email xác nhận
            session.setAttribute("donePayment", "done");
            session.setAttribute("Cart", null);
            Email.sendEmail(a.getEmail(), "Xác nhận đơn hàng từ ITCAKE", startContent + "<br>" + content + endContent);

            // Chuyển hướng người dùng sau khi thanh toán
            response.sendRedirect(url + "/Payment.jsp");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
