package com.mobios.beet.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name="fees")
@EntityListeners(AuditingEntityListener.class)

public class Fees {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "transaction_id")
	private int transactionId;
	
	@Column(name = "fees_amount")
	private double feesAmount;
	
	@Column(name = "transaction_type_id")
	private int transactionTypeId;
	
	@Column(name = "date")
	private String date;

	
	//getters and setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}

	public double getFeesAmount() {
		return feesAmount;
	}

	public void setFeesAmount(double feesAmount) {
		this.feesAmount = feesAmount;
	}

	public int getTransactionTypeId() {
		return transactionTypeId;
	}

	public void setTransactionTypeId(int transactionTypeId) {
		this.transactionTypeId = transactionTypeId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	

	
	
}
