package com.edu.hcmuaf.fit.controller;

import com.edu.hcmuaf.fit.model.Cart;
import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

    @WebServlet(name = "cartController", value = "/cartController")
    public class CartController extends HttpServlet {
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("html/text; charset= UTF-8");
            HttpSession session = request.getSession();
            String idProductText = request.getParameter("id");
            int idProduct = Integer.parseInt(idProductText);
            String quantityText = request.getParameter("quantity");
            int quantity = Integer.parseInt(quantityText);
            String size = request.getParameter("size");
            int sizeInt = Integer.parseInt(size);
            Cart c = (Cart) session.getAttribute("Cart");
            if(c == null) c= new Cart();
            if (c.get(idProduct) != null) {
                int quantityAvailable = c.get(idProduct).getQuantity();
                if(quantity <= quantityAvailable) {
                    c.put(idProduct, quantity);
                }else {
                    request.setAttribute("errQuantity","Trong kho chỉ còn lại " + quantityAvailable + " sản phẩm '" +c.get(idProduct).getNameProduct() +"'");
                }
            }else{
                Product p = ProductService.getInstance().getProductById(idProduct);
                double priceOfId = ProductService.getInstance().getPriceByDiameter(idProduct,sizeInt);
                request.setAttribute("priceOfId",priceOfId);
                if (p != null) c.put(p);
            }
            session.setAttribute("Cart", c);
            try {
                request.getRequestDispatcher("Cart.jsp").forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }

        public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // TODO Auto-generated method stub
            doGet(request, response);
        }
    }
