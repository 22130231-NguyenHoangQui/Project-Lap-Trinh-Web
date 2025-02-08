package com.edu.hcmuaf.fit.controller;

import java.io.*;

import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


@WebServlet(name = "PaymentBuyNow", value = "/PaymentBuyNow")
public class PaymentBuyNow extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath();
        String idProductText = request.getParameter("id");
        int idProduct = Integer.parseInt(idProductText);
        System.out.println(idProduct);
        String quantityText = request.getParameter("quantity");
        int quantity = Integer.parseInt(quantityText);

        System.out.println(quantity);
        String sizeText = request.getParameter("size");
        int size = Integer.parseInt(sizeText);
        Product p = ProductService.getInstance().getProductById(idProduct);
        double price = ProductService.getInstance().getPriceByDiameter(p.getId(),size);
        HttpSession session = request.getSession();
        session.setAttribute("quantity", quantity);
        session.setAttribute("BuyNowProduct", p);
        session.setAttribute("BuyNowQuantity", quantity);
        session.setAttribute("BuyNowPrice", price);
        response.sendRedirect(url + "/BuyNow.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}