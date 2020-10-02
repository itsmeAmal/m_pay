package com.mobios.beet.repository;

import com.mobios.beet.model.FeesRules;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import javax.transaction.Transactional;

public interface FeesRulesRepository extends JpaRepository<FeesRules, Integer> {

	//update table for fee
	/*@Modifying
	@Transactional
	void updateFeesRates(double feeRate,double fee,int transtypesid, double minamount,double maxamount);*/
	
	FeesRules getFees(int transtypesid, double minamount,double maxamount);

	//update fee category table for new fee rules 
	@Modifying
	@Transactional
	void updateFeeInfo(double feeRate, double fee, int transtype, double minamount, double maxamount);
	
	
	/*
	//temp
	@Modifying
	@Transactional
	void updateFeeInfo(double feeRate, double fee, int transtype);
*/
	
	
}
