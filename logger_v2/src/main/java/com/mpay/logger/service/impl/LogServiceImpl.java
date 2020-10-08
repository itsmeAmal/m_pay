package com.mpay.logger.service.impl;

import java.math.BigDecimal;
import java.util.List;

import com.mpay.logger.dto.LoggerDTO;
import com.mpay.logger.response.ResponseMessage;
import com.mpay.logger.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mpay.logger.model.Logger;
import com.mpay.logger.repository.LogRepository;

@Component
public class LogServiceImpl implements LogService {
	
	@Autowired
	private LogRepository logRepository;
	
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
		logRepository.save(Log);
		return Log; 
	}
	
	public List<Logger> GetAllLogs(){
		return logRepository.findAll();
	}

	@Override
	public ResponseMessage InsertLogger(LoggerDTO loggerDTO) {

		Logger logger = null;
		ResponseMessage responseMessage = null;

		if (loggerDTO != null)
		{
			logger = new Logger(loggerDTO.getFromUserType(), loggerDTO.getFromUserAccountNo(), loggerDTO.getToUserType(), loggerDTO.getToUserAccountNo(),
					loggerDTO.getTransactionAmount(), loggerDTO.getTransactionType(), loggerDTO.getSuccessStatus());
			logRepository.save(logger);
			responseMessage = new ResponseMessage("200", "successfully save");
		}
		else
		{
			responseMessage = new ResponseMessage("500", "error");
		}
		return responseMessage;

	}
}
