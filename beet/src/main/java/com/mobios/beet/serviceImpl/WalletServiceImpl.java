package com.mobios.beet.serviceImpl;

import com.mobios.beet.model.Wallet;
import com.mobios.beet.repository.WalletRepository;
import com.mobios.beet.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WalletServiceImpl implements WalletService{

	@Autowired
	WalletRepository walletrepository;
	
	@Override
	public List<Wallet> findAll() {
		List<Wallet> allwallets = walletrepository.findAll();
		return allwallets;
	}

	@Override
	public List<Wallet> findWalletByAccno(String accno) {
		List<Wallet> walletByAccno = walletrepository.findByAccNo(accno);
		return null;
	}

	

	
}
