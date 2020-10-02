package com.mobios.beet.controller;

import com.mobios.beet.model.Wallet;
import com.mobios.beet.repository.WalletRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/beet")
@CrossOrigin(origins = "localhost", maxAge = 3600)

public class WalletController {

	@Autowired
    WalletRepository walletRepository;

	
	//get wallet details
	@GetMapping("/totalwalletdetails")
	public List<Wallet> getWalletDetails() {
		List<Wallet> walletDetails = walletRepository.findAll();
		return walletDetails;
	}
	
	//get wallet details for selected accno
		@GetMapping("/walletdetails/{accno}")
		public List<Wallet> getWalletDetailsByAccno(@PathVariable(value = "accno") String accno) {
			List<Wallet> walletDetailsByAccno = walletRepository.findByAccNo(accno);
			return walletDetailsByAccno;
		}
	
}
