package com.mobios.beet.repository;

import com.mobios.beet.model.CommissionRules;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import javax.transaction.Transactional;
import java.util.List;


public interface CommissionRulesRepository extends JpaRepository<CommissionRules,Integer > {

	//find all user comission rates by trans type id
	List<CommissionRules> findBytransactionTypeId(int transactionTypeId);
	
	
	//update table for fee
	@Modifying
	@Transactional
	void updateCommissionRates(double rate, int usertypeid , int transtypeid );
	
	
	//update table for fee
	@Modifying
	@Transactional
	void updateCommissionInfo(double commisionrate, int usertypeid , int transtypeid);

	
	
	
}
