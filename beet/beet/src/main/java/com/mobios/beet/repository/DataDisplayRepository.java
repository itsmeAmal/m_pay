package com.mobios.beet.repository;

import com.mobios.beet.model.DataDisplay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface DataDisplayRepository extends JpaRepository<DataDisplay,Integer> {
	
	//display data
	@Query(value = "{call DisplayTableData(:limitValue)}" , nativeQuery = true)
	List<DataDisplay> getTransaction(@Param("limitValue") int limitValue);
	
	//display data by accNo
	@Query(value = "{call DisplayTableDataByAccno(:accno,:limitValue)}",nativeQuery = true)
	List<DataDisplay> getTransactionByAccNo(@Param("accno") String accno, @Param("limitValue") int limitValue);

}
