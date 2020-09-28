package com.mobios.beet.controller;

import com.mobios.beet.model.DataDisplay;
import com.mobios.beet.repository.DataDisplayRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/beet")
@CrossOrigin(origins = "localhost", maxAge = 3600)
public class DataDisplayController  {
	
	@Autowired
    DataDisplayRepository dataDisplayRepository;
	
	//data display
	@GetMapping("/datadisplay/{limit}")
	public List<DataDisplay> getTransactionByLimit(@PathVariable(value="limit") int limitValue){
		System.out.println("trans id list");
		List<DataDisplay> transactionByLimitValue = dataDisplayRepository.getTransaction(limitValue);
		return transactionByLimitValue;
	}
	
	//data display by accNo
	@GetMapping("/datadisplaybyaccno/{accno}/{limit}")
	public List<DataDisplay> getTransByLimitandAccno(@PathVariable(value = "accno") String accno, @PathVariable(value = "limit")int limit){
		List<DataDisplay> transByLimitandAccno = dataDisplayRepository.getTransactionByAccNo(accno, limit);
		return transByLimitandAccno;		
	}

}
