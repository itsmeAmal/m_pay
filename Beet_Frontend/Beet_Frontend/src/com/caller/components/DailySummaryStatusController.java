package com.caller.components;

import java.io.IOException;
import java.util.List;

import com.caller.Callers;
import com.caller.TransactionAll;

public class DailySummaryStatusController{
	
	DailySummaryStatus dailySummaryStutus = new DailySummaryStatus();
	DailySummaryStatus dailySummaryStatusByAccNo = new DailySummaryStatus();
	int allDailyCount,successCount,failCount,timeoutCount=0;
	double successPer,timeoutPer,failPer=0;
	
	public DailySummaryStatus dailyStatusProcessor(String date){
		try {
			
			Callers callObj = new Callers();
			List<TransactionAll>  dailyTransList = callObj.getDailyStatus(date);
			allDailyCount = dailyTransList.size();
			successCount=0;
			failCount=0;
			timeoutCount=0;
			successPer=0;
			timeoutPer=0;
			failPer=0;
			System.out.println(date+"******************** IN THE CLASS" );
			for(int z = 0;z<dailyTransList.size();z++){ 
				String tempTransStatus = dailyTransList.get(z).getStatus();
				if(tempTransStatus.equals("success")){ 
					successCount=successCount+1; 
				}else if(tempTransStatus.equals("fail")){
					failCount= failCount+1; 
				}else if(tempTransStatus.equals("timeout")){
					timeoutCount= timeoutCount+1; 
				}else {
					System.out.print("etrehgureh9gher9ghf9uvre9r***************");
				}
			}
			if(allDailyCount == 0) {
				successPer= 0;
				timeoutPer=0;
				failPer=0;
			}else {
			successPer=(double)(successCount)/(double)(allDailyCount);
			timeoutPer=(double)(timeoutCount)/(double)(allDailyCount);
			failPer=(double)(failCount)/(double)(allDailyCount);
			}
			
		}catch(IOException ex) {
			System.out.println (ex.toString());
		}
		dailySummaryStutus.setAllDailyCount(allDailyCount);
		dailySummaryStutus.setSuccessCount(successCount);
		dailySummaryStutus.setFailCount(failCount);
		dailySummaryStutus.setTimeoutCount(timeoutCount);
		dailySummaryStutus.setSuccessPer(successPer);
		dailySummaryStutus.setFailPer(failPer);
		dailySummaryStutus.setTimeoutPer(timeoutPer);
		return dailySummaryStutus;
		}
	
	public DailySummaryStatus dailyStatusProcessorByAccNo(String date,String accno){
		try {
			
			Callers callObj = new Callers();
			List<TransactionAll>  dailyTransList = callObj.getDailyStatusByAccno(date, accno);
			allDailyCount = dailyTransList.size();
			successCount=0;
			failCount=0;
			timeoutCount=0;
			successPer=0;
			timeoutPer=0;
			failPer=0;
			
			for(int z = 0;z<dailyTransList.size();z++){ 
				String tempTransStatus = dailyTransList.get(z).getStatus();
				if(tempTransStatus.equals("success")){ 
					successCount=successCount+1; 
				}else if(tempTransStatus.equals("fail")){
					failCount= failCount+1; 
				}else if(tempTransStatus.equals("timeout")){
					timeoutCount= timeoutCount+1; 
				}else {
					System.out.print("etrehgureh9gher9ghf9uvre9r***************");
				}
			}
			if(allDailyCount == 0) {
				successPer= 0;
				timeoutPer=0;
				failPer=0;
			}else {
			successPer=(double)(successCount)/(double)(allDailyCount);
			timeoutPer=(double)(timeoutCount)/(double)(allDailyCount);
			failPer=(double)(failCount)/(double)(allDailyCount);
			}
			
		}catch(IOException ex) {
			System.out.println (ex.toString());
		}
		dailySummaryStatusByAccNo.setAllDailyCount(allDailyCount);
		dailySummaryStatusByAccNo.setSuccessCount(successCount);
		dailySummaryStatusByAccNo.setFailCount(failCount);
		dailySummaryStatusByAccNo.setTimeoutCount(timeoutCount);
		dailySummaryStatusByAccNo.setSuccessPer(successPer);
		dailySummaryStatusByAccNo.setFailPer(failPer);
		dailySummaryStatusByAccNo.setTimeoutPer(timeoutPer);
		return dailySummaryStatusByAccNo;
		}
}
	