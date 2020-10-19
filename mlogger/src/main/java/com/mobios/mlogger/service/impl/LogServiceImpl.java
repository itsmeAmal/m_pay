package com.mobios.mlogger.service.impl;

import com.mobios.mlogger.dto.LoggerDTO;
import com.mobios.mlogger.model.Logger;
import com.mobios.mlogger.repository.LogRepository;
import com.mobios.mlogger.response.ResponseMessage;
import com.mobios.mlogger.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

@Service
public class LogServiceImpl implements LogService {

    @Autowired
    private LogRepository logRepository;

    public Logger AddLogger(int FromUserType, String FromUserAccNo, int ToUserType, String ToUserAccNo,
                            BigDecimal Amount, int TransactionType, String SuccessStatus) 
    {
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
    public ResponseMessage InsertLogger(LoggerDTO loggerDTO) 
    { 
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

	@Override
	public List<Logger> GetLogsByDateRange(Date Fromdate, Date ToDate) {
		return logRepository.FindByDateRange(Fromdate, ToDate);
		
	}
}
