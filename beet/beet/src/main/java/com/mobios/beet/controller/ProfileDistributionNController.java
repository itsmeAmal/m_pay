package com.mobios.beet.controller;

import com.mobios.beet.model.ProfileDistributionN;
import com.mobios.beet.service.ProfileDistributionNService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/beet")
@CrossOrigin(origins = "localhost", maxAge = 3600)

public class ProfileDistributionNController {

	@Autowired
    ProfileDistributionNService profileDistributionNService;
	
	//get all profile details
	@GetMapping("/allprofiles")
	public List<ProfileDistributionN> getAllProfiles() {
		List<ProfileDistributionN> allProfiles = profileDistributionNService.findAll();
		return allProfiles;
		
	}
	
	//get profile by created by
	@GetMapping("/profiles/{createdBy}")
	public List<ProfileDistributionN> getProfilesByCreatedby(@PathVariable(value = "createdBy") String createdBy) {
		List<ProfileDistributionN> profilesByCreatedby = profileDistributionNService.findByCreatedBy(createdBy);
		return profilesByCreatedby;
		
	}
	
	@GetMapping("/profile/{mobileno}")
	public ProfileDistributionN getUserByMobileNo(@PathVariable(value="mobileno") String mobileno) {
		ProfileDistributionN userProfile= profileDistributionNService.findByMobieNumber(mobileno);
		return userProfile;
	}
	
	@GetMapping("/profilebyaccno/{accno}")
	public ProfileDistributionN getUserByAccNo(@PathVariable(value="accno") String accno) {
		ProfileDistributionN userProfile= profileDistributionNService.findByAccNo(accno);
		System.out.println(userProfile.getAccNo());
		return userProfile;
	}
	
	@GetMapping("/profileupdateOriginal/{name}/{accno}")
    public String addUser(@PathVariable(value="name") String name, @PathVariable(value="accno") String accno)
    {
        System.out.println("-----------user updating function------------");
        return  profileDistributionNService.updateUserInformation(name, accno);
    }
	
	//update the original profile distribution table after approved the user by  account number
	@PutMapping("/profileupdateOriginal/{accno}")
	public String updateUserInfor(@PathVariable(value="accno") String accno, @RequestBody ProfileDistributionN profile) {
		System.out.print("-----------user updating put function------------");
		return profileDistributionNService.updateInformation(profile, accno);
		
	}
}
