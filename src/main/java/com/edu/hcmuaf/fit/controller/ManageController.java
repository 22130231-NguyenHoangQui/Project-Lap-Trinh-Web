package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Account;
import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.service.AccountService;
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
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("account");
//        if (obj == null) {
//            response.sendRedirect("SignIn.jsp");
//        } else {
//            ArrayList<Invoice> listAllInvoice = InvoiceService.getInstance().listInvoice();
//            request.setAttribute("listAllInvoice", listAllInvoice);
//            ArrayList<Supplier> suplist = SupplierService.getInstance().listAllSupplier();
//            request.setAttribute("listAllSup", suplist);
//            ArrayList<Category> listCategory = CategoryService.getInstance().list();
//            request.setAttribute("listCategory", listCategory);
            ArrayList<Product> listAllProduct = ProductService.getInstance().listSixProduct(0);
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
