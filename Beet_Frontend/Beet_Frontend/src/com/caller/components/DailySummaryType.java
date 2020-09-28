package com.caller.components;
import com.caller.Callers;

public class DailySummaryType {

	public Callers callerobj = new Callers();
	
	int fundCount;
	int cashinCount;
	int cashoutCount;
	int topupCount;
	int billCount;
	
	public void setBillCount(int billCount) {
		this.billCount = billCount;
	}
	public void setFundCount(int fundCount) {
		this.fundCount = fundCount;
	}
	public void setCashinCount(int cashinCount) {
		this.cashinCount = cashinCount;
	}
	public void setCashoutCount(int cashoutCount) {
		this.cashoutCount = cashoutCount;
	}
	public void setTopupCount(int topupCount) {
		this.topupCount = topupCount;
	}
	
	public int getCashinCount() {
		return cashinCount;
	}
	public int getCashoutCount() {
		return cashoutCount;
	}
	public int getFundCount() {
		return fundCount;
	}
	public int getTopupCount() {
		return topupCount;
	}
	public int getBillCount() {
		return billCount;
	}
	
}
