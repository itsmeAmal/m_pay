package com.mobios.beet.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
//update transaction success table
/*
@NamedQuery(name="TransactionsSuccess.updatetransactionInfo",
query="UPDATE TransactionsSuccess ts SET ts.amount=?1, ts.date=?2 WHERE ts.tranId=?3 AND ts.transactionType=?4 ")

*/

@Entity
@Table(name="transactions_success")
@EntityListeners(AuditingEntityListener.class)
public class TransactionsSuccess {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "tran_id")
	private String tranId;
	
	@Column(name = "transaction_type")
	private String transactionType;
	
	@Column(name = "account_from")
	private String accountFrom;
	
	@Column(name = "account_to")
	private String accountTo;
	
	@Column(name = "amount")
	private String amount;
	
	@Column(name = "fees")
	private double fees;
	
	@Column(name = "taxes")
	private double taxes;
	
	@Column(name = "points_earned")
	private int pointsEarned;
	
	@Column(name = "discount")
	private double discount;
	
	@Column(name = "date")
	private String date;
	
	@Column (name = "merchant_code")
	private int merchantCode;

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTranId() {
		return tranId;
	}

	public void setTranId(String tranId) {
		this.tranId = tranId;
	}

	

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public String getAccountFrom() {
		return accountFrom;
	}

	public void setAccountFrom(String accountFrom) {
		this.accountFrom = accountFrom;
	}

	public String getAccountTo() {
		return accountTo;
	}

	public void setAccountTo(String accountTo) {
		this.accountTo = accountTo;
	}

	

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public double getFees() {
		return fees;
	}

	public void setFees(double fees) {
		this.fees = fees;
	}

	public double getTaxes() {
		return taxes;
	}

	public void setTaxes(double taxes) {
		this.taxes = taxes;
	}

	public int getPointsEarned() {
		return pointsEarned;
	}

	public void setPointsEarned(int pointsEarned) {
		this.pointsEarned = pointsEarned;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getMerchantCode() {
		return merchantCode;
	}

	public void setMerchantCode(int merchantCode) {
		this.merchantCode = merchantCode;
	}

	
	
	
}
