package com.mobios.beet.service;

import com.mobios.beet.model.TransactionsSuccess;

import java.util.List;

public interface DetailsSuccessService {

	List<TransactionsSuccess>  findTransactionsByDates(String date1,String date2);

	List<TransactionsSuccess> findAll();
	List<TransactionsSuccess> getTransByAccNoAndByDate(String startDate, String endDate, String accno);
	List<TransactionsSuccess> getTransByAccNo(String accno);
}
