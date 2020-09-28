package com.mobios.beet.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;


@Entity
@Table(name="temp_fees")
@EntityListeners(AuditingEntityListener.class)


//update the status Pending into Applied
 @NamedQuery(name="FeesUpdate.updateRequestStatus",
 query="UPDATE FeesUpdate fr SET fr.requestStatus=?1 WHERE fr.transactionTypesId=?2 AND fr.minAmount=?3 AND fr.maxAmount=?4")

 
/* AND f.updateFromDate=?6 */


public class FeesUpdate {

	@Id
	@Column(name="id")
	private int id;
	
	@Column(name = "transaction_types_id")
	private int transactionTypesId;
	
	@Column(name="min_amount")
	private double minAmount;
	
	@Column(name="max_amount")
	private double maxAmount;
	
	@Column(name="new_fee_rate")
	private double newFeeRate;
	
	@Column(name="new_fee")
	private double newFee;
	
	@Column(name="update_from_date")
	private String updateFromDate;
	
	@Column(name="update_requesting_date")
	private String updateRequestingDate;
	
	@Column(name="request_status") //Applied  or not 
	private String requestStatus;

	
	//Getters And Setters
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

	public double getNewFeeRate() {
		return newFeeRate;
	}

	public void setNewFeeRate(double newFeeRate) {
		this.newFeeRate = newFeeRate;
	}

	public double getNewFee() {
		return newFee;
	}

	public void setNewFee(double newFee) {
		this.newFee = newFee;
	}

	public String getUpdateFromDate() {
		return updateFromDate;
	}

	public void setUpdateFromDate(String updateFromDate) {
		this.updateFromDate = updateFromDate;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	public String getUpdateRequestingDate() {
		return updateRequestingDate;
	}

	public void setUpdateRequestingDate(String updateRequestingDate) {
		this.updateRequestingDate = updateRequestingDate;
	}

	
	
}
