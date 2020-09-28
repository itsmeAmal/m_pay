package com.mobios.beet.serviceImpl;

import com.mobios.beet.model.ProfileDistributionN;
import com.mobios.beet.repository.ProfileDistributionNRepository;
import com.mobios.beet.service.ProfileDistributionNService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProfileDistributionNServiceImpl implements ProfileDistributionNService{

	@Autowired
    ProfileDistributionNRepository profileDistributionNRepository;

	@Override
	public List<ProfileDistributionN> findAll() {
		List<ProfileDistributionN> allProfiles = profileDistributionNRepository.findAll();
		return allProfiles;
	}

	@Override
	public List<ProfileDistributionN> findByCreatedBy(String createdBy) {
		List<ProfileDistributionN> ProfilesByCreated = profileDistributionNRepository.findByCreatedBy(createdBy);
		return ProfilesByCreated;
	}

	@Override
	public ProfileDistributionN findByMobieNumber(String mobileno) {
		ProfileDistributionN userProfile= profileDistributionNRepository.findByMobileNumber(mobileno);	
		return userProfile;
	}

	@Override
	public ProfileDistributionN findByAccNo(String accno) {
		ProfileDistributionN userProfile= profileDistributionNRepository.findByAccountNo(accno);
		System.out.println(userProfile.getAccNo());
		return userProfile;
	}

	@Override
	public String saveProfileDetails(ProfileDistributionN user) {
		profileDistributionNRepository.save(user);
		return "user details to be approved, will be send to the appropipate person";
	}

	@Override
	public String updateUserInformation(String name, String accNo) {
		//profileRepository.updateUserInfo(name, accNo);
		return "user infomration has been successfully updated.";
	}

	//update the original profile distribution table after approved the user by  account number
	@Override
	public String updateInformation(ProfileDistributionN profile, String accno) {
		String mobileno="";
		String name="";
		String nic="";
		String dob="";
		String gender="";
		String address="";
		String nominee="";
		String nomineeNic="";
		String statusCode="";
		
		if(profile.getAccNo().equals(accno)) {
				name= profile.getName();
				mobileno=profile.getMobileNumber();
				nic=profile.getNic();
				dob=profile.getDob();
				gender=profile.getGender();
				address=profile.getAddress();
				nominee= profile.getNominee();
				nomineeNic=profile.getNomineeNic();
				statusCode=profile.getStatusCode();

			profileDistributionNRepository.updateUserInfo(mobileno, name, nic, gender, address, nominee, nomineeNic, statusCode, dob,accno);
			return "user infomration has been successfully updated in put method.";
		}else {
			return "user account number does not match with the updateing information";
		}
			
		
	}

	
}
