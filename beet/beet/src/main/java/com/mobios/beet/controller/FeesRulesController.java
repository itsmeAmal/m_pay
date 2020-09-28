package com.mobios.beet.controller;

import com.mobios.beet.model.FeesRules;
import com.mobios.beet.service.FeesRulesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/beet")
@CrossOrigin(origins = "localhost", maxAge = 3600)
public class FeesRulesController {

	@Autowired
    FeesRulesService feesRulesService;
	
	
	//get fee rules
	@GetMapping("/getfeesrules/{transtypeid}/{minamount}/{maxamount}")
	public FeesRules getFeesRules(@PathVariable(value="transtypeid") int transtypeid , @PathVariable(value="minamount") double minamount ,
                                  @PathVariable("maxamount") double maxamount ) {
		return feesRulesService.getFeesAndRates(transtypeid, minamount, maxamount);
	}
	
	
	//update fee rules according to the trans type and its min and max amount
	@PutMapping("/feesrules/{feesrates}/{fees}/{transtypeid}/{minamount}/{maxamount}")
	public String updateFeesRules(@PathVariable(value="feesrates") double feeRate , @PathVariable(value = "fees") double fee,
                                  @PathVariable(value="transtypeid") int transtypeid , @PathVariable(value="minamount") double minamount ,
                                  @PathVariable("maxamount") double maxamount ) {
		return feesRulesService.updateFeesRulse(feeRate, fee, transtypeid, minamount, maxamount);
	}
	
	
	//update the original fee rules table after approved the user by type and amount limitations after the selected time applied
	@PutMapping("/feeupdateOriginal/{transtypeid}/{minamount}/{maxamount}")
	public String updateFeeInfo(@RequestBody FeesRules feesrules , @PathVariable(value="transtypeid") int transtypeid , @PathVariable(value="minamount") double minamount ,
                                @PathVariable("maxamount") double maxamount) {
		System.out.println("-------fee updating put function-------");
		return feesRulesService.updateFeesInformation(feesrules, transtypeid, minamount, maxamount);
	}
	

	
}
