package com.mobios.beet.repository;

import com.mobios.beet.model.ProfileSubscriber;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

public interface ProfileSubscriberRepository extends JpaRepository<ProfileSubscriber, String> {
	
	List<ProfileSubscriber> findBysCreatedBy(String sCreatedBy);
	
	//for registration
	ProfileSubscriber getDetails(String mobileNo);

	//get user by pan
	ProfileSubscriber getPanDetails(String panNo);
	
	@Query(value="{call createAccountNumber(:profiletypeid)}",nativeQuery = true)
	String createAccountNumber(@Param("profiletypeid") String profieltypeid);
	
	@Query(value="{call createWallet(:accno)}",nativeQuery = true)
	String createWallet(@Param("accno") String accno);
	
	String getOTPForMobileNO(String mobileNo);
	
	//otp status update
	@Modifying
	@Transactional
	void updateOTPVerificationStatus(String status, String mobileno);

	//profile subscriber update
	@Modifying
	@Transactional
	void updateProfileSubscriberDetails(String accno, String name, String nic , Date dob , String gender , String address , String pin , String statuscode , String mobileno);

	@Modifying
	@Transactional
	void updateEpayProfileSubscriberDetails(String accno, String name, String nic , Date dob , String gender , String address , String pin , String statuscode , String panno, String mobileno);
	
	//update wallet id of the user in the profilesub table
	@Modifying
	@Transactional
	void updateWalletId(String walletcode , String accno);
	
	//update profileinfo including pin number
	@Modifying
	@Transactional
	void updatePinNumber(String pin , String mobileNo);
	
	//update profileAddress including address
	@Modifying
	@Transactional
	void updateAddress(String address,String mobileNo);
	
	@Modifying
	@Transactional
	void updateAddressAndPin(String address, String pin, String mobileNo);
	
	//get pin number for mobile number
	String getPINnum(String mobileNo);
	
	//update OTP when 
	@Modifying
	@Transactional
	void updateOTP(String otp,String mobileNo);
	
	String getAcountStatus(String mobileNo);
	
	List<ProfileSubscriber> findBysStatusCode(String status);

	
	//profile subscriber update with image
		@Modifying
		@Transactional
	void updateProfileSubscriberDetailsWithImg(String accno, String getsName, String getsNic, Date getsBob,
			String getsGender, String getsAddress, String pin, String getsStatusCode, String getsImgPath,
			String getsMobileNumber);
		
		
		//get wallete details
		@Query(value="{call get_wallet_details(:accNo)}",nativeQuery = true)
		String getWalletDetails(@Param("accNo") String accNo);
		
		//activate account
		@Query(value="{call activate_New_Account(:mobileno)}" , nativeQuery = true)
		String activateNewAccount(
				@Param("mobileno") String mobileNo
				);
		
}
