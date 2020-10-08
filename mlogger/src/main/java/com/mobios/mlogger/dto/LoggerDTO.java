package com.mobios.mlogger.dto;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class LoggerDTO {
    private int id;
    private int fromUserType;
    private String fromUserAccountNo;
    private int toUserType;
    private String toUserAccountNo;
    private Timestamp dateTime;
    private BigDecimal transactionAmount;
    private int transactionType;
    private String successStatus;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFromUserType() {
        return fromUserType;
    }

    public void setFromUserType(int fromUserType) {
        this.fromUserType = fromUserType;
    }

    public String getFromUserAccountNo() {
        return fromUserAccountNo;
    }

    public void setFromUserAccountNo(String fromUserAccountNo) {
        this.fromUserAccountNo = fromUserAccountNo;
    }

    public int getToUserType() {
        return toUserType;
    }

    public void setToUserType(int toUserType) {
        this.toUserType = toUserType;
    }

    public String getToUserAccountNo() {
        return toUserAccountNo;
    }

    public void setToUserAccountNo(String toUserAccountNo) {
        this.toUserAccountNo = toUserAccountNo;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public BigDecimal getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(BigDecimal transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public int getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(int transactionType) {
        this.transactionType = transactionType;
    }

    public String getSuccessStatus() {
        return successStatus;
    }

    public void setSuccessStatus(String successStatus) {
        this.successStatus = successStatus;
    }

    @Override
    public String toString() {
        return "LoggerDTO{" +
                "id=" + id +
                ", fromUserType=" + fromUserType +
                ", fromUserAccountNo='" + fromUserAccountNo + '\'' +
                ", toUserType=" + toUserType +
                ", toUserAccountNo='" + toUserAccountNo + '\'' +
                ", dateTime=" + dateTime +
                ", transactionAmount=" + transactionAmount +
                ", transactionType=" + transactionType +
                ", successStatus='" + successStatus + '\'' +
                '}';
    }
}
