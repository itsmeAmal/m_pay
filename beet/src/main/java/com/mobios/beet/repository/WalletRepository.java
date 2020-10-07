package com.mobios.beet.repository;

import com.mobios.beet.model.Wallet;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface WalletRepository extends JpaRepository<Wallet, Integer> {

	List<Wallet> findByAccNo(String accno);
	String getWalletId(String accno);

	Wallet findById(String walletId);
}
