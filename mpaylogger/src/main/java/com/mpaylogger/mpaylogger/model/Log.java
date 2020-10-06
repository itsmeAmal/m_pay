package com.mpaylogger.mpaylogger.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity 
@Table(name="logs")
public class Log 
{
	@Id
	@Column(name="id", unique = true, nullable = false)
	private int Id;
	
	@Column(name="from_user_type")
	private int FromUserType;
	
	@Column(name="from_user_acc_no")
	private String FromUserAccount;
	
	@Column(name="to_user_type")
	private int ToUserType;
	
	@Column(name="to_user_acc_no")
	private String ToUserAccount;
	
	@Column(name="date_time")
	private Timestamp DateTime;
	
	@Column(name="transaction_amount")
	private BigDecimal Amount;
	
	@Column(name="transaction_type")
	private int TransactionType;
	
	@Column(name="success_status")
	private String SuccessStatus;
	
	@Override
	public String toString() 
	{
		return "Log [Id=" + Id + ", FromUserType=" + FromUserType + ", FromUserAccount=" + FromUserAccount
				+ ", ToUserType=" + ToUserType + ", ToUserAccount=" + ToUserAccount + ", DateTime=" + DateTime
				+ ", Amount=" + Amount + ", TransactionType=" + TransactionType + ", SuccessStatus=" + SuccessStatus
				+ "]";
	}
	
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
	
	public String getFromUserAccount() {
		return FromUserAccount;
	}
	
	public void setFromUserAccount(String fromUserAccount) {
		FromUserAccount = fromUserAccount;
	}
	
	public int getToUserType() {
		return ToUserType;
	}
	
	public void setToUserType(int toUserType) {
		ToUserType = toUserType;
	}
	
	public String getToUserAccount() {
		return ToUserAccount;
	}
	
	public void setToUserAccount(String toUserAccount) {
		ToUserAccount = toUserAccount;
	}
	
	public Timestamp getDateTime() {
		return DateTime;
	}
	
	public void setDateTime(Timestamp dateTime) {
		DateTime = dateTime;
	}
	
	public BigDecimal getAmount() {
		return Amount;
	}
	
	public void setAmount(BigDecimal amount) {
		Amount = amount;
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
