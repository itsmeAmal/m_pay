package com.mobios.beet.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;


@Entity
@Table(name="temp_commission")
@EntityListeners(AuditingEntityListener.class)

//update the status Pending into Applied
@NamedQuery(name="CommissionUpdate.updateRequestStatus",
query="UPDATE CommissionUpdate cu SET cu.requestStatus=?1 WHERE cu.userTypeId=?2 AND cu.transactionTypesId=?3")


public class CommissionUpdate {
	
	@Id
	@Column(name="id")
	private int id;
	
	@Column(name = "transaction_types_id")
	private int transactionTypesId;
	
	@Column(name = "user_type_id")
	private int userTypeId;
	
	@Column(name = "new_rate")
	private double newRate;
	
	@Column(name="update_from_date")
	private String updateFromDate;
	
	@Column(name="update_requesting_date")
	private String updateRequestingDate;
	
	@Column(name="request_status") //Applied  or not 
	private String requestStatus;
	
	
	
//getters and setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTransactionTypesId() {
		return transactionTypesId;
	}

	public void setTransactionTypesId(int transactionTypesId) {
		this.transactionTypesId = transactionTypesId;
	}

	public int getUserTypeId() {
		return userTypeId;
	}

	public void setUserTypeId(int userTypeId) {
		this.userTypeId = userTypeId;
	}

	public double getNewRate() {
		return newRate;
	}

	public void setNewRate(double newRate) {
		this.newRate = newRate;
	}

	public String getUpdateFromDate() {
		return updateFromDate;
	}

	public void setUpdateFromDate(String updateFromDate) {
		this.updateFromDate = updateFromDate;
	}

	public String getUpdateRequestingDate() {
		return updateRequestingDate;
	}

	public void setUpdateRequestingDate(String updateRequestingDate) {
		this.updateRequestingDate = updateRequestingDate;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}
	
	

}
