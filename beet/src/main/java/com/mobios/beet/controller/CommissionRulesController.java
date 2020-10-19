package com.mobios.beet.controller;

import com.mobios.beet.model.CommissionRules;
import com.mobios.beet.service.CommissionRulesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/beet")
@CrossOrigin(origins = "localhost", maxAge = 3600)
public class CommissionRulesController {

	@Autowired
    CommissionRulesService commissionRulesService;
	
	
	//find list of all user comission rates by trans type id
	@GetMapping("/getCommissionsrules/{transactionTypeId}")
	public List<CommissionRules> getCommissionRatesByTransTypeId(@PathVariable(value = "transactionTypeId") int transactionTypeId) {
		List<CommissionRules> CommissionRatesByTransTypeId = commissionRulesService.findBytransactionTypeId(transactionTypeId);
		return CommissionRatesByTransTypeId;		
	}		
	
	//update commission rules for each trans type id and user type id
	@PutMapping("/updateCommission/{rate}/{usertypeid}/{transtypeid}")
	public String updateCommissionRules(@PathVariable(value="rate") double rate, @PathVariable(value="usertypeid") int usertypeid , @PathVariable(value="transtypeid") int transtypeid ) {
		System.out.println(usertypeid + "Con");
		return commissionRulesService.updateCommissionRules(rate, usertypeid , transtypeid );
	}
	
	//update the original commission rules after the system 
	@PutMapping("/commissionupdateOriginal/{usertypeid}/{transtypeid}")
	public String updateCommissionInfo(@RequestBody CommissionRules commissionrules , @PathVariable(value="usertypeid") int usertypeid , @PathVariable(value="transtypeid") int transtypeid) {
	System.out.println("-------Commission updating put function-------");
	return commissionRulesService.updateCommissionInformation(commissionrules , usertypeid , transtypeid);
	}
		
}
