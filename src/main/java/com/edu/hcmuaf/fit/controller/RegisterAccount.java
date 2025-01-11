package com.edu.hcmuaf.fit.controller;
import com.edu.hcmuaf.fit.model.Account;
import com.edu.hcmuaf.fit.model.VerifyAccount;
import com.edu.hcmuaf.fit.service.AccountService;
import com.edu.hcmuaf.fit.util.Email;
import com.edu.hcmuaf.fit.util.Encrypt;
import com.edu.hcmuaf.fit.util.NumberRandom;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;


@WebServlet(name = "registerAccount", value = "/registerAccount")
public class RegisterAccount extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String passwordEncrypt = Encrypt.toSHA1(password);
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String birthDay = request.getParameter("birthDay");
        String address = request.getParameter("address");
        String addressReceive = request.getParameter("addressReceive");
        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        request.setAttribute("name", name);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("email", email);
        request.setAttribute("gender", gender);
        request.setAttribute("birthDay", birthDay);
        request.setAttribute("address", address);
        request.setAttribute("addressReceive", addressReceive);
        String err = "";
        if(AccountService.getInstance().checkExistUserName(userName)) {
            err = "Tên tài khoản đã tồn tại!";
            request.setAttribute("errUserName",err );
        }else if(AccountService.getInstance().checkExistEmail(email)) {
            err = "Email đã tồn tại!";
            request.setAttribute("errEmail", err);
        }else {
            Account account = new Account(name, userName, passwordEncrypt, email, phoneNumber, gender, Date.valueOf(birthDay), address, addressReceive);
            if (AccountService.getInstance().registerAccount(account) > 0) {
                Account accountAferRegis = AccountService.getInstance().selectAccountByUserName(account.getUserName());
                String verifyCodeString = NumberRandom.getSoNgauNhien();
                int verifyCode = Integer.parseInt(verifyCodeString);
                LocalDateTime timeCode = LocalDateTime.now();
                VerifyAccount verifyAccount = new VerifyAccount(accountAferRegis.getId(), verifyCode, timeCode, false);
                if (AccountService.getInstance().insertVerify(verifyAccount) > 0) {
                    Email.sendEmail(accountAferRegis.getEmail(), "Xác thực tài khoản", "Mã xác thực tài khoản IT Cake của bạn là: " + verifyCode);
                    request.setAttribute("email", accountAferRegis.getEmail());
                }
            }
        }
        try {
            String url = "";
            if(err.length() == 0) {
                url = "VerifyAccount.jsp";
            }else {
                url = "signUp.jsp";
            }
            request.getRequestDispatcher(url).forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}

