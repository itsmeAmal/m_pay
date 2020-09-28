package com.mobios.beet.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name="temp_profile")
@EntityListeners(AuditingEntityListener.class)

@NamedQuery(name="ProfileUpdate.updateUserRequestStatus",
query="UPDATE ProfileUpdate p SET p.requestStatus=?1 WHERE p.accNo= ?2")

public class ProfileUpdate {
	
	@Id
	@Column(name = "acc_no")
	private String accNo;
	
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
	
	@Column(name = "nominee")
	private String nominee;
	
	@Column(name = "nominee_nic")
	private String nomineeNic;
	
	@Column(name = "updated_date")
	private String updatedDate;
	
	@Column(name="request_status")
	private String requestStatus;
	
	@Column(name="pre_status")
	private int preStatus;

	@Column(name="new_status")
	private int newStatus;
	
	@Column(name="request_send_to")
	private String requestSendTo;
	
	@Column(name="notes")
	private String notes;
	
	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
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

	public String getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getRequestSendTo() {
		return requestSendTo;
	}

	public void setRequestSendTo(String requestSendTo) {
		this.requestSendTo = requestSendTo;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	public int getPreStatus() {
		return preStatus;
	}

	public void setPreStatus(int preStatus) {
		this.preStatus = preStatus;
	}

	public int getNewStatus() {
		return newStatus;
	}

	public void setNewStatus(int newStatus) {
		this.newStatus = newStatus;
	}

	
	
}
