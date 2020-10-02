package com.mobios.beet.repository;

import com.mobios.beet.model.Commission;
import com.mobios.beet.model.Fees;
import com.mobios.beet.model.TransactionAll;
import com.mobios.beet.model.TransactionsSuccess;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

public interface TransactionRepository extends JpaRepository<TransactionAll, Integer> {

	List<TransactionAll> findByUserAccNo(String userAccNo);
	List<TransactionAll> findByDateBetween(String start, String end);
	List<TransactionAll> findByDateBetweenAndUserAccNo(String date1, String date2, String userAccNo);
	List<TransactionAll> findBytId(String tid);
	
	@Query(value= "{call search(:date1,:date2,:accno,:status,:transtypeid,:amountmin,:amountmax)}" , nativeQuery = true)
	List<TransactionAll> searchAll(
			@Param("date1") String date1,
			@Param("date2") String date2,
			@Param("accno") String accno,
			@Param("status") String status,
			@Param("transtypeid") String transtypeid,
			@Param("amountmin") String amountmin,
			@Param("amountmax") String amountmax
			);
	
	
	@Query(value="{call check_transaction_min_max(:type, :amount )}" , nativeQuery = true)
	String checkTransactionMinMax(
			@Param("type") String type,
			@Param("amount") String amount
			);
	
	@Query(value="{call check_Wallet_Balance(:accno, :amount )}" , nativeQuery = true)
	String checkWalletBalance(
			@Param("accno") String accno,
			@Param("amount") double amount
			);
	
	@Query(value="{call check_daily_limits(:accno, :date1, :date2, :type )}" , nativeQuery = true)
	String checkDailyTransactionRule(
			@Param("accno") String accno,
			@Param("date1") String date1,
			@Param("date2") String date2,
			@Param("type") String type
			);
	
	@Query(value="{call check_monthly_limits(:accno, :date1, :date2, :type )}" , nativeQuery = true)
	String checkMonlthyTransactionRule(
			@Param("accno") String accno,
			@Param("date1") String date1,
			@Param("date2") String date2,
			@Param("type") String type
			);
	
	@Modifying
	@Transactional
	void updateTransStatus(String status, String tid,String entry);
	
	@Query(value="{call update_Wallet(:accno, :amount, :entry)}" , nativeQuery = true )
	String updateWallet(
			@Param("accno") String accno,
			@Param("amount") String amount,
			@Param("entry") String entry
			);
	
	
	//String updatetransactionSuccess(int id, String tranId, String amount);
	
	/*
	 * @Modifying
	 * 
	 * @Transactional String updatetransactionInfo(String amount, String date,String
	 * tranId , String transactionType);
	 */
	
	//to update transactions in transaction succes table
	@Modifying
	@Transactional
	void save(TransactionsSuccess transactionsSuccess);
	
	//check fees rules
	@Query(value = "{call get_fees_rules (:transtypeid, :amount)}" , nativeQuery = true)
	String checkFeesRules(@Param("transtypeid") int transtypeid, @Param("amount") double amount);
	
	//save in fees table
	@Modifying
	@Transactional
	void save(Fees fees);
	
	//auto transaction Id
	@Query(value="{call create_trans_id()}",nativeQuery = true)
	String createTransactionId();
	
	//check fees rules
	@Query(value = "{call get_commission_rules (:transtypeid, :usertypeid)}" , nativeQuery = true)
	String checkCommissionRules(@Param("transtypeid") int transtypeid, @Param("usertypeid") double usertypeid);
	
	//save in commission table
		@Modifying
		@Transactional
		void save(Commission commission);
	
	
}
