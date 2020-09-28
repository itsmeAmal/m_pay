package com.caller.components;

import java.io.IOException;
import java.util.List;

import com.caller.Callers;
import com.caller.TransactionSuccess;
import java.text.DecimalFormat;
public class TransactionSummaryController {


	int allTransactionCount, monthlyTransactionCount,dailyTransactionCount=0;
	double allTransactionAmount, monthlyTransactionAmount, dailyTransactionAmount=0;
	
	TransactionSummary transactionSummary = new TransactionSummary();
	TransactionSummary transactionSummaryByAccNo = new TransactionSummary();
    private static DecimalFormat df = new DecimalFormat("0.00");
    
	public TransactionSummary transactionSummaryProccesor(String date1,String date2,String date3) {
		try {
			Callers callobj = new Callers();
			List<TransactionSuccess> allTransaction = callobj.getAllDetails();
			List<TransactionSuccess> monthlyTransaction = callobj.getMonthly(date1,date2);
			List<TransactionSuccess> dailyTransaction = callobj.getDaily(date3);
			allTransactionCount=0;
			monthlyTransactionCount=0;
			dailyTransactionCount=0;
			allTransactionAmount=0;
			monthlyTransactionAmount=0;
			dailyTransactionAmount=0;
			
			for(int i=0; i<allTransaction.size();i++) {
				allTransactionAmount += allTransaction.get(i).getAmount();
			}
			allTransactionCount = allTransaction.size();
			for(int i=0;i<monthlyTransaction.size(); i++) {
				monthlyTransactionAmount += monthlyTransaction.get(i).getAmount();
			}
			monthlyTransactionCount= monthlyTransaction.size();
			for(int i=0; i<dailyTransaction.size(); i++) {
				dailyTransactionAmount+= dailyTransaction.get(i).getAmount();
			}
			dailyTransactionCount= dailyTransaction.size();
			
		}catch(IOException ex) {
			System.out.println(ex.toString());
		}
		transactionSummary.setAllTransactionCount(allTransactionCount);
		transactionSummary.setAllTransactionAmount(Double.parseDouble(df.format(allTransactionAmount)));
		transactionSummary.setMonthlyTransactionCount(monthlyTransactionCount);
		transactionSummary.setMonthlyTransactionAmount(Double.parseDouble(df.format(monthlyTransactionAmount)));
		transactionSummary.setDailyTransactionCount(dailyTransactionCount);
		transactionSummary.setDailyTransactionAmount(Double.parseDouble(df.format(dailyTransactionAmount)));
		
		return transactionSummary;
	}
	
	public TransactionSummary transactionSummaryProccesorByAccNo(String date1,String date2,String date3,String accno) {
		try {
			Callers callobj = new Callers();
			List<TransactionSuccess> allTransaction = callobj.getTransByAccount(accno);
			List<TransactionSuccess> monthlyTransaction = callobj.getTransByAccandDate(date1, date2, accno);
			List<TransactionSuccess> dailyTransaction = callobj.getDailyByAccno(accno, date3);
			allTransactionCount=0;
			monthlyTransactionCount=0;
			dailyTransactionCount=0;
			allTransactionAmount=0;
			monthlyTransactionAmount=0;
			dailyTransactionAmount=0;
			
			for(int i=0; i<allTransaction.size();i++) {
				allTransactionAmount += allTransaction.get(i).getAmount();
			}
			allTransactionCount = allTransaction.size();
			for(int i=0;i<monthlyTransaction.size(); i++) {
				monthlyTransactionAmount += monthlyTransaction.get(i).getAmount();
			}
			monthlyTransactionCount= monthlyTransaction.size();
			for(int i=0; i<dailyTransaction.size(); i++) {
				dailyTransactionAmount+= dailyTransaction.get(i).getAmount();
			}
			dailyTransactionCount= dailyTransaction.size();
			
		}catch(IOException ex) {
			System.out.println(ex.toString());
		}
		transactionSummaryByAccNo.setAllTransactionCount(allTransactionCount);
		transactionSummaryByAccNo.setAllTransactionAmount(Double.parseDouble(df.format(allTransactionAmount)));
		transactionSummaryByAccNo.setMonthlyTransactionCount(monthlyTransactionCount);
		transactionSummaryByAccNo.setMonthlyTransactionAmount(Double.parseDouble(df.format(monthlyTransactionAmount)));
		transactionSummaryByAccNo.setDailyTransactionCount(dailyTransactionCount);
		transactionSummaryByAccNo.setDailyTransactionAmount(Double.parseDouble(df.format(dailyTransactionAmount)));
		return transactionSummaryByAccNo;
	}

}
