package com.mobios.beet.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name="commission_rules")
@EntityListeners(AuditingEntityListener.class)

//update query
@NamedQuery(name="CommissionRules.updateCommissionRates",
query= "UPDATE CommissionRules c SET c.rate=?1  WHERE c.userTypeId=?2 AND c.transactionTypeId=?3 ")

/*
//select query
@NamedQuery(name="CommissionRules.getCommission",
query = "select c from CommissionRules c where c.userTypeId=?1 AND c.transactionTypeId=?2 ")
*/

//select query
@NamedQuery(name="CommissionRules.getCommission",
query = "select c from CommissionRules c where c.transactionTypeId=?1 ")

//update original commission rules table when the current time is the applied time 
@NamedQuery(name="CommissionRules.updateCommissionInfo",
query="UPDATE CommissionRules c SET c.rate=?1 WHERE c.userTypeId=?2 AND c.transactionTypeId=?3 ")


public class CommissionRules {

	@Id
	@Column(name = "id")
	private int id;
	
	@Column(name = "user_type_id") 
	private int userTypeId;
	 
	@Column(name = "transaction_type_id")
	private int transactionTypeId;
	
	@Column(name = "rate")
	private double rate;
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	 public int getUserTypeId() { 
		 return userTypeId; 
		 
	 }
	  
	 public void setUserTypeId(int userTypeId) { 
		 this.userTypeId = userTypeId; 
		 
	 }
	 

	public int getTransactionTypeId() {
		return transactionTypeId;
	}

	public void setTransactionTypeId(int transactionTypeId) {
		this.transactionTypeId = transactionTypeId;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}
	
	
}
