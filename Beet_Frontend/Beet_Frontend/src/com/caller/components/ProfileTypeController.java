package com.caller.components;

import java.io.IOException;
import java.util.List;

import com.caller.Callers;
import com.caller.ProfileDistributionN;

public class ProfileTypeController {

	ProfileType userType = new ProfileType();
	ProfileType userTypeByAccno = new ProfileType();
	int superagentCount, distributorCount, agentCount, subscriberCount=0;
	
	public ProfileType userTypeProcessor() {
		try {
			Callers callobj = new Callers();
			List<ProfileDistributionN> allUsers = callobj.getAllProfileDetails();
			
			for(int i = 0; i < allUsers.size(); i++){ 
				int tempUserTypeId = allUsers.get(i).getProfileTypeCode();
				if(tempUserTypeId == 1){
					superagentCount++;
				}else if(tempUserTypeId == 2){
					distributorCount++;
				}else if(tempUserTypeId == 3){
					agentCount++;
				}else if (tempUserTypeId == 5){
					subscriberCount++;
				}
			}
			
		}catch(IOException ex) {
			System.out.println (ex.toString());
		}
		userType.setAgentCount(agentCount);
		userType.setDistributorCount(distributorCount);
		userType.setSubscriberCount(subscriberCount);
		userType.setSuperagentCount(superagentCount);
		return userType;
	}
	
	public ProfileType userTypeProcessorByAccNo(String accno) {
		
		try {
			Callers callobj = new Callers();
			List<ProfileDistributionN> allUsers = callobj.getProfileDetailsByAccount(accno);
			
			for(int i = 0; i < allUsers.size(); i++){ 
				int tempUserTypeId = allUsers.get(i).getProfileTypeCode();
				if(tempUserTypeId == 1){
					superagentCount++;
				}else if(tempUserTypeId == 2){
					distributorCount++;
				}else if(tempUserTypeId == 3){
					agentCount++;
				}else if (tempUserTypeId == 5){
					subscriberCount++;
				}
			}
			
		}catch(IOException ex) {
			System.out.println(ex.toString());
		}
		userTypeByAccno.setAgentCount(agentCount);
		userTypeByAccno.setDistributorCount(distributorCount);
		userTypeByAccno.setSubscriberCount(subscriberCount);
		userTypeByAccno.setSuperagentCount(superagentCount);
		return userTypeByAccno;
		
	}
	
}
