package com.mobios.beet.repository;

import com.mobios.beet.model.CommissionUpdate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import javax.transaction.Transactional;

public interface CommissionUpdateRepository extends JpaRepository<CommissionUpdate, String> {
		
	@Modifying
	@Transactional
	void updateRequestStatus( String requestStatus, int usertypeid , int transtypeid ) ;

}
