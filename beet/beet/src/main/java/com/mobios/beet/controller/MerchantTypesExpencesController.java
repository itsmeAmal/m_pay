package com.mobios.beet.controller;

import com.mobios.beet.model.MerchantTypes;
import com.mobios.beet.repository.MerchantTypesExpencesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/beet")
@CrossOrigin(origins = "localhost", maxAge = 3600)
public class MerchantTypesExpencesController {

	@Autowired
    MerchantTypesExpencesRepository merchantTypesExpencesRepository ;
	
	@GetMapping("/merchanttypesexpencescount/{accno}")
	public List<MerchantTypes> getMerchantTypesExpencesCount(@PathVariable(value="accno") String accountno){
		System.out.println("Merchant Types Expences");
		
		  List<MerchantTypes> merchantTypeExpencesCount = merchantTypesExpencesRepository .getExpencesCount(accountno);
		return merchantTypeExpencesCount;
	}
}
