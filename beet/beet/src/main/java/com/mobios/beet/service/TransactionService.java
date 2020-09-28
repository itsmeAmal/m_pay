package com.mobios.beet.service;

import com.mobios.beet.model.TransactionAll;

import java.util.List;


public interface TransactionService  {

	List<TransactionAll> findAllTransactions();
	List<TransactionAll> findTransactionByUserAccno(String userAccNo);
	List<TransactionAll> findTransactionsByDates(String date1, String date2);
	List<TransactionAll> findTransByDatesAndUserAccNo(String date1, String date2, String userAccNo);
	TransactionAll findBytId(String tid);
	List<TransactionAll> searchNew(String date1, String date2, String accno, String status, String transtypeid,
                                   String amountmin, String amountmax);
	String SaveTransaction(TransactionAll transaction);
	

}
