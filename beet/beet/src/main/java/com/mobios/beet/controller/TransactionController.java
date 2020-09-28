package com.mobios.beet.controller;

import com.mobios.beet.model.TransactionAll;
import com.mobios.beet.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/beet")
@CrossOrigin(origins = "localhost", maxAge = 3600)

public class TransactionController {

	@Autowired
	TransactionService transactionService;
	
	//get all transactions records
	@GetMapping("/alltransactions")
	public List<TransactionAll> getAllTransactions() {
		
		List<TransactionAll> transactionList = transactionService.findAllTransactions();
		
		return transactionList;
	}
	
	//filter transactions by user account no
	@GetMapping("transactions/{userAccNo}")
	public List<TransactionAll> getTransactionsbyUser(@PathVariable(value = "userAccNo") String userAccNo) {
		
		List<TransactionAll> transactionsByUser = transactionService.findTransactionByUserAccno(userAccNo);
		
		return transactionsByUser ;
	}
	
	//filter transactions by a datetime range
	@GetMapping("transactions/{date1}/{date2}")
	public List<TransactionAll> getTransBydates(@PathVariable(value = "date1") String date1, @PathVariable(value = "date2") String date2) {
				   
		List<TransactionAll> transactionsByDates = transactionService.findTransactionsByDates(date1, date2);
		return transactionsByDates;
	}
	
	//filter transactions by a datetime range and accno
	@GetMapping("transactions/{date1}/{date2}/{accno}")
	public List<TransactionAll> getTransBydatesAndAccno(@PathVariable(value = "date1") String date1, @PathVariable(value = "date2") String date2, @PathVariable(value = "accno") String accno){
				   
		List<TransactionAll> transactionsByDatesAndAccno = transactionService.findTransByDatesAndUserAccNo(date1, date2, accno);
		return transactionsByDatesAndAccno;
	}
	
	//filter transactions by a all parameters
		@GetMapping("transactions/{date1}/{date2}/{accno}/{status}/{transtypeid}/{amountmin}/{amountmax}")
		public List<TransactionAll> search(@PathVariable(value = "date1") String date1, @PathVariable(value = "date2") String date2, @PathVariable(value = "accno") String accno, @PathVariable(value="status") String status , @PathVariable(value="transtypeid") String transtypeid, @PathVariable(value = "amountmin") String amountmin , @PathVariable(value="amountmax") String amountmax){
					   
			List<TransactionAll> transactionsByDatesAndAccno = transactionService.searchNew(date1, date2, accno,status ,transtypeid,amountmin,amountmax);
			System.out.println("serch controller working");
			return transactionsByDatesAndAccno;
		}
		
		@GetMapping("transactionsbyid/{tid}")
		public TransactionAll getTransactionBytId(@PathVariable(value="tid") String tid){
			System.out.println("trans id list");
			TransactionAll transactionByTid = transactionService.findBytId(tid);
			return transactionByTid;
		}
		
	/*
	 * @GetMapping("transactionslimit/{limit}") public List<DataDisplay>
	 * getTransactionByLimit(@PathVariable (value="limit") int limitValue){
	 * System.out.println("trans id list"); List<DataDisplay>
	 * transactionByLimitValue = transactionService.getTransaction(limitValue);
	 * return transactionByLimitValue; }
	 */
		
		@PostMapping("/transave")
		public String saveNewTransaction(@RequestBody TransactionAll transaction) {
			
			return transactionService.SaveTransaction(transaction);
		}
		
}
