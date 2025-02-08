package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.*;
import com.edu.hcmuaf.fit.service.AccountService;
import com.edu.hcmuaf.fit.service.CategoryService;
import com.edu.hcmuaf.fit.service.InvoiceService;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


@WebServlet(name = "manage", value = "/manageAdmin")
public class ManageController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
//        HttpSession session = request.getSession();
//        Object obj = session.getAttribute("account");
//        if (obj == null) {
//            response.sendRedirect("signIn.jsp");
//        } else {
        ArrayList<Order> listAllInvoice = null;
        try {
            listAllInvoice = InvoiceService.getInstance().listOrder();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("listAllInvoice", listAllInvoice);


        ArrayList<Category> listCategory = CategoryService.getInstance().getListCategory();
        request.setAttribute("listCategory", listCategory);
        Double getTotalForToday = InvoiceService.getInstance().getTotalRevenueForToday();

        request.setAttribute("getTotalForToday", getTotalForToday);
        int getDT = InvoiceService.getInstance().doanhThu();
        request.setAttribute("getDT", getDT);
        int productbd = InvoiceService.getInstance().productBN();
        double monthdt = InvoiceService.getInstance().totalPriceMonth();
        request.setAttribute("monthdt", monthdt);
        request.setAttribute("productbd", productbd);

        ArrayList<OrderDetail> cusMax = InvoiceService.getInstance().getListOrderDetail();
        request.setAttribute("cusMax", cusMax);

        ArrayList<Product> listAllProduct = ProductService.getInstance().listProductRandom(0);
        request.setAttribute("listAllProduct", listAllProduct);
        ArrayList<Account> listAllAccount = AccountService.getInstance().listAllAccount();
        request.setAttribute("listAllAccount", listAllAccount);

        try {
            request.getRequestDispatcher("ManageAdmin.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
//        }
    }
}
