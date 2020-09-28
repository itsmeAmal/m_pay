package com.caller.components;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.caller.Callers;
import com.caller.TransactionSuccess;

public class BarChartForMonthlyTrans {

	int[] AllTransByDate = new int[31];

	public int[] createAllTransBarChartByDate(String date1 , String date2) {
		
		try {

			Callers callobj = new Callers();
			List<TransactionSuccess> monthlyTransactions = callobj.getMonthly(date1, date2);
			int[] tempTransByDateHolder = new int[19];
			int count=0;
			 
			for(int i=0; i<monthlyTransactions.size();i++) {
				
			}
			
		}catch(IOException ex){
			System.out.println(ex.toString());
		}
		return null;
	}

}
