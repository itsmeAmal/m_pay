package com.mobios.beet.repository;

import com.mobios.beet.model.ProfileDistributionN;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import javax.transaction.Transactional;
import java.util.List;


public interface ProfileDistributionNRepository extends JpaRepository<ProfileDistributionN, String> {

	List<ProfileDistributionN> findByCreatedBy(String createdBy);
	ProfileDistributionN findByMobileNumber(String mobileno);
	ProfileDistributionN findByAccountNo(String accno);
	
	@Modifying
	@Transactional
	//void updateUserInfo(String mobileno, String name, String nic, String gender, String address,String accno);
	void updateUserInfo( String mobileno,String name,String nic, String gender, String address,String nominee, String nomineeNic,String statusCode,String dob, String accno);
}
