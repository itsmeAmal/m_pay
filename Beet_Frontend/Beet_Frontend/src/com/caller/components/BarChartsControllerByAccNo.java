package com.caller.components;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.caller.Callers;
import com.caller.TransactionSuccess;
import com.caller.TransactionAll;

public class BarChartsControllerByAccNo {
	Date dateParser = new Date();
	String date = new SimpleDateFormat("yyyy-MM-dd").format(dateParser);
		
	DailySummaryStatusController dailySummaryStatusController = new DailySummaryStatusController();
	//DailySummaryStatus dailySummaryStatusByAccNo = dailySummaryStatusController.dailyStatusProcessorByAccNo(date, accno);
	
	 String tempStatus= null;
	 String tempDate= null;
	 String tempTime = null;
	 int[] hourlySuccessTransactionArr = new int[24];
	 int[] hourlyTimeoutTransactionArr = new int[24];
	 int[] hourlyFailTransactionArr = new int[24];
	 int[] hourlyAllTransactionArr = new int[24];
	 
	 int count=0; 
	 
	 public int[] createtHourlySuccessBarChartByAccNo(String date,String accno) {
		 try {
			 count=0;
			 Callers callObj = new Callers();
				List<TransactionAll>  dailyTransList = callObj.getDailyStatusByAccno(date, accno);
				DailySummaryStatus dailySummaryStatusByAccNo = dailySummaryStatusController.dailyStatusProcessorByAccNo(date, accno);
				int[] tempSuccessHourValHolder = new int[dailySummaryStatusByAccNo.getSuccessCount()];
				
				for(int i=0; i<dailyTransList.size(); i++){
				 	tempDate= dailyTransList.get(i).getDate();
				 	tempTime= tempDate.substring(11,13);
					//hour = Integer.parseInt(tempTime);
				 	tempStatus = dailyTransList.get(i).getStatus();
				 	
				 	if(tempStatus.equals("success")){
				 		tempSuccessHourValHolder[count] =Integer.parseInt(tempTime) ;
				 		count++;	
				 	} 
				 }hourlySuccessTransactionArr=getHourly(tempSuccessHourValHolder);
			}catch(IOException ex) {
				System.out.println(ex.toString());
			}
		 return hourlySuccessTransactionArr;
		 }
	 
	 public int[] createtHourlyFailBarChartByAccNo(String date,String accno) {
		 try {
			 count=0;
			 Callers callObj = new Callers();
				List<TransactionAll>  dailyTransList = callObj.getDailyStatusByAccno(date, accno);
				DailySummaryStatus dailySummaryStatusByAccNo = dailySummaryStatusController.dailyStatusProcessorByAccNo(date, accno);
				int[] tempFailHourValHolder = new int[dailySummaryStatusByAccNo.getFailCount()];
				for(int i=0; i<dailyTransList.size(); i++){
				 	tempDate= dailyTransList.get(i).getDate();
				 	tempTime= tempDate.substring(11,13);
					//hour = Integer.parseInt(tempTime);
				 	tempStatus = dailyTransList.get(i).getStatus();
				 	
				 	if(tempStatus.equals("fail")){
				 		tempFailHourValHolder[count] =Integer.parseInt(tempTime) ;
				 		count++;	
				 	} 
				 }hourlyFailTransactionArr=getHourly(tempFailHourValHolder);
			}catch(IOException ex) {
				System.out.println(ex.toString());
			}
		 return hourlyFailTransactionArr;
		}
	 
	 public int[] createtHourlyTimeoutBarChartByAccNo(String date,String accno) {
		 try {
			 count=0;
			 Callers callObj = new Callers();
				List<TransactionAll>  dailyTransList = callObj.getDailyStatusByAccno(date, accno);
				DailySummaryStatus dailySummaryStatusByAccNo = dailySummaryStatusController.dailyStatusProcessorByAccNo(date, accno);
				int[] tempTimeOutHourHolder = new int[dailySummaryStatusByAccNo.getTimeoutCount()];
				
				for(int i=0; i<dailyTransList.size(); i++){
				 	tempDate= dailyTransList.get(i).getDate();
				 	tempTime= tempDate.substring(11,13);
					//hour = Integer.parseInt(tempTime);
				 	tempStatus = dailyTransList.get(i).getStatus();
				 	
				 	if(tempStatus.equals("timeout")){
				 		tempTimeOutHourHolder[count] =Integer.parseInt(tempTime) ;
				 		count++;	
				 	} 
				 }hourlyTimeoutTransactionArr=getHourly(tempTimeOutHourHolder);
			}catch(IOException ex) {
				System.out.println(ex.toString());
			}
		 return hourlyTimeoutTransactionArr;
		 }
	 
	 public int[] createtHourlyAllBarChartByAccNo(String date,String accno) {
		 try {
			 count=0;
			 Callers callObj = new Callers();
				List<TransactionSuccess>  dailyTransList = callObj.getDailyByAccno(accno, date);
				DailySummaryStatus dailySummaryStatusByAccNo = dailySummaryStatusController.dailyStatusProcessorByAccNo(date, accno);
				int[] tempAllHourHolder = new int[dailyTransList.size()];
				
				for(int i=0; i<dailyTransList.size(); i++){
				 	tempDate= dailyTransList.get(i).getDate();
				 	tempTime= tempDate.substring(11,13);
					//hour = Integer.parseInt(tempTime);
				 	
				 		tempAllHourHolder[count] =Integer.parseInt(tempTime) ;
				 		count++;	
				 	 
				 }hourlyAllTransactionArr=getHourly(tempAllHourHolder);
			}catch(IOException ex) {
				System.out.println(ex.toString());
			}
		 return hourlyAllTransactionArr;
		 }
	 
	public int[] getHourly(int[] tempHourHolder) {
			 
			 int[] hourly={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
			 for (int i=0; i<tempHourHolder.length;i++){		
					switch(tempHourHolder[i]){
					
						case 1 : hourly[0]++ ;
						break;
						case 2 : hourly[1]++;
						break;
						case 3 : hourly[2]++;
						break;
						case 4 : hourly[3]++;
						break;
						case 5 : hourly[4]++;
						break;
						case 6 : hourly[5]++;
						break;
						case 7 : hourly[6]++;
						break;
						case 8 : hourly[7]++;
						break;
						case 9 : hourly[8]++;
						break;
						case 10 : hourly[9]++;
						break;
						case 11 : hourly[10]++;
						break;
						case 12 : hourly[11]++;
						break;
						case 13 : hourly[12]++;
						break;
						case 14 : hourly[13]++;
						break;
						case 15 : hourly[14]++;
						break;
						case 16 : hourly[15]++;
						break;
						case 17 : hourly[16]++;
						break;
						case 18 : hourly[17]++;
						break;
						case 19 : hourly[18]++;
						break;
						case 20 : hourly[19]++;
						break;
						case 21 : hourly[20]++;
						break;
						case 22 : hourly[21]++;
						break;
						case 23 : hourly[22]++;
						break;
						case 24 : hourly[23]++;
						break;
						}
					}
					return hourly;
				}
		 
}
