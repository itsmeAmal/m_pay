package com.caller.components;

import java.io.IOException;
import java.util.List;

import com.caller.Callers;
import com.caller.TransactionSuccess;

public class AllTransactionsSummaryByMonthController {
	
int[] allTransByDateArr= new int[12];
String tempDateTime=null;
String tempMonth= null;
int count=0;

	public int[] createAllTransByMonth() {
		
		try {
			Callers callobj = new Callers();
			List<TransactionSuccess> allTransactions = callobj.getAllDetails();
			int[] tempMonthValHolder =  new int[allTransactions.size()];
			String tempDate;
			
			for(int i= 0; i<allTransactions.size();i++) {
				tempDateTime= allTransactions.get(i).getDate();
				tempMonth = tempDateTime.substring(5,7);
				tempMonthValHolder[count] = Integer.parseInt(tempMonth);
				count++;
			}allTransByDateArr = getByMonth(tempMonthValHolder);
		}catch(IOException ex) {
			System.out.println(ex.toString());
		}
		return allTransByDateArr;
	}
	
	public int[] createAllTransByMonthByAccNo(String accno) {
		
		try {
			Callers callobj = new Callers();
			List<TransactionSuccess> allTransactions = callobj.getTransByAccount(accno);
			int[] tempMonthValHolder =  new int[allTransactions.size()];
			String tempDate;
			allTransByDateArr=null;
			
			for(int i= 0; i<allTransactions.size();i++) {
				tempDateTime= allTransactions.get(i).getDate();
				tempMonth = tempDateTime.substring(5,7);
				tempMonthValHolder[count] = Integer.parseInt(tempMonth);
				count++;
			}allTransByDateArr = getByMonth(tempMonthValHolder);
		}catch(IOException ex) {
			System.out.println(ex.toString());
		}
		return allTransByDateArr;
	}
	private int[] getByMonth(int[] tempMonthValHolder) {
		// TODO Auto-generated method stub
		int[] byMonth = {0,0,0,0,0,0,0,0,0,0,0,0};
		
		for(int i=0; i<tempMonthValHolder.length; i++) {
			switch(tempMonthValHolder[i]){
			
			case 1 : byMonth[0]++ ;
			break;
			case 2 : byMonth[1]++;
			break;
			case 3 : byMonth[2]++;
			break;
			case 4 : byMonth[3]++;
			break;
			case 5 : byMonth[4]++;
			break;
			case 6 : byMonth[5]++;
			break;
			case 7 : byMonth[6]++;
			break;
			case 8 : byMonth[7]++;
			break;
			case 9 : byMonth[8]++;
			break;
			case 10 : byMonth[9]++;
			break;
			case 11 : byMonth[10]++;
			break;
			case 12 : byMonth[11]++;
			break;
			
			}
	
		}
	
		return byMonth;
	}

}
