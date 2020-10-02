package com.mobios.beet.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name="fee_category_rules")
@EntityListeners(AuditingEntityListener.class)

//update the fee rules table
//@NamedQuery(name="FeesRules.updateFeesRates",
//query="UPDATE FeesRules f SET f.feeRate=?1 , f.fee=?2   WHERE f.transactionTypesId=?3 AND f.minAmount=?4 AND f.maxAmount=?5")


 //update original fees rules table when the current time is the applied time 
 @NamedQuery(name="FeesRules.updateFeeInfo",
 query="UPDATE FeesRules f SET f.feeRate=?1 , f.fee=?2   WHERE f.transactionTypesId=?3 AND f.minAmount=?4 AND f.maxAmount=?5"
 )

/*
 * //temp
 * 
 * @NamedQuery(name="FeesRules.updateFeeInfo",
 * query="UPDATE FeesRules f SET f.feeRate=?1 , f.fee=?2   WHERE f.transactionTypesId=?3"
 * )
 */
@NamedQuery(name="FeesRules.getFees",
query = "select f from FeesRules f where f.transactionTypesId=?1 and f.minAmount=?2 and f.maxAmount=?3")

public class FeesRules {

	@Id
	@Column(name = "fee_id")
	private int feeId;
	
	@Column(name = "transaction_types_id")
	private int transactionTypesId;
	
	@Column(name="min_amount")
	private double minAmount;
	
	@Column(name="max_amount")
	private double maxAmount;
	
	@Column(name="fee_rate")
	private double feeRate;
	
	@Column(name="fee")
	private double fee;

	public int getFeeId() {
		return feeId;
	}

	public void setFeeId(int feeId) {
		this.feeId = feeId;
	}

	public int getTransactionTypesId() {
		return transactionTypesId;
	}

	public void setTransactionTypesId(int transactionTypesId) {
		this.transactionTypesId = transactionTypesId;
	}

	public double getMinAmount() {
		return minAmount;
	}

	public void setMinAmount(double minAmount) {
		this.minAmount = minAmount;
	}

	public double getMaxAmount() {
		return maxAmount;
	}

	public void setMaxAmount(double maxAmount) {
		this.maxAmount = maxAmount;
	}

	public double getFeeRate() {
		return feeRate;
	}

	public void setFeeRate(double feeRate) {
		this.feeRate = feeRate;
	}

	public double getFee() {
		return fee;
	}

	public void setFee(double fee) {
		this.fee = fee;
	}
	
	
}
