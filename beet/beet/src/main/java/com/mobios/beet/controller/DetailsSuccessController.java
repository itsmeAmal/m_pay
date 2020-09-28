package com.mobios.beet.controller;

import com.mobios.beet.model.TransactionsSuccess;
import com.mobios.beet.service.DetailsSuccessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/beet")
@CrossOrigin(origins = "localhost", maxAge = 3600)

public class DetailsSuccessController {

	@Autowired
    DetailsSuccessService detailService;
	
	//get all details transactions
	@GetMapping("/alltransactiondetails")
	  public List<TransactionsSuccess> getDetailsAll() {
		List<TransactionsSuccess> allDetails = detailService.findAll();
		
		return allDetails; 
		  
	}
	
	//filter transactions by a datetime range
	@GetMapping("details/{date1}/{date2}")
	  public List<TransactionsSuccess> getDetailsByDates(@PathVariable(value = "date1") String date1, @PathVariable(value = "date2") String date2) {
		List<TransactionsSuccess> detailsByDates = detailService.findTransactionsByDates(date1, date2);
		
		return detailsByDates; 
		  
	}
	
	//get transactions by date range and accno
	@GetMapping("details/{date1}/{date2}/{accno}")
	  public List<TransactionsSuccess> getDetailsByDatesAndAccno(@PathVariable(value = "date1") String date1, @PathVariable(value = "date2") String date2, @PathVariable(value="accno") String accno ) {
		List<TransactionsSuccess> detailsByDatesAndAccno = detailService.getTransByAccNoAndByDate(date1, date2, accno);
		
		return detailsByDatesAndAccno; 
		  
	}
	
	//get transactions by accno
	@GetMapping("details/{accno}")
	  public List<TransactionsSuccess> getDetailsByAccno(@PathVariable(value="accno") String accno ) {
		List<TransactionsSuccess> detailsByAccno = detailService.getTransByAccNo(accno);
		
		return detailsByAccno; 
		  
	}
}
