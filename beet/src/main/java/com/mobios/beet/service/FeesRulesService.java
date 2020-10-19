package com.mobios.beet.service;

import com.mobios.beet.model.FeesRules;

import java.util.List;

public interface FeesRulesService 
{
	//update fee category table
	String updateFeesRulse(double feesRate, double fee, int transtype, double minamount, double maxamount);
	
	List<FeesRules> getFeesRules();
	
	FeesRules getFeesAndRates(int transtype , double minamount, double maxamount);
	
	//update original Fees table
	String updateFeesInformation(FeesRules feesrules, int transtype, double minamount, double maxamount);
		
}
