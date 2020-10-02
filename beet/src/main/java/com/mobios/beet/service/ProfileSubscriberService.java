package com.mobios.beet.service;

import com.mobios.beet.model.ProfileSubscriber;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface ProfileSubscriberService {
	
	List<ProfileSubscriber> findBysCreatedBy(String sCreatedBy);
	List<ProfileSubscriber> findAll();
	String getDetails(ProfileSubscriber ps);
	ProfileSubscriber saveNewUser(ProfileSubscriber profSubscriber);
	String validateOTP(ProfileSubscriber otp);
	ProfileSubscriber getUserByMobileNumber(String mobileNo);
	String updateProfileInfo(ProfileSubscriber ps);
	String validatePinNum(ProfileSubscriber ps);
	List<ProfileSubscriber> getSuspendedProfiles();
	ProfileSubscriber saveUserWithProfileImage(ProfileSubscriber pr);
	List<ProfileSubscriber> getRegistrationProfiles();
	String activateNewAccount(String mobileno);

	ResponseEntity<?> getUserByPanNumber(String panNo);
	ResponseEntity<?> registerEpayUser(ProfileSubscriber profSubscriber);
}
