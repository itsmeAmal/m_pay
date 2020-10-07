package com.mpay.logger.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="logs")
@EntityListeners(AuditingEntityListener.class)
public class Logger {
	
	@Id
	@Column(name="id")
	private int Id;
	
	@Column(name="from_user_type")
	private int FromUserType;
	
	@Column(name="from_user_acc_no")
	private String FromUserAccountNo;
	
	@Column(name="to_user_type")
	private int ToUserType;
	
	@Column(name="to_user_acc_no")
	private String ToUserAccountNo;
	
	@Column(name="date_time") 
	private Timestamp DateTime;
	
	@Column(name="transaction_amount")
	private BigDecimal TransactionAmount; 
	
	@Column(name="transaction_type")
	private int TransactionType;
	
	@Column(name="success_status")
	private String SuccessStatus;
	
	public int getId() {
		return Id;
	}
	
	public void setId(int id) {
		Id = id;
	}
	
	public int getFromUserType() {
		return FromUserType;
	}
	
	public void setFromUserType(int fromUserType) {
		FromUserType = fromUserType;
	}
	
	public String getFromUserAccountNo() {
		return FromUserAccountNo;
	}
	
	public void setFromUserAccountNo(String fromUserAccountNo) {
		FromUserAccountNo = fromUserAccountNo;
	}
	
	public int getToUserType() {
		return ToUserType;
	}
	
	public void setToUserType(int toUserType) {
		ToUserType = toUserType;
	}
	
	public String getToUserAccountNo() {
		return ToUserAccountNo;
	}
	
	public void setToUserAccountNo(String toUserAccountNo) {
		ToUserAccountNo = toUserAccountNo;
	}
	
	public Timestamp getDateTime() {
		return DateTime;
	}
	
	public void setDateTime(Timestamp dateTime) {
		DateTime = dateTime;
	}
	
	public BigDecimal getTransactionAmount() {
		return TransactionAmount;
	}
	
	public void setTransactionAmount(BigDecimal transactionAmount) {
		TransactionAmount = transactionAmount;
	}
	
	public int getTransactionType() {
		return TransactionType;
	}
	
	public void setTransactionType(int transactionType) {
		TransactionType = transactionType;
	}
	
	public String getSuccessStatus() {
		return SuccessStatus;
	}
	
	public void setSuccessStatus(String successStatus) {
		SuccessStatus = successStatus;
	}
	
	
	
}
