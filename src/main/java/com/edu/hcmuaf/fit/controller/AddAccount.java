package com.edu.hcmuaf.fit.controller;import java.io.*;
import java.time.LocalDateTime;
import java.util.ArrayList;

import com.edu.hcmuaf.fit.model.Account;
import com.edu.hcmuaf.fit.model.VerifyAccount;
import com.edu.hcmuaf.fit.service.AccountService;
import com.edu.hcmuaf.fit.util.Email;
import com.edu.hcmuaf.fit.util.Encrypt;
import com.edu.hcmuaf.fit.util.NumberRandom;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "AddAccount", value = "/AddAccount")
public class AddAccount extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String passwordEncrypt = Encrypt.toSHA1(password);
        String rePassword = request.getParameter("rePw");
        String email = request.getParameter("email");
        String res = "";
        String errUser ="";
        String errEmail ="";
        if (AccountService.getInstance().checkExistUserName(userName)) {
            errUser = "Tên tài khoản đã tồn tại!";
        } else if (AccountService.getInstance().checkExistEmail(email)) {
            errEmail = "Email đã tồn tại!";
        } else {
            Account account = new Account(userName, passwordEncrypt, email);
            if (AccountService.getInstance().registerAccount(account) > 0) {
                Account accountAferRegis = AccountService.getInstance().selectAccountByUserName(account.getUserName());
                String verifyCodeString = NumberRandom.getSoNgauNhien();
                int verifyCode = Integer.parseInt(verifyCodeString);
                LocalDateTime timeCode = LocalDateTime.now();
                VerifyAccount verifyAccount = new VerifyAccount(accountAferRegis.getId(), verifyCode, timeCode, false);
                if (AccountService.getInstance().insertVerify(verifyAccount) > 0) {
                    Email.sendEmail(accountAferRegis.getEmail(), "Xác thực tài khoản", "Mã xác thực tài khoản HomeDecor của bạn là: " + verifyCode);
                    request.setAttribute("email", accountAferRegis.getEmail());
                }
                res = "Thêm tài khoản thành công!";
            }else {
                res = "Thêm tài khoản thất bại!";
            }
        }
        ArrayList<Account> listAccount = AccountService.getInstance().listAllAccount();
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        for (Account a : listAccount) {
            JSONObject accountJSON = new JSONObject();
            accountJSON.put("id", a.getId());
            accountJSON.put("name", a.getName());
            accountJSON.put("email", a.getEmail());
            String per2 = "Khách hàng";
            if(a.getRole() == 0) {
                per2 = "Admin";
            }
            accountJSON.put("role", per2);
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
        jsonResponse.put("user", userName);
        jsonResponse.put("email", email);
        jsonResponse.put("errUser", errUser);
        jsonResponse.put("errEmail", errEmail);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
}
