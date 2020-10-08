package com.mpay.logger.controller;

import java.math.BigDecimal;
import java.util.List;

import com.mpay.logger.dto.LoggerDTO;
import com.mpay.logger.response.ResponseMessage;
import com.mpay.logger.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.mpay.logger.model.Logger;
import com.mpay.logger.service.impl.LogServiceImpl;

import javax.validation.Valid;

@RestController
@RequestMapping("/log")
@CrossOrigin(origins = "localhost", maxAge = 3600)
public class LogController {
	
	@Autowired
	private LogService logService;
	 
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
	return logService.AddLogger(FromUserType, FromUserAccNo, ToUserType, ToUserAccNo, Amount, TransactionType, SuccessStatus);
	}

	@PostMapping("/insertlog")
	private ResponseMessage insertLogs(@Valid @RequestBody LoggerDTO loggerDTO)
	{
		System.out.println(loggerDTO.toString());
		return logService.InsertLogger(loggerDTO);
	}
	

	
	@GetMapping("/GetAll")
	public List<Logger> GetAllLogs(){
		return logService.GetAllLogs();
	}
}
