package com.mobios.beet.service;

import com.mobios.beet.model.Wallet;

import java.util.List;

public interface WalletService {

	List<Wallet> findAll();

	List<Wallet> findWalletByAccno(String accno);

}
