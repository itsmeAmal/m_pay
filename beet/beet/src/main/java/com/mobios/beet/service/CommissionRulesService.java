package com.mobios.beet.service;

import com.mobios.beet.model.CommissionRules;

import java.util.List;

public interface CommissionRulesService {
	
	//find all user comission rates by trans type id
	List<CommissionRules> findBytransactionTypeId(int transactionTypeId);
	
	//for update commision table
	String updateCommissionRules(  double rate, int usertypeid , int transtypeid );
	
	//updating original commission  table
	String updateCommissionInformation(CommissionRules commissionrules, int usertypeid, int transtypeid);
}



