package com.mobios.beet.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name="comission")
@EntityListeners(AuditingEntityListener.class)
public class Commission {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "profile_acc_no")
	private String profileAccNo;
	
	@Column(name = "transaction_types_id")
	private int transactionTypesId;
	
	@Column(name = "commission_amount")
	private double commissionAmount;
	
	@Column(name = "transaction_id")
	private int transactionId;

	
	
	//Getters And Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProfileAccNo() {
		return profileAccNo;
	}

	public void setProfileAccNo(String profileAccNo) {
		this.profileAccNo = profileAccNo;
	}

	public int getTransactionTypesId() {
		return transactionTypesId;
	}

	public void setTransactionTypesId(int transactionTypesId) {
		this.transactionTypesId = transactionTypesId;
	}

	public double getCommissionAmount() {
		return commissionAmount;
	}

	public void setCommissionAmount(double commissionAmount) {
		this.commissionAmount = commissionAmount;
	}

	public int getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}
	
	
	
	
	
	
}
