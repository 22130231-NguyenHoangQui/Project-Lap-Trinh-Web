package com.edu.hcmuaf.fit.controller;

import com.edu.hcmuaf.fit.model.Account;
import com.edu.hcmuaf.fit.model.VerifyAccount;
import com.edu.hcmuaf.fit.service.AccountService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "changeInfo", value = "/changeInfo")
public class ChangeInfo extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String name = request.getParameter("TenHT");
        String phoneNumber = request.getParameter("SDTHT");
        String email = request.getParameter("GmailHT");
        String gender = request.getParameter("gender");
        Date birthDay = Date.valueOf(request.getParameter("HienThiNS"));
        String address = request.getParameter("DCHT");
        String addressReceive = request.getParameter("DCNHHT");
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("account");
        Account account = (Account) obj;
        String emailInDb = account.getEmail();
        String res = "";
        if (name == null || name.trim().isEmpty()) {
            res = "Vui lòng nhập họ và tên!";
        } else if (email == null || email.trim().isEmpty()) {
            res = "Vui lòng nhập Email!";
        } else if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            res = "Email không hợp lệ!";
        } else if(AccountService.getInstance().checkExistEmail(email) && !email.equals(emailInDb)){
            res = "Email đã tồn tại trong hệ thống!";
        }else if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
            res = "Vui lòng nhập số điện thoại!";
        } else if (!phoneNumber.matches("^\\d{10}$")) {
            res = "Số điện thoại không hợp lệ!";
        } else if (address == null || address.trim().isEmpty()) {
            res = "Vui lòng nhập địa chỉ!";
        } else if (birthDay == null) {
            res = "Vui lòng chọn ngày sinh!";
        } else {

            Account accountNew = new Account(account.getId(), name, email, phoneNumber, gender, birthDay, address, addressReceive);
            VerifyAccount vrf = AccountService.getInstance().getVrfOfAccount(account.getId());
            accountNew.setVerifyAccount(vrf);
            session.setAttribute("account", accountNew);
            if (AccountService.getInstance().updateInfor(accountNew) > 0) {
                res = "Cập nhật thành công!";
            } else {
                res = "Cập nhật thất bại!";
            }
        }
        request.setAttribute("res", res);
        request.getRequestDispatcher("changeInformation.jsp").forward(request, response);
    }
}

