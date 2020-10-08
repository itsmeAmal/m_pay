package com.mobios.mlogger.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;

@Entity
@Table(name="logs")
@EntityListeners(AuditingEntityListener.class)
public class Logger {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="from_user_type")
    private int fromUserType;

    @Column(name="from_user_acc_no")
    private String fromUserAccountNo;

    @Column(name="to_user_type")
    private int toUserType;

    @Column(name="to_user_acc_no")
    private String toUserAccountNo;

    @Column(name="date_time")
    private Timestamp dateTime;

    @Column(name="transaction_amount")
    private BigDecimal transactionAmount;

    @Column(name="transaction_type")
    private int transactionType;

    @Column(name="success_status")
    private String successStatus;

    public Logger() {
    }

    public Logger(int fromUserType, String fromUserAccountNo, int toUserType, String toUserAccountNo, BigDecimal transactionAmount, int transactionType, String successStatus)
    {
        this.fromUserType = fromUserType;
        this.fromUserAccountNo = fromUserAccountNo;
        this.toUserType = toUserType;
        this.toUserAccountNo = toUserAccountNo;
        this.transactionAmount = transactionAmount;
        this.transactionType = transactionType;
        this.successStatus = successStatus;
    }

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
}
