package com.mobios.beet.serviceImpl;

import com.mobios.beet.model.FeesRules;
import com.mobios.beet.repository.FeesRulesRepository;
import com.mobios.beet.service.FeesRulesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeesRulesServiceImpl implements FeesRulesService {

	@Autowired
	FeesRulesRepository feesRulesRepository;

	@Override
	public List<FeesRules>  getFeesRules() {
		  List<FeesRules> allFeesList = feesRulesRepository.findAll();
		return allFeesList; 
	}

	@Override
	public FeesRules getFeesAndRates(int transtype, double minamount, double maxamount) {
		
		return feesRulesRepository.getFees(transtype, minamount, maxamount);
	}

	
	//update fee category table for new fee rules 
		@Override
		public String updateFeesRulse(double feeRate, double fee, int transtype, double minamount, double maxamount) {
			//feesRulesRepository.updateFeesRates(feeRate, fee, transtype, minamount, maxamount);
			return "fees rules for the transaction type :" + transtype + "has been successfully updated.";
		}
		
		
		//update the original profile distribution table after approved the user by  account number
		public String updateFeesInformation(FeesRules feesrules, int transtype, double minamount, double maxamount ) {
			
			  
//			System.out.println(feeRate);
//			System.out.println(fee);
			
			if((feesrules.getTransactionTypesId()==transtype) && (feesrules.getMinAmount()==minamount) && (feesrules.getMaxAmount()==maxamount)) {
				
				double feeRate=feesrules.getFeeRate();
				double fee=feesrules.getFee();
				
				System.out.println(feesrules.getFeeRate());
				System.out.println(feesrules.getFee());
				
				feesRulesRepository.updateFeeInfo(feeRate, fee, transtype, minamount, maxamount);
				return "fee information has been updated";	
			}else {
				return "mismatched";
			}
			
		}

}
