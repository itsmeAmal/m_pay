package com.mobios.beet.repository;

import com.mobios.beet.model.MerchantTypes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MerchantTypesExpencesRepository extends JpaRepository<MerchantTypes,Integer> {
	
	@Query(value = "{call getMerchantTypesCount(:accountno)}" , nativeQuery = true)
	List<MerchantTypes> getExpencesCount(@Param("accountno") String accountno);
	

}
