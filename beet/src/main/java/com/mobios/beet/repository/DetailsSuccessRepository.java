package com.mobios.beet.repository;

import com.mobios.beet.model.TransactionsSuccess;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DetailsSuccessRepository extends JpaRepository<TransactionsSuccess, Integer> {

	List<TransactionsSuccess> findByDateBetween(String start, String end);
	List<TransactionsSuccess> findByDateBetweenAndAccountFromOrDateBetweenAndAccountTo(String start, String end, String Accfrom, String start1, String end1, String accto);
	List<TransactionsSuccess> findByAccountFromOrAccountTo(String accfrom, String accto);
}

