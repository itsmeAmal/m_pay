package com.mobios.beet.controller;

import com.mobios.beet.model.CommissionUpdate;
import com.mobios.beet.service.CommissionUpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/beet")
@CrossOrigin(origins = "localhost", maxAge = 3600)
public class CommissionUpdateController {
	
	@Autowired
	CommissionUpdateService commissionUpdateService;
	
	//save fees updates in the temp_fees table
	@PostMapping("/commissionUpdate")
	public String saveCommissionUpdates(@RequestBody CommissionUpdate commission) {
		return commissionUpdateService.saveCommissionDetails(commission);
	}
	
	//updating the request status of table CommissionUpdate not applied set as applied
		@PutMapping("/commissionstatusupdates/{usertypeid}/{transtypeid}")
		public String updateRequestStatus(@RequestBody CommissionUpdate commission , @PathVariable(value = "usertypeid") int usertypeid , @PathVariable(value = "transtypeid") int transtypeid) {
			return commissionUpdateService.updateRequestStatus(commission, usertypeid ,  transtypeid );
		}
		
		//shedule time update
		@PutMapping("/commissionstatusupdate/{scheduletime}")
		public String updaterequestStatus(@RequestBody CommissionUpdate commission , @PathVariable(value = "scheduletime") String scheduletime ) {
			return commissionUpdateService.updateApplyByDate(commission, scheduletime);
		}
	

}
