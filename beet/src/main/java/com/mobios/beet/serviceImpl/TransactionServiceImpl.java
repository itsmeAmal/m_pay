package com.mobios.beet.serviceImpl;

import com.mobios.beet.model.*;
import com.mobios.beet.repository.TransactionRepository;
import com.mobios.beet.service.TransactionService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Service
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	TransactionRepository transactionRepositoy;

	private static final Logger logger = LogManager.getLogger(TransactionServiceImpl.class);
	
	//get all transactions from 'transactions' table
	@Override
	public List<TransactionAll> findAllTransactions(){
		List<TransactionAll> allTransList = transactionRepositoy.findAll();
		
		return allTransList;		
	}

	//get transactions from 'transactions' table for a account no
	@Override
	public List<TransactionAll> findTransactionByUserAccno(String userAccNo) {
		List<TransactionAll> TransByAccno = transactionRepositoy.findByUserAccNo(userAccNo);
		
		return TransByAccno;
	}

	//get transactions from 'transactions' table for a date range
	@Override
	public List<TransactionAll> findTransactionsByDates(String date1, String date2) {
		List<TransactionAll> TransByDates = transactionRepositoy.findByDateBetween(date1, date2);
		
		return TransByDates;
	}
	
	
	@Override
	public List<TransactionAll> findTransByDatesAndUserAccNo(String date1, String date2, String userAccNo) {
		List<TransactionAll> TransByDatesAndAccno = transactionRepositoy.findByDateBetweenAndUserAccNo(date1, date2, userAccNo);
		
		return TransByDatesAndAccno;
	}



	@Override
	public TransactionAll findBytId(String tid) {
		// TODO Auto-generated method stub
		List<TransactionAll> TransByTransId = transactionRepositoy.findBytId(tid);
		TransactionAll tran = TransByTransId.get(0);
		String userAccno = TransByTransId.get(0).getUserAccNo()+"," + TransByTransId.get(1).getUserAccNo();
		tran.setUserAccNo(userAccno);
		System.out.println("transaction list by tid");
		return tran;
	}

	

	@Override
	public List<TransactionAll> searchNew(String date1,String date2, String accno, String status, String transtypeid,String amountmin,String amountmax) {
		// TODO Auto-generated method stub
		if(date1.equals("empt")) {
			date1="";
		}
		if(date2.equals("empt")) {
			date2="";
		}
		if(accno.equals("empt")) {
			accno="";
		}
		if(status.equals("empt")) {
			status="";
		}
		if(transtypeid.equals("empt")) {
			transtypeid="";
		}
		if(amountmin.equals("empt")) {
			amountmin="";
		}
		if(amountmax.equals("empt")) {
			amountmax="";
		}
		List<TransactionAll> newSearchList = transactionRepositoy.searchAll(date1,date2,accno, status, transtypeid,amountmin,amountmax);
		return newSearchList;
	}
	

	@Override
	public String SaveTransaction(TransactionAll transaction) {
		// TODO Auto-generated method stub
		
		logger.info("Transaction type: " + transaction.getTransactionTypesId() + " ----- acc no: " + transaction.getUserAccNo() + "------ description: " + transaction.getDescription());
		
		//call the create_trans_id
		String tid = transactionRepositoy.createTransactionId();
		//set the value of the object of table
		transaction.settId(tid);
		System.out.println(tid);
		
		String accnos = transaction.getUserAccNo();
		//user account no has 2 numbers credit number and debit number it split by ,
		String accnoArr[]= accnos.split(",");
		//get the o index acc no
		transaction.setUserAccNo(accnoArr[0]);
		
		transactionRepositoy.save(transaction);
		/*
		 * System.out.
		 * println("************************bum bum*******************************");
		 */
		 System.out.println(transaction); 
		
		  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		   Date date = new Date(); 
		   
		String transactionDate = formatter.format(date);
		
		
		transactionDate = transactionDate.substring(0,10);
		System.out.println(transactionDate); 
		String date1 = transactionDate.concat(" 00:00:00");
		String date2= transactionDate.concat(" 23:59:59");
		System.out.println( date1 +"   " +date2);
		
		String transactionDate2 = transactionDate.substring(0,8);
		String date3 = transactionDate2.concat("01 00:00:00");
		String date4 = transactionDate2.concat("31 23:59:59");
		System.out.println(date3 +" " + date4);
		
		boolean valid = true;
		String finalTransStaus="";
		try {
			
			//checking wallet balance rules
			String resultFromWallet = transactionRepositoy.checkWalletBalance(transaction.getUserAccNo(), Double.parseDouble(transaction.getAmount()));
			//wallet balance > 500
				if(resultFromWallet.equals("1")) {
					System.out.println("**********suffietient wallet balance**********");
					
					//checking transaction rules per transaction min and max amount	
					String resultFromMinMaxRule = transactionRepositoy.checkTransactionMinMax(transaction.getTransactionTypesId(),transaction.getAmount());
				
					//between min and max
						if(resultFromMinMaxRule.equals("1")) {
							System.out.println("**********valid transaction amount**********");
							
							//checking daily transaction amount and count
							String resultFromDailyTransRule = transactionRepositoy.checkDailyTransactionRule(transaction.getUserAccNo() ,date1, date2 ,transaction.getTransactionTypesId());
							if(resultFromDailyTransRule.equals("1")) {
								System.out.println("**********daily tasnaction rules valid**********");
								
								//checking monthly transaction mount and count
								String resultFromMonthlyTransRule = transactionRepositoy.checkMonlthyTransactionRule(transaction.getUserAccNo(), date3, date4, transaction.getTransactionTypesId());
								//if okay
								//check monthly
								if(resultFromMonthlyTransRule.equals("1")) {
									System.out.println("**********monthly tasnaction rules valid**********");
								}else if(resultFromMonthlyTransRule.equals("0")) {
									System.out.println("**********monthly tasnaction amount exceeded**********");
									valid = false;
								}else if(resultFromMonthlyTransRule.equals("2")) {
									System.out.println("**********monthly tasnaction count exceeded**********");
									valid = false;
								}
								//check daily
							}else if(resultFromDailyTransRule.equals("0")) {
								System.out.println("**********daily transaction amount exceeded**********");
								valid = false;
							}else if(resultFromDailyTransRule.equals("2")) {
								System.out.println("**********daily transaction count exceeded**********");
								valid = false;
							}
						}else if(resultFromMinMaxRule.equals("0")) {
							System.out.println("**********invalid transaction amount**********");
							valid = false;
						}else {
							System.out.println("**********wrong code**********");
							valid = false;
						}
						
					
				}else if(resultFromWallet.equals("0")) {
					System.out.println("**********insuffitient wallet balance**********");
					valid = false;
				}else {
					System.out.println("**********wrong code 2**********");
					valid = false;
				}
				
				
		if(valid ==false) {
			
			transactionRepositoy.updateTransStatus("fail", tid, transaction.getEntry());
			System.out.println(tid + "**********Recorded as a fail transaction**********");
			finalTransStaus="0";
			
				/*
				 * TransactionsSuccess transactionsSuccess = new TransactionsSuccess();
				 * storeTransSuccess(transactionsSuccess);
				 */
			
			
		}
			
		if (valid== true) {

			String resultFromUpdateWallet = transactionRepositoy.updateWallet(transaction.getUserAccNo(), transaction.getAmount(), transaction.getEntry());
				
				if(resultFromUpdateWallet.equals("1")) {
					transactionRepositoy.updateTransStatus("success", tid , transaction.getEntry());
					System.out.println(tid + "**********Recorded as a success transaction**********");
					
					
					//starting the debiting transaction itwith auto write the row in database
					System.out.println("***********************************here print print print********************");
					String debitAccno = accnoArr[1].replace(" ", "");
					
					TransactionAll debitTransaction = new TransactionAll();
					
					debitTransaction.settId(transaction.gettId());
					debitTransaction.setUserAccNo(debitAccno);
					debitTransaction.setAmount(transaction.getAmount());
					debitTransaction.setEntry("debit");
					debitTransaction.setDescription(transaction.getDescription());
					debitTransaction.setMerchantCategoryCode("0");//to do in future merchant code for the transaction shoiould be recorded.
					debitTransaction.setStatus("pending");
					debitTransaction.setTransactionTypesId(transaction.getTransactionTypesId());
					System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
					System.out.println(transaction.getDescription());
					//transactionRepositoy.save(debitTransaction);
					transactionRepositoy.save(debitTransaction);
					
					String resultFromUpdateDebitWallet = transactionRepositoy.updateWallet(debitTransaction.getUserAccNo(), debitTransaction.getAmount(), debitTransaction.getEntry());
					
						if(resultFromUpdateDebitWallet.equals("1")) {
							transactionRepositoy.updateTransStatus("success", tid, debitTransaction.getEntry());
							System.out.println("record as success debit transaction");
							finalTransStaus="1";
							
							//String resultFromUpdateTransAll = transactionRepositoy.updatetransactionInfo(transaction.getAmount(), transaction.getDate(), transaction.gettId(), transaction.getTransactionTypesId());
							
							
							//to update transaction success table
							TransactionsSuccess transactionsSuccess = new TransactionsSuccess();
							
							System.out.println(" here print credit user account");
							System.out.println(transaction.getUserAccNo());
							
							//transactionsSuccess.setId(transaction.getId());
							transactionsSuccess.setTranId(transaction.gettId());
							transactionsSuccess.setTransactionType(transaction.getTransactionTypesId());
							transactionsSuccess.setAmount(transaction.getAmount());
							transactionsSuccess.setDate(transaction.getDate());
							transactionsSuccess.setAccountFrom(transaction.getUserAccNo());
							transactionsSuccess.setAccountTo(debitAccno);
							transactionsSuccess.setFees(0);
							transactionsSuccess.setDiscount(0);
							transactionsSuccess.setTaxes(0);
							transactionsSuccess.setPointsEarned(0);
							transactionsSuccess.setMerchantCode(0);
							//save all details in Transaction success table using transactionsSuccess object
							transactionRepositoy.save(transactionsSuccess);
							
							
							// fee calculate
							
							FeesRules feesRules = new FeesRules();
							
							int transactionTypesId = Integer.parseInt(transactionsSuccess.getTransactionType());
							int transactionId = Integer.parseInt(transactionsSuccess.getTranId());
							
							System.out.println(transactionTypesId);
							System.out.println(transactionId);
							
							feesRules.setTransactionTypesId(transactionTypesId);
							
							System.out.println(transactionTypesId);
							
							Fees fees = new Fees();
							String resultsFromUpdateTransSuccess = transactionRepositoy.checkFeesRules(feesRules.getTransactionTypesId(),Double.parseDouble(transactionsSuccess.getAmount()));
							System.out.println(feesRules.getMaxAmount()+","+ feesRules.getMinAmount());
							System.out.println("+++++++++++++++++++++++++++++++"+resultsFromUpdateTransSuccess);
							
							
							
							//error is in here 
							if (resultsFromUpdateTransSuccess.substring(0,1).equals("0")) {
								
							/* System.out.println("out of repository save"); */
								
								fees.setTransactionId(transactionId);
							/* System.out.println("details "); */
								fees.setTransactionTypeId(feesRules.getTransactionTypesId());
								fees.setFeesAmount(Double.parseDouble(resultsFromUpdateTransSuccess.substring(1)));
							/* System.out.println(fees.getFeesAmount()); */
								
								transactionRepositoy.save(fees);
							
							}	
							else{
								
								System.out.println("empty value ");
								
								double feeRate= Double.parseDouble(resultsFromUpdateTransSuccess.substring(1));
								
								System.out.println(resultsFromUpdateTransSuccess.substring(1) +","+ feeRate);
								fees.setTransactionId(transactionId);
								fees.setTransactionTypeId(feesRules.getTransactionTypesId());
								
								//calculate fee rate fee_amount = amount * fee_rate
								 fees.setFeesAmount(Double.parseDouble(transactionsSuccess.getAmount())*feeRate);
								System.out.println(fees.getFeesAmount());
								transactionRepositoy.save(fees);
								
								
								
							}
								
							//Commission Calculate
							
							CommissionRules commissionRules = new CommissionRules();
							
							int transactionTypesId2 = Integer.parseInt(transactionsSuccess.getTransactionType());
							int transactionId2 = Integer.parseInt(transactionsSuccess.getTranId());
							String userAccNo = transactionsSuccess.getAccountTo();
								
								
							commissionRules.setTransactionTypeId(transactionTypesId2);
							
							Commission commission = new Commission();
							
							String resultsFromUpdateTransSuccess2 = transactionRepositoy.checkCommissionRules(commissionRules.getTransactionTypeId(),commissionRules.getTransactionTypeId());
							 
							if (resultsFromUpdateTransSuccess2.substring(0,1).equals("0")) {
								
								/* System.out.println("out of repository save"); */
									System.out.println("Here is the value #######################################################");
								double commissionRate= Double.parseDouble(resultsFromUpdateTransSuccess2.substring(0));
								System.out.println(commissionRate);
								
								System.out.println(resultsFromUpdateTransSuccess2.substring(1) +","+ commissionRate);
								commission.setTransactionId(transactionId2);
								System.out.println(transactionId2);
								commission.setTransactionTypesId(commissionRules.getTransactionTypeId());
								System.out.println(commissionRules.getTransactionTypeId());
								
								
								//calculate fee rate fee_amount = amount * fee_rate
							
								commission.setCommissionAmount(Double.parseDouble(transactionsSuccess.getAmount())* commissionRate);
								System.out.println(fees.getFeesAmount());
								commission.setProfileAccNo(transactionsSuccess.getAccountTo());
								System.out.println(transactionsSuccess.getAccountTo());
								transactionRepositoy.save(commission);
								
								}	
								
			
							
							//save transactions in transaction success table because credit and debit paths are success, so it is a success transaction
							
						/*
						 * TransactionsSuccess transactionsSuccess = new TransactionsSuccess();
						 * storeTransSuccess(transactionsSuccess);
						 */
							
							//calCommision(transaction,debitTransaction);
						}else {
							transactionRepositoy.updateTransStatus("fail", tid, debitTransaction.getEntry());
							System.out.println("record as fail debit transaction");
							finalTransStaus="0";
						}
					
				}else {
					System.out.println("**********try again.**********");
				}
			
		}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
				
		return finalTransStaus;
	}
	
	

	//To calculate 
	void calCommision(TransactionAll creditTransaction , TransactionAll debitTransaction){
		// todo cal commissin and allocate to each user
		
		
		//String creditAccNo = creditTransaction.
		
		
	}
	
	
	
	
}
