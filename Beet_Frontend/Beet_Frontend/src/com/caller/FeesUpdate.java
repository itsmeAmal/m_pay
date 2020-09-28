package com.caller;



public class FeesUpdate {

	
	private int id;
	
	private int transactionTypesId;
	
	private double minAmount;
	
	private double maxAmount;
	
	private double newFeeRate;
	
	private double newFee;
	
	private String updateFromDate;
	
	private String updateRequestingDate;
	 //Applied  or not 
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
