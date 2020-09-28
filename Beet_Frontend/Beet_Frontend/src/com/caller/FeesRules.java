package com.caller;

public class FeesRules {

	private int feeId;
	private int transactionTypesId;
	private double minAmount;
	private double maxAmount;
	private double feeRate;
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
