package com.mobios.beet.serviceImpl;

import com.mobios.beet.model.TransactionsSuccess;
import com.mobios.beet.repository.DetailsSuccessRepository;
import com.mobios.beet.service.DetailsSuccessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DetailsSuccessServiceImpl implements DetailsSuccessService {

	@Autowired
    DetailsSuccessRepository detailsRepository;
	
	@Override
	public List<TransactionsSuccess> findTransactionsByDates(String date1, String date2) {
		date1 = date1.replace("_", " ");
		date2 = date2.replace("_", " ");
		List<TransactionsSuccess> TransByDates = detailsRepository.findByDateBetween(date1, date2);
		return TransByDates;
	}
	
	@Override
	public List<TransactionsSuccess> findAll() {
		List<TransactionsSuccess> AllTrans = detailsRepository.findAll();
		return AllTrans;
	}

	@Override
	public List<TransactionsSuccess> getTransByAccNoAndByDate(String date1, String date2, String accno) {
		date1 = date1.replace("_", " ");
		date2 = date2.replace("_", " ");
		List<TransactionsSuccess> TransByDatesAndAccno= detailsRepository.findByDateBetweenAndAccountFromOrDateBetweenAndAccountTo(date1, date2, accno, date1, date2, accno);
		return TransByDatesAndAccno;
	}

	@Override
	public List<TransactionsSuccess> getTransByAccNo(String accno) {
		List<TransactionsSuccess> TransByAccno = detailsRepository.findByAccountFromOrAccountTo(accno, accno);
		return TransByAccno;
	}

}
