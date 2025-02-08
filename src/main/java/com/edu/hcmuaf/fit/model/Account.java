package com.edu.hcmuaf.fit.model;

import java.sql.Date;
public class Account {
    private int id;
    private String name;
    private String userName;
    private String password;
    private String email;
    private String phoneNumber;
    private String gender;
    private Date birthDay;
    private String address;
    private String addressReceive;
    private int role;
    private boolean status;
    private java.util.Date created_at;
    private java.util.Date updated_at;
    private VerifyAccount verifyAccount;

    public Account(Account a) {
        this.id = a.id;
        this.name = a.name;
        this.userName = a.userName;
        this.password = a.password;
        this.email = a.email;
        this.phoneNumber = a.phoneNumber;
        this.gender = a.gender;
        this.birthDay = a.birthDay;
        this.address = a.address;
        this.addressReceive = a.addressReceive;
        this.role = a.role;
        this.status = a.status;
        this.verifyAccount = a.verifyAccount;
    }
    public Account(int id, String name, String userName, String password, String email, String phoneNumber, String gender, Date birthDay, String address, String addressReceive, int role, boolean status) {
        this.id = id;
        this.name = name;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.birthDay = birthDay;
        this.address = address;
        this.addressReceive = addressReceive;
        this.role = role;
        this.status = status;
    }
    public Account(int id, String name, String email, String password, String phoneNumber, String gender, Date birthDay, String address, String addressReceive, int role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.birthDay = birthDay;
        this.address = address;
        this.addressReceive = addressReceive;
        this.role = role;
    }
    public Account(int id, String name, String email, String phoneNumber, String gender, Date birthDay, String address, String addressReceive) {
        this.id = id;
        this.name = name;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.birthDay = birthDay;
        this.address = address;
        this.addressReceive = addressReceive;
    }
    public Account(String name, String userName, String password, String email, String phoneNumber, String gender, Date birthDay, String address, String addressReceive) {
        this.name = name;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.birthDay = birthDay;
        this.address = address;
        this.addressReceive = addressReceive;
    }
    public Account(int id, String name, String userName, String password, String email, String phoneNumber, String gender, Date birthDay, String address, String addressReceive) {
        this.id = id;
        this.name = name;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.birthDay = birthDay;
        this.address = address;
        this.addressReceive = addressReceive;
    }
    public Account(String userName, String password, String email) {
        this.userName = userName;
        this.password = password;
        this.email = email;
    }
    public Account() {
    }

    public Account(int id, String userName, String email, String phoneNumber) {
        this.id = id;
        this.userName = userName;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddressReceive() {
        return addressReceive;
    }

    public void setAddressReceive(String addressReceive) {
        this.addressReceive = addressReceive;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public VerifyAccount getVerifyAccount() {
        return verifyAccount;
    }

    public void setVerifyAccount(VerifyAccount verifyAccount) {
        this.verifyAccount = verifyAccount;
    }

    public java.util.Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(java.util.Date created_at) {
        this.created_at = created_at;
    }

    public java.util.Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(java.util.Date updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", gender='" + gender + '\'' +
                ", birthDay=" + birthDay +
                ", address='" + address + '\'' +
                ", addressReceive='" + addressReceive + '\'' +
                ", role=" + role +
                ", status=" + status +
                '}';
    }

}