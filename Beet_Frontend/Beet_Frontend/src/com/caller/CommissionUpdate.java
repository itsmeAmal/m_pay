package com.caller;

public class CommissionUpdate {
	
	private int id;
	
	private int transactionTypesId;
	
	private int userTypeId;
	
	private double newRate;
	
	private String updateFromDate;
	
	private String updateRequestingDate;
	
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
