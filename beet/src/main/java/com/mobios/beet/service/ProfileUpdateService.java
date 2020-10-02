package com.mobios.beet.service;

import com.mobios.beet.model.ProfileUpdate;

import java.util.List;

public interface ProfileUpdateService {

	String saveProfileDetails(ProfileUpdate user);
	List<ProfileUpdate> findUpdatesByAccNo(String accno);
	String updateRequestStatus(ProfileUpdate profile, String accno);
}
