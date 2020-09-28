package com.caller.components;

import java.io.IOException;
import java.util.List;

import com.caller.Callers;
import com.caller.TransactionSuccess;

public class AllSumaryTypeController {

int fundCount,cashinCount,cashoutCount,topupCount,billCount=0;
	
	DailySummaryType dailySummaryType = new DailySummaryType();
	
	public DailySummaryType AllSummaryTypeProcessor() {
		
		try {
			Callers callObj = new Callers();
			List<TransactionSuccess>  dailyTransList = callObj.getAllDetails();
			
			 for(int x = 0; x < dailyTransList.size(); x++){ 
			
			String tempTransactionType = dailyTransList.get(x).getTransactionType();
			if(tempTransactionType.equals("1")){
				billCount ++;
			}
			if(tempTransactionType.equalsIgnoreCase("2")){
				fundCount ++;
			}
			if(tempTransactionType.equals("3")){
				cashinCount ++;
			}
			if(tempTransactionType.equals("4")){
				cashoutCount ++;
			}
			if(tempTransactionType.equals("5")){
				topupCount ++;
			} 
		}
		}catch(IOException ex){
			System.out.println (ex.toString());
		}
		
		dailySummaryType.setBillCount(billCount);
		dailySummaryType.setCashinCount(cashinCount);
		dailySummaryType.setCashoutCount(cashoutCount);
		dailySummaryType.setFundCount(fundCount);
		dailySummaryType.setTopupCount(topupCount);
		
		return dailySummaryType;
	}
	
}
