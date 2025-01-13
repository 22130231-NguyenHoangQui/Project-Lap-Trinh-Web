package com.edu.hcmuaf.fit.model;
import java.math.BigDecimal;
import java.util.Date;

public class Promotion {
    private String id;
    private Date startDate;
    private int durationDays;
    private BigDecimal discountValue;
    private String description;
    private int paymentId;

    // Constructor
    public Promotion(String id, Date startDate, int durationDays, BigDecimal discountValue, String description, int paymentId) {
        this.id = id;
        this.startDate = startDate;
        this.durationDays = durationDays;
        this.discountValue = discountValue;
        this.description = description;
        this.paymentId = paymentId;
    }

    // Getters and setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public int getDurationDays() {
        return durationDays;
    }

    public void setDurationDays(int durationDays) {
        this.durationDays = durationDays;
    }

    public BigDecimal getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(BigDecimal discountValue) {
        this.discountValue = discountValue;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }
}
