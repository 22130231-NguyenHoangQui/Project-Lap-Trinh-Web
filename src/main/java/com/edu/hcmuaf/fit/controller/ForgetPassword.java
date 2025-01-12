package com.edu.hcmuaf.fit.controller;

import com.edu.hcmuaf.fit.model.Account;
import com.edu.hcmuaf.fit.service.AccountService;
import com.edu.hcmuaf.fit.util.Email;
import com.edu.hcmuaf.fit.util.Encrypt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.security.SecureRandom;

@WebServlet(name = "forgetPassword", value = "/forgetPassword")
public class ForgetPassword extends HttpServlet {
    final static String lowerCase = "abcdefghijklmnopqrstuvwxyz";
    final static String upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    final static String number = "0123456789";
    final static String special = "!@#$&$%*+,-./:;()<=>[]^_`{}|~";

    public static String generateRandomString() {
        SecureRandom random = new SecureRandom();
        StringBuilder randomString = new StringBuilder();
        randomString.append(lowerCase.charAt(random.nextInt(lowerCase.length())));

        // Thêm ít nhất một chữ hoa
        randomString.append(upperCase.charAt(random.nextInt(upperCase.length())));

        // Thêm ít nhất một số
        randomString.append(number.charAt(random.nextInt(number.length())));

        // Thêm ít nhất một ký tự đặt biệt
        randomString.append(special.charAt(random.nextInt(special.length())));

        // Thêm các ký tự còn lại
        int length = 6 + random.nextInt(15); // Chiều dài ngẫu nhiên từ 6 đến 20
        for (int i = 4; i < length; i++) {
            String allChars = lowerCase + upperCase + number + special;
            randomString.append(allChars.charAt(random.nextInt(allChars.length())));
        }
        return randomString.toString();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String username = request.getParameter("user_name");
        String email = request.getParameter("email");
        request.setAttribute("user_name", username);
        request.setAttribute("email", email);
        String err = "";
        String url = "";
        if(username==null){
            err = "Vui lòng nhập tên tài khoản!";
            request.setAttribute("errUserName", err);
            url = "/forgotPassword.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }
        if(email==null){
            err = "Vui lòng nhập Email!";
            request.setAttribute("errEmail", err);
            url = "/forgotPassword.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }
        if (!AccountService.getInstance().checkExistUserName(username)) {
            err = "Tên tài khoản không tồn tại!";
            request.setAttribute("errUserName", err);
            url = "/forgotPassword.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }
        else if (!AccountService.getInstance().selectAccountByUserName(username).getEmail().equals(email)) {
            err = "Email không chính xác!";
            request.setAttribute("errEmail", err);
            url = "/forgotPassword.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        } else {
            Account account = AccountService.getInstance().selectAccountByUserName(username);
            String newpassword = generateRandomString();
            String pwEncrypt = Encrypt.toSHA1(newpassword);
            if (AccountService.updatePassword(pwEncrypt, account.getId()) > 0) {
                Email.sendEmail(account.getEmail(), "Mật khẩu mới của bạn", "Thông tin đăng nhập IT Cake:"+"<br>" + "-Tên đăng nhập: " + username + "<br>" + "-Mật khẩu mới: " + newpassword);
                request.setAttribute("done","oke");
                url = "/forgotPassword.jsp";
                request.getRequestDispatcher(url).forward(request, response);
            }
        }
    }
}
