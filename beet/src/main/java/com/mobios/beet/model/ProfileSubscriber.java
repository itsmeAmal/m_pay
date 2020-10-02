package com.mobios.beet.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
@Table(name="profile_subscriber")
@EntityListeners(AuditingEntityListener.class)

//get user from mobile number exist or not
@NamedQuery(name="ProfileSubscriber.getDetails",
query = "select ps from ProfileSubscriber ps where ps.sMobileNumber=?1 ")

//get user from mobile number exist or not
@NamedQuery(name="ProfileSubscriber.getPanDetails",
query = "select ps from ProfileSubscriber ps where ps.sPanNo=?1 ")

//get otp for mobile number to verify
@NamedQuery(name="ProfileSubscriber.getOTPForMobileNO",
query="select o.sOtp from ProfileSubscriber o WHERE o.sMobileNumber= ?1")

//update otp status from requested to verified
@NamedQuery(name="ProfileSubscriber.updateOTPVerificationStatus",
query="UPDATE ProfileSubscriber ps SET ps.sStatus=?1  WHERE ps.sMobileNumber=?2"
)

//update profile subscriber
@NamedQuery(name="ProfileSubscriber.updateProfileSubscriberDetails",
query="UPDATE ProfileSubscriber ps SET ps.sAccNo=?1 , ps.sName=?2 ,ps.sNic=?3 , ps.sDob=?4 , ps.sGender=?5 , ps.sAddress=?6 , ps.sPin=?7 , ps.sStatusCode=?8  WHERE ps.sMobileNumber=?9"
)

//update epay profile subscriber
@NamedQuery(name="ProfileSubscriber.updateEpayProfileSubscriberDetails",
		query="UPDATE ProfileSubscriber ps SET ps.sAccNo=?1 , ps.sName=?2 ,ps.sNic=?3 , ps.sDob=?4 , ps.sGender=?5 , ps.sAddress=?6 , ps.sPin=?7 , ps.sStatusCode=?8, ps.sPanNo=?9 WHERE ps.sMobileNumber=?10"
)

//update Profile Subscriber with image
@NamedQuery(name="ProfileSubscriber.updateProfileSubscriberDetailsWithImg",
query="UPDATE ProfileSubscriber ps SET ps.sAccNo=?1 , ps.sName=?2 ,ps.sNic=?3 , ps.sDob=?4 , ps.sGender=?5 , ps.sAddress=?6 , ps.sPin=?7 , ps.sStatusCode=?8, ps.sImgPath =?9  WHERE ps.sMobileNumber=?10"
)

//update wallet id in 
@NamedQuery(name = "ProfileSubscriber.updateWalletId",
query = "UPDATE ProfileSubscriber ps SET ps.sWalletCode=?1 where ps.sAccNo=?2")

//update user information (only pin number)
@NamedQuery(name = "ProfileSubscriber.updatePinNumber",
query = "UPDATE ProfileSubscriber ps SET ps.sPin=?1 where ps.sMobileNumber=?2")

//update user information (only address)
@NamedQuery(name = "ProfileSubscriber.updateAddress",
query = "UPDATE ProfileSubscriber ps SET ps.sAddress=?1 where ps.sMobileNumber=?2")

//update user information (both address and pin number)
@NamedQuery(name = "ProfileSubscriber.updateAddressAndPin",
query = "UPDATE ProfileSubscriber ps SET ps.sAddress=?1, ps.sPin=?2 where ps.sMobileNumber=?3")

//get pin number from mobile no
@NamedQuery(name="ProfileSubscriber.getPINnum" , query="select sPin from ProfileSubscriber where sMobileNumber=?1")

//update OTP
@NamedQuery(name = "ProfileSubscriber.updateOTP",
query = "UPDATE ProfileSubscriber ps SET ps.sOtp=?1 where ps.sMobileNumber=?2")

//get status code of the account
@NamedQuery(name = "ProfileSubscriber.getAcountStatus", query="select sStatusCode from ProfileSubscriber where sMobileNumber=?1")

public class ProfileSubscriber {



	@Column(name = "s_acc_no")
	private String sAccNo;


	@Column(name = "s_pan_no")
	private String sPanNo;
	
	@Id

	@Column(name = "s_mobile_number")
	private String sMobileNumber;


	@Column(name = "s_name")
	private String sName;


	@Column(name = "s_nic")
	private String sNic;


	@Column(name = "s_dob")
	private Date sDob;


	@Column(name = "s_gender")
	private String sGender;


	@Column(name = "s_address")
	private String sAddress;
	
	@Column(name = "s_pin")
	private String sPin;
	
	@Column(name = "s_nominee")
	private String sNominee;
	
	@Column(name = "s_nominee_nic")
	private String sNomineeNic;
	
	@Column(name = "s_created_date")
	private String sCreatedDate;
	
	@Column(name = "s_super_mobile_number")
	private String sSuperMobileNumber;
	
	@Column(name = "s_verification")
	private String sVerification;
	
	@Column(name = "s_wallet_code")
	private String sWalletCode;
	
	@Column(name = "s_status_code")
	private String sStatusCode;
	
	@Column(name = "s_membership_type_code")
	private String sMembershipTypeCode;
	
	@Column(name = "s_uu_id")
	private String sUuId;
	
	@Column(name = "s_created_by")
	private String sCreatedBy;
	
	@Column(name = "s_otp")
	private String sOtp;
	
	@Column(name = "s_status")
	private String sStatus;
	
	@Column(name = "s_count")
	private String sCount;
	
	
	@Column(name = "s_img_path")
	private String sImgPath;
	
	//getters and setters
	public String getsAccNo() {
		return sAccNo;
	}

	public void setsAccNo(String sAccNo) {
		this.sAccNo = sAccNo;
	}

	public String getsPanNo() {
		return sPanNo;
	}

	public void setsPanNo(String sPanNo) {
		this.sPanNo = sPanNo;
	}

	public String getsMobileNumber() {
		return sMobileNumber;
	}

	public void setsMobileNumber(String sMobileNumber) {
		this.sMobileNumber = sMobileNumber;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsNic() {
		return sNic;
	}

	public void setsNic(String sNic) {
		this.sNic = sNic;
	}

	public Date getsDob() {
		return sDob;
	}

	public void setsDob(Date sDob) {
		this.sDob = sDob;
	}

	public String getsGender() {
		return sGender;
	}

	public void setsGender(String sGender) {
		this.sGender = sGender;
	}

	public String getsAddress() {
		return sAddress;
	}

	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}

	public String getsPin() {
		return sPin;
	}

	public void setsPin(String sPin) {
		this.sPin = sPin;
	}

	public String getsNominee() {
		return sNominee;
	}

	public void setsNominee(String sNominee) {
		this.sNominee = sNominee;
	}

	public String getsNomineeNic() {
		return sNomineeNic;
	}

	public void setsNomineeNic(String sNomineeNic) {
		this.sNomineeNic = sNomineeNic;
	}

	public String getsCreatedDate() {
		return sCreatedDate;
	}

	public void setsCreatedDate(String sCreatedDate) {
		this.sCreatedDate = sCreatedDate;
	}

	public String getsSuperMobileNumber() {
		return sSuperMobileNumber;
	}

	public void setsSuperMobileNumber(String sSuperMobileNumber) {
		this.sSuperMobileNumber = sSuperMobileNumber;
	}

	public String getsVerification() {
		return sVerification;
	}

	public void setsVerification(String sVerification) {
		this.sVerification = sVerification;
	}

	public String getsWalletCode() {
		return sWalletCode;
	}

	public void setsWalletCode(String sWalletCode) {
		this.sWalletCode = sWalletCode;
	}

	public String getsStatusCode() {
		return sStatusCode;
	}

	public void setsStatusCode(String sStatusCode) {
		this.sStatusCode = sStatusCode;
	}

	public String getsMembershipTypeCode() {
		return sMembershipTypeCode;
	}

	public void setsMembershipTypeCode(String sMembershipTypeCode) {
		this.sMembershipTypeCode = sMembershipTypeCode;
	}

	public String getsUuId() {
		return sUuId;
	}

	public void setsUuId(String sUuId) {
		this.sUuId = sUuId;
	}

	public String getsCreatedBy() {
		return sCreatedBy;
	}

	public void setsCreatedBy(String sCreatedBy) {
		this.sCreatedBy = sCreatedBy;
	}

	public String getsOtp() {
		return sOtp;
	}

	public void setsOtp(String sOtp) {
		this.sOtp = sOtp;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	public String getsCount() {
		return sCount;
	}

	public void setsCount(String sCount) {
		this.sCount = sCount;
	}

	public String getsImgPath() {
		return sImgPath;
	}

	public void setsImgPath(String sImgPath) {
		this.sImgPath = sImgPath;
	}


	//getters and setters
	
}
