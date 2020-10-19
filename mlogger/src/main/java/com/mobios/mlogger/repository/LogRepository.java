package com.mobios.mlogger.repository;

import com.mobios.mlogger.model.Logger;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LogRepository extends JpaRepository<Logger, Integer> {
	
	//List<TransactionsSuccess> findByDateBetween(String start, String end);
	List<Logger> FindByDateRange(Date FromDate, Date ToDate);
	
}
