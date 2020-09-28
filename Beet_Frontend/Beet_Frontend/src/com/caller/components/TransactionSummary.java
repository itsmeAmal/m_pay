package com.caller.components;

public class TransactionSummary {

	private int allTransactionCount;
	private double allTransactionAmount;
	private int monthlyTransactionCount;
	private double monthlyTransactionAmount;
	private int dailyTransactionCount;
	private double dailyTransactionAmount;
	
	
	public int getAllTransactionCount() {
		return allTransactionCount;
	}
	public void setAllTransactionCount(int allTransactionCount) {
		this.allTransactionCount = allTransactionCount;
	}
	public double getAllTransactionAmount() {
		return allTransactionAmount;
	}
	public void setAllTransactionAmount(double allTransactionAmount) {
		this.allTransactionAmount = allTransactionAmount;
	}
	public int getMonthlyTransactionCount() {
		return monthlyTransactionCount;
	}
	public void setMonthlyTransactionCount(int monthlyTransactionCount) {
		this.monthlyTransactionCount = monthlyTransactionCount;
	}
	public double getMonthlyTransactionAmount() {
		return monthlyTransactionAmount;
	}
	public void setMonthlyTransactionAmount(double monthlyTransactionAmount) {
		this.monthlyTransactionAmount = monthlyTransactionAmount;
	}
	public int getDailyTransactionCount() {
		return dailyTransactionCount;
	}
	public void setDailyTransactionCount(int dailyTransactionCount) {
		this.dailyTransactionCount = dailyTransactionCount;
	}
	public double getDailyTransactionAmount() {
		return dailyTransactionAmount;
	}
	public void setDailyTransactionAmount(double dailyTransactionAmount) {
		this.dailyTransactionAmount = dailyTransactionAmount;
	}
	
	
}
