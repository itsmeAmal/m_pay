package com.mobios.beet.repository;

import com.mobios.beet.model.ProfileUpdate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import javax.transaction.Transactional;
import java.util.List;

public interface ProfileUpdateRepository extends JpaRepository<ProfileUpdate, String> {
	
	List<ProfileUpdate> findByRequestSendTo(String requestSendTo);
	
	@Modifying
	@Transactional
	void updateUserRequestStatus(String requestStatus, String accno);
}
