package com.mpay.logger.service;

import java.math.BigDecimal;

import org.springframework.stereotype.Component;

import com.mpay.logger.model.Logger;

@Component
public class LogService {
	
	public Logger AddLogger(int FromUserType, String FromUserAccNo, int ToUserType, String ToUserAccNo, 
			BigDecimal Amount, int TransactionType, String SuccessStatus) {
		
		return null;
	}	
}
