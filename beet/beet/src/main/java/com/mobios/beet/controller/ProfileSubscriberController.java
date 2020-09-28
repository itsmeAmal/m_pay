package com.mobios.beet.controller;

import com.mobios.beet.model.ProfileSubscriber;
import com.mobios.beet.service.ProfileSubscriberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/beet")
@CrossOrigin(origins = "localhost", maxAge = 3600)
public class ProfileSubscriberController {
	
	@Autowired
    ProfileSubscriberService profileSubscriberService;
	
	//get all profile details
	@GetMapping("/allsubscribers")
	public List<ProfileSubscriber> getAllSubscribers() {
		List<ProfileSubscriber> allSubscribers = profileSubscriberService.findAll();
		return allSubscribers;
		
	}
	
	//get profile by created by
	@GetMapping("/subscribers/{sCreatedBy}")
	public List<ProfileSubscriber> getSubscribersBysCreatedby(@PathVariable(value = "sCreatedBy") String sCreatedBy) {
		List<ProfileSubscriber> subscribersBysCreatedby = profileSubscriberService.findBysCreatedBy(sCreatedBy);
		return subscribersBysCreatedby;
		
	}
	//For Sign Up
	//validate mobileno
	@PostMapping("/subscribersvalidate")
	public String validateMobileNo(@RequestBody ProfileSubscriber ps) {
		
		return profileSubscriberService.getDetails(ps);
		
	}
	
	//save new user
	@PostMapping("/savenewuser")
	public ProfileSubscriber saveNewUser(@RequestBody ProfileSubscriber subscriber) {
		return profileSubscriberService.saveNewUser(subscriber);
	}
	
	//validate otp
	@PostMapping("/validateotp")
	public String validateOTP(@RequestBody ProfileSubscriber otp) {
		System.out.println("66"+ otp.getsMobileNumber()+otp.getsOtp());
		return profileSubscriberService.validateOTP(otp);
	}
	
	@PostMapping("/getsubscriber")
	public ProfileSubscriber getSubscriber(@RequestBody ProfileSubscriber ps) {
		return profileSubscriberService.getUserByMobileNumber(ps.getsMobileNumber());
		
	}

	@PostMapping("/getuserbypan")
	public ResponseEntity<?> getUserByPanNumber(@RequestBody ProfileSubscriber ps)
	{
		return profileSubscriberService.getUserByPanNumber(ps.getsPanNo());
	}

	@PostMapping("/saveepayuser")
	public ResponseEntity<?> getEpayUser(@RequestBody ProfileSubscriber ps) {
		return profileSubscriberService.registerEpayUser(ps);

	}
	
	@PostMapping("/updateprofileinfo")
	public String updateProfileInfo(@RequestBody ProfileSubscriber ps) {
		return profileSubscriberService.updateProfileInfo(ps);
	}
	
	//validate pin
	@PostMapping("/validatepin")
	public String validatePin(@RequestBody ProfileSubscriber pin) {
		System.out.println("99"+ pin.getsMobileNumber()+pin.getsPin());
		return profileSubscriberService.validatePinNum(pin);
	}
	
	//validate mobileno
	@GetMapping("/suspendedsub")
	public List<ProfileSubscriber> getSuspendedProfiles() {
		
		return profileSubscriberService.getSuspendedProfiles();
		
	}
	
	//save user with profile pic
	@PostMapping("/saveuserwithimage")
    public @ResponseBody
    ProfileSubscriber addImage(@RequestBody ProfileSubscriber pr){
		ProfileSubscriber retunrPobj=null;
    	
		/*
		ProfileSubscriber ps = new ProfileSubscriber();
		
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dOb = null;
		try {
			dOb = df.parse(dob);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ps.setsMobileNumber(mobileNo);
		ps.setsName(name);
		ps.setsNic(nic);
		ps.setsDob(dOb);
		ps.setsGender(gender);
		ps.setsAddress(address);
		
		*/
		
		if( pr.getsImgPath() == null) {
			retunrPobj= profileSubscriberService.saveNewUser(pr);
		}
		else {
			retunrPobj = profileSubscriberService.saveUserWithProfileImage(pr);
		}
    	return retunrPobj;
    }
	//activate account
	@GetMapping("/activateacc/{mobileno}")
	public String activateNewAccount( @PathVariable(value = "mobileno") String mobileNo) {
		return profileSubscriberService.activateNewAccount(mobileNo);
	}






	
}
