package com.edu.hcmuaf.fit.controller;

import java.io.*;

import com.edu.hcmuaf.fit.model.Account;
import com.edu.hcmuaf.fit.service.AccountService;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

@WebServlet(name = "loadDetailAccount", value = "/loadDetailAccount")
public class LoadDetailAccount extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);

        Account a = AccountService.getInstance().selectById(id);
        JSONObject jsonRes = new JSONObject();
        JSONObject accountJSON = new JSONObject();
        accountJSON.put("id", a.getId());
        accountJSON.put("name", a.getName());
        accountJSON.put("phoneNumber", a.getPhoneNumber());
        accountJSON.put("email", a.getEmail());
        accountJSON.put("password", a.getPassword());
        accountJSON.put("gender", a.getGender());
        accountJSON.put("birthDay", a.getBirthDay());
        accountJSON.put("address", a.getAddress());
        accountJSON.put("addressRecei", a.getAddressReceive());
        String checkStaff = "Khách hàng";
        if(a.getRole() == 0) {
            checkStaff = "Admin";
        }
        accountJSON.put("checkStaff", checkStaff);
        jsonRes.put("account", accountJSON);
        PrintWriter out = response.getWriter();
        response.getWriter().write(jsonRes.toString());
    }

    public void destroy() {
    }
}