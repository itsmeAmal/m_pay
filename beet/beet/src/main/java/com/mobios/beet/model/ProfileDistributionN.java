package com.mobios.beet.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name="profile_distribution_network")
@EntityListeners(AuditingEntityListener.class)


	@NamedQuery(name="ProfileDistributionN.findByMobileNumber",
	query="select p from ProfileDistributionN p where p.mobileNumber= ?1")
	
	@NamedQuery(name="ProfileDistributionN.findByAccountNo",
	query="select p from ProfileDistributionN p where p.accNo=?1")
	
	
	@NamedQuery(name="ProfileDistributionN.updateUserInfo",
	query="UPDATE ProfileDistributionN p SET p.mobileNumber=?1, p.name= ?2, p.nic=?3 , p.gender=?4 , p.address=?5, p.nominee=?6 , p.nomineeNic=?7 , p.statusCode=?8,  p.dob=?9 WHERE p.accNo= ?10")

public class ProfileDistributionN {

	@Id
	@Column(name = "acc_no")
	private String accNo;
	
	@Column(name = "pan_no")
	private int panNo;
	
	@Column(name = "mobile_number")
	private String mobileNumber;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "nic")
	private String nic;
	
	@Column(name = "dob")
	private String dob;
	
	@Column(name = "gender")
	private String gender;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "pin")
	private String pin;
	
	@Column(name = "nominee")
	private String nominee;
	
	@Column(name = "nominee_nic")
	private String nomineeNic;
	
	@Column(name = "created_date")
	private String createdDate;
	
	@Column(name = "super_mobile_number")
	private String superMobileNumber;
	
	@Column(name = "verification")
	private String verification;
	
	@Column(name = "wallet_code")
	private String walletCode;
	
	@Column(name = "profile_type_code")
	private int profileTypeCode;
	
	@Column(name = "status_code")
	private String statusCode;
	
	@Column(name = "uu_id")
	private String uuId;
	
	@Column(name = "created_by")
	private String createdBy;
	
//getters and setters
	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public int getPanNo() {
		return panNo;
	}

	public void setPanNo(int panNo) {
		this.panNo = panNo;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getNominee() {
		return nominee;
	}

	public void setNominee(String nominee) {
		this.nominee = nominee;
	}

	public String getNomineeNic() {
		return nomineeNic;
	}

	public void setNomineeNic(String nomineeNic) {
		this.nomineeNic = nomineeNic;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getSuperMobileNumber() {
		return superMobileNumber;
	}

	public void setSuperMobileNumber(String superMobileNumber) {
		this.superMobileNumber = superMobileNumber;
	}

	public String getVerification() {
		return verification;
	}

	public void setVerification(String verification) {
		this.verification = verification;
	}

	public String getWalletCode() {
		return walletCode;
	}

	public void setWalletCode(String walletCode) {
		this.walletCode = walletCode;
	}

	public int getProfileTypeCode() {
		return profileTypeCode;
	}

	public void setProfileTypeCode(int profileTypeCode) {
		this.profileTypeCode = profileTypeCode;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getUuId() {
		return uuId;
	}

	public void setUuId(String uuId) {
		this.uuId = uuId;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	
	//getters and setters

	
}
