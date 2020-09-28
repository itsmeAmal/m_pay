package com.caller.components;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.caller.Callers;
import com.caller.TransactionSuccess;

public class MonthlyTransByDateController {

	int[] monthlyTransactionsByDateArr = new int[31];
	String tempDateTime=null;
	String tempDate= null;
	int count=0;
	
	public int[] createMonthlyTransByDate(String date1 , String date2) {
	
		try {count=0;
			Callers callobj = new Callers();
			List<TransactionSuccess> monthlyTransactions = callobj.getMonthly(date1, date2);
			int[] tempDateValHolder =  new int[monthlyTransactions.size()];
			String tempDate;
			
			for(int i= 0; i<monthlyTransactions.size();i++) {
				tempDateTime= monthlyTransactions.get(i).getDate();
				tempDate = tempDateTime.substring(8,10);
				tempDateValHolder[count] = Integer.parseInt(tempDate);
				count++;
			}monthlyTransactionsByDateArr = getByDate(tempDateValHolder);
		}catch(IOException ex) {
			System.out.println(ex.toString());
		}
		return monthlyTransactionsByDateArr;
	}

	public int[] createMonthlyTransByDateByAccNo(String date1 , String date2,String accno) {
		
		try {
			count=0;
			Callers callobj = new Callers();
			List<TransactionSuccess> monthlyTransactions = callobj.getTransByAccandDate(date1, date2, accno);
			int[] tempDateValHolder =  new int[monthlyTransactions.size()];
			String tempDate;
			monthlyTransactionsByDateArr= null;
			
			
			for(int i= 0; i<monthlyTransactions.size();i++) {
				tempDateTime= monthlyTransactions.get(i).getDate();
				tempDate = tempDateTime.substring(8,10);
				tempDateValHolder[count] = Integer.parseInt(tempDate);
				count++;
			}monthlyTransactionsByDateArr = getByDate(tempDateValHolder);
		}catch(IOException ex) {
			System.out.println(ex.toString());
		}
		return monthlyTransactionsByDateArr;
	}
	private int[] getByDate(int[] tempDateValHolder) {
		// TODO Auto-generated method stub
		int[] byDate = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
		for(int i=0; i<tempDateValHolder.length; i++) {
			switch(tempDateValHolder[i]){
			
			case 1 : byDate[0]++ ;
			break;
			case 2 : byDate[1]++;
			break;
			case 3 : byDate[2]++;
			break;
			case 4 : byDate[3]++;
			break;
			case 5 : byDate[4]++;
			break;
			case 6 : byDate[5]++;
			break;
			case 7 : byDate[6]++;
			break;
			case 8 : byDate[7]++;
			break;
			case 9 : byDate[8]++;
			break;
			case 10 : byDate[9]++;
			break;
			case 11 : byDate[10]++;
			break;
			case 12 : byDate[11]++;
			break;
			case 13 : byDate[12]++;
			break;
			case 14 : byDate[13]++;
			break;
			case 15 : byDate[14]++;
			break;
			case 16 : byDate[15]++;
			break;
			case 17 : byDate[16]++;
			break;
			case 18 : byDate[17]++;
			break;
			case 19 : byDate[18]++;
			break;
			case 20 : byDate[19]++;
			break;
			case 21 : byDate[20]++;
			break;
			case 22 : byDate[21]++;
			break;
			case 23 : byDate[22]++;
			break;
			case 24 : byDate[23]++;
			break;
			case 25: byDate[24]++;
			break;
			case 26: byDate[25]++;
			break;
			case 27: byDate[26]++;
			break;
			case 28: byDate[27]++;
			break;
			case 29: byDate[28]++;
			break;
			case 30: byDate[29]++;
			break;
			case 31: byDate[30]++;
			break;
			}
	
		}
		return byDate;
	}
	

	Date dateParser = new Date();
	String date = new SimpleDateFormat("yyyy-MM-dd").format(dateParser);
	int monthVal = Integer.parseInt(date.substring(5, 7));
	String[] dateHolder = new String[31];
	String tempDateBuilder;
	
	public String[] createDates() {
		for(int i=1; i<32;i++) {
			tempDateBuilder = "2019-" + monthVal+ "-" + i;
			dateHolder[i-1] = tempDateBuilder;
		}
		return dateHolder;
	}
}
