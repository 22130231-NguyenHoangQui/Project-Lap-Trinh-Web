package com.edu.hcmuaf.fit.controller;

import java.io.*;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Account;
import com.edu.hcmuaf.fit.service.AccountService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "updateStatusAccount", value = "/updateStatusAccount")
public class UpdateStatusAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        String res = "";
        Account a1 = AccountService.getInstance().selectById(id);
        if(AccountService.getInstance().updateStatus(id, !a1.isStatus()) > 0) {
            Account a2 = AccountService.getInstance().selectById(id);
            res = (a2.isStatus()) ? "Mở khóa tài khoản thành công!" : "Khóa tài khoản thành công!";
        }else {
            res = "Đã xảy ra lỗi!";
        }
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        ArrayList<Account> listAccount = AccountService.getInstance().listAllAccount();
        for (Account a : listAccount) {
            JSONObject accountJSON = new JSONObject();
            accountJSON.put("id", a.getId());
            accountJSON.put("name", a.getName());
            accountJSON.put("email", a.getEmail());
            String role = "Khách hàng";
            if(a.getRole() == 0) {
                role = "Admin";
            }
            accountJSON.put("role", role);
            String vrf = "Chưa xác thực";
            if (a.getVerifyAccount().isStateVerify()) {
                vrf = "Đã xác thực";
            }
            accountJSON.put("vrf", vrf);
            String status = "Đã khóa";
            if (a.isStatus()) {
                status = "Hoạt động";
            }
            accountJSON.put("status", status);
            htmlDataArray.put(accountJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
}
