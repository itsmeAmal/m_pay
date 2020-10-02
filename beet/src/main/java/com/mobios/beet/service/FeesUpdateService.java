package com.mobios.beet.service;

import com.mobios.beet.model.FeesUpdate;

public interface FeesUpdateService {

	//save  fees details in the temp_fee table
	String saveFeesDetails(FeesUpdate fees);
	/*
	 * List<FeesUpdate> findUpdates(int transtypeid, double minamount, double
	 * maxamount); String updateRequestStatus(FeesUpdate fees, int transtypeid,
	 * double minamount, double maxamount);
	 */

	//updating the request status of table FeesUpdate not applied set as applied
	String updateRequestStatus(FeesUpdate fees, int transtypeid, double minamount, double maxamount);
	
	//shedule time update
	String updateApplyByDate(FeesUpdate fees, String scheduletime);
	
}
