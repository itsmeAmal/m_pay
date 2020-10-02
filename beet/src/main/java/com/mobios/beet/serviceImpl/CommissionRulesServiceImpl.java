package com.mobios.beet.serviceImpl;

import com.mobios.beet.model.CommissionRules;
import com.mobios.beet.repository.CommissionRulesRepository;
import com.mobios.beet.service.CommissionRulesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommissionRulesServiceImpl implements CommissionRulesService{

	@Autowired
    CommissionRulesRepository commissionRulesRepository;
	
	//find all user comission rates by trans type id
	@Override
	public List<CommissionRules> findBytransactionTypeId(int transactionTypeId) {
		List<CommissionRules> CommissionByTransType = commissionRulesRepository.findBytransactionTypeId(transactionTypeId);
		return CommissionByTransType;
	}
	
	
	//update fee category table for fee rules 
	@Override
	public String updateCommissionRules( double rate, int usertypeid , int transtypeid ) {
		System.out.println(usertypeid +"SerIMPl");
		commissionRulesRepository.updateCommissionRates( rate, usertypeid , transtypeid);
		
		return "Commission rules for the user type :" + usertypeid + ":" + transtypeid + "has been successfully updated.";
	}


	@Override
	public String updateCommissionInformation(CommissionRules commissionrules, int usertypeid, int transtypeid) {
		// TODO Auto-generated method stub
		System.out.println(commissionrules.getUserTypeId() +"|"+ usertypeid + "|"+commissionrules.getTransactionTypeId() +"|"+ transtypeid);
		if(commissionrules.getUserTypeId()== usertypeid && commissionrules.getTransactionTypeId()== transtypeid) {
			
			double rate=commissionrules.getRate();
			
			System.out.println(commissionrules.getRate());
			
			commissionRulesRepository.updateCommissionInfo(rate, usertypeid, transtypeid);
			return "Commission information has updated";
		}else {
			return "mismatched";
		}
		
	}




}
