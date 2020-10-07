package com.mpay.logger.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mpay.logger.model.Logger;
import com.mpay.logger.repository.LogRepository;

@Component
public class LogService {
	
	@Autowired
	private LogRepository LogRepository;
	
	public Logger AddLogger(int FromUserType, String FromUserAccNo, int ToUserType, String ToUserAccNo, 
			BigDecimal Amount, int TransactionType, String SuccessStatus) {
		Logger Log = new Logger();
		Log.setFromUserAccountNo(FromUserAccNo); 
		Log.setFromUserType(FromUserType); 
		Log.setToUserAccountNo(ToUserAccNo); 
		Log.setToUserType(ToUserType); 
		Log.setSuccessStatus(SuccessStatus);
		Log.setTransactionAmount(Amount); 
		Log.setTransactionType(TransactionType); 
		LogRepository.save(Log);
		return Log; 
	}
	
	public List<Logger> GetAllLogs(){
		return LogRepository.findAll();
	}
}
