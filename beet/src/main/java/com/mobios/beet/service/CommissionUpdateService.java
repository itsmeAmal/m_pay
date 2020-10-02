package com.mobios.beet.service;

import com.mobios.beet.model.CommissionUpdate;

public interface CommissionUpdateService {

	//save  fees details in the temp_fee table
		String saveCommissionDetails(CommissionUpdate commission);
	
		//updating the request status of table CommissionUpdate not applied set as applied
		String updateRequestStatus(CommissionUpdate commission, int usertypeid, int transtypeid);

		//shedule time update
		String updateApplyByDate(CommissionUpdate commission, String scheduletime);
		
}
