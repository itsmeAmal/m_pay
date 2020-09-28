package com.mobios.beet.repository;

import com.mobios.beet.model.FeesUpdate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import javax.transaction.Transactional;

public interface FeesUpdateRepository extends JpaRepository<FeesUpdate, String> {

	@Modifying
	@Transactional
	void updateRequestStatus(String requestStatus, int transtypeid ,double  minamount , double  maxamount);
}
