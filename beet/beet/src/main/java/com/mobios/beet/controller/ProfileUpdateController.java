package com.mobios.beet.controller;

import com.mobios.beet.model.ProfileUpdate;
import com.mobios.beet.service.ProfileUpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/beet")
@CrossOrigin(origins = "localhost", maxAge = 3600)
public class ProfileUpdateController {
	
	@Autowired
	ProfileUpdateService profileUpdateService;
	
	//save details
	@PostMapping("/profileupdate")
	public String saveProfileUdates(@RequestBody ProfileUpdate user) {
		return profileUpdateService.saveProfileDetails(user);
	}
	
	@GetMapping("/profileupdates/{accno}")
	public List<ProfileUpdate> getUpddateDetailsByAccNo(@PathVariable(value="accno") String accno) {
		List<ProfileUpdate> profileUpdatesByAccno= profileUpdateService.findUpdatesByAccNo(accno);
		return profileUpdatesByAccno;
	}
	
	//update request status of the user by account number approved or not
	@PutMapping("/profilestatusupdates/{accno}")
	public String updaterequestStatus(@RequestBody ProfileUpdate profile , @PathVariable(value="accno") String accno) {
		return profileUpdateService.updateRequestStatus(profile, accno);
	}
}
