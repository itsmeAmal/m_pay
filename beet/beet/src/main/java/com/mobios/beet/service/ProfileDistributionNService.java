package com.mobios.beet.service;

import com.mobios.beet.model.ProfileDistributionN;

import java.util.List;

public interface ProfileDistributionNService {

	List<ProfileDistributionN> findAll();
	List<ProfileDistributionN> findByCreatedBy(String createdBy);
	ProfileDistributionN findByMobieNumber(String mobileno);
	ProfileDistributionN findByAccNo(String accno);
	String saveProfileDetails(ProfileDistributionN user);
	String updateUserInformation(String name,String accNo);
	String updateInformation(ProfileDistributionN profile ,String accno );
}
