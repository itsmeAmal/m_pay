package com.caller.components;

public class DailySummaryStatus {

	private int successCount;
	private int failCount;
	private int timeoutCount;
	private double successPer;
	private double failPer;
	private double timeoutPer;

	public DailySummaryStatus() {
		
	}
	
	private int allDailyCount;
	public int getAllDailyCount() {
		return allDailyCount;
	}


	public void setAllDailyCount(int allDailyCount) {
		this.allDailyCount = allDailyCount;
	}


	public int getSuccessCount() {
		return successCount;
	}


	public void setSuccessCount(int successCount) {
		this.successCount = successCount;
	}


	public int getFailCount() {
		return failCount;
	}


	public void setFailCount(int failCount) {
		this.failCount = failCount;
	}


	public int getTimeoutCount() {
		return timeoutCount;
	}


	public void setTimeoutCount(int timeoutCount) {
		this.timeoutCount = timeoutCount;
	}


	public double getSuccessPer() {
		return successPer;
	}


	public void setSuccessPer(double successPer) {
		this.successPer = successPer;
	}


	public double getFailPer() {
		return failPer;
	}


	public void setFailPer(double failPer) {
		this.failPer = failPer;
	}


	public double getTimeoutPer() {
		return timeoutPer;
	}


	public void setTimeoutPer(double timeoutPer) {
		this.timeoutPer = timeoutPer;
	}

	
}
