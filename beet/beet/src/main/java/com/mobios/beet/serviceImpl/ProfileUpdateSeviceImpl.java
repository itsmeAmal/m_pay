package com.mobios.beet.serviceImpl;

import com.mobios.beet.model.ProfileUpdate;
import com.mobios.beet.repository.ProfileUpdateRepository;
import com.mobios.beet.service.ProfileUpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProfileUpdateSeviceImpl implements ProfileUpdateService{
	@Autowired
	ProfileUpdateRepository profileUpdateRepo;
	
	@Override
	public String saveProfileDetails(ProfileUpdate user) {
		profileUpdateRepo.save(user);
		return "user details to be approved, will be send to the appropipate person";
	}

	@Override
	public List<ProfileUpdate> findUpdatesByAccNo(String accno) {
		List<ProfileUpdate> profileUpdatesByaccNo= profileUpdateRepo.findByRequestSendTo(accno);
		return profileUpdatesByaccNo;
	}

	//Approved or rejected
	@Override
	public String updateRequestStatus(ProfileUpdate profile, String accno) {
		
		String requestStatus =profile.getRequestStatus();
		profileUpdateRepo.updateUserRequestStatus(requestStatus, accno);
		if(requestStatus.equals("Approved")) {
			return "request of update information has bee approved.";
		}else if(requestStatus.equals("Rejected")) {
			return "request of update information has bee rejected.";
		}else {
			return "request of update information has bee ignored.";
		}
	}

	
}
