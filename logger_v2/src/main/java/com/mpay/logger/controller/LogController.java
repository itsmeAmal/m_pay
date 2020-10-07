package com.mpay.logger.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mpay.logger.model.Logger;
import com.mpay.logger.service.LogService;

@RestController
@RequestMapping("/log")
@CrossOrigin(origins = "localhost", maxAge = 3600)
public class LogController {
	
	@Autowired
	private LogService LogService;
	 
	@PostMapping("/AddLog/{FromUserType}/{FromUserAccNo}/{ToUserType}/{ToUserAccNo}/{Amount}/{TransactionType}/{SuccessStatus}") 
	public Logger AddLogRecord(
			@PathVariable(value = "FromUserType") int FromUserType, 
			@PathVariable(value = "FromUserAccNo") String FromUserAccNo, 
			@PathVariable(value = "ToUserType") int ToUserType,
			@PathVariable(value = "ToUserAccNo") String ToUserAccNo, 
			@PathVariable(value = "Amount") BigDecimal Amount, 
			@PathVariable(value = "TransactionType") int TransactionType, 
			@PathVariable(value = "SuccessStatus") String SuccessStatus
			) {		
	return LogService.AddLogger(FromUserType, FromUserAccNo, ToUserType, ToUserAccNo, Amount, TransactionType, SuccessStatus);	
	}
	

	
	@GetMapping("/GetAll")
	public List<Logger> GetAllLogs(){
		return LogService.GetAllLogs();		
	}
}
