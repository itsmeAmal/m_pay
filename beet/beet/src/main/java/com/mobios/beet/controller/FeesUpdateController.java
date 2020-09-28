package com.mobios.beet.controller;

import com.mobios.beet.model.FeesUpdate;
import com.mobios.beet.service.FeesUpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/beet")
@CrossOrigin(origins = "localhost", maxAge = 3600)
public class FeesUpdateController {

	@Autowired
	FeesUpdateService feesUpdateService;
	
	//save fees updates in the temp_fees table
	@PostMapping("/feesupdate")
	public String saveFeesUpdates(@RequestBody FeesUpdate fees) {
		return feesUpdateService.saveFeesDetails(fees);
	}
	
	//updating the request status of table FeesUpdate not applied set as applied
	@PutMapping("/feesstatusupdates/{transtypeid}/{minamount}/{maxamount}")
	public String updateRequestStatus(@RequestBody FeesUpdate fees , @PathVariable(value = "transtypeid") int transtypeid , @PathVariable(value = "minamount") double minamount , @PathVariable(value = "maxamount") double maxamount) {
		return feesUpdateService.updateRequestStatus(fees, transtypeid , minamount , maxamount );
	}
	
	//shedule time update
	@PutMapping("/profilestatusupdatez/{scheduletime}")
	public String updaterequestStatus(@RequestBody FeesUpdate fees , @PathVariable(value = "scheduletime") String scheduletime ) {
		return feesUpdateService.updateApplyByDate(fees, scheduletime);
	}
	

	
}
