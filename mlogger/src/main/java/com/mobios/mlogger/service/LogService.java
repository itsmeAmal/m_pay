package com.mobios.mlogger.service;

import com.mobios.mlogger.dto.LoggerDTO;
import com.mobios.mlogger.model.Logger;
import com.mobios.mlogger.response.ResponseMessage;

import java.math.BigDecimal;
import java.util.List;

public interface LogService {
    Logger AddLogger(int FromUserType, String FromUserAccNo, int ToUserType, String ToUserAccNo,
                     BigDecimal Amount, int TransactionType, String SuccessStatus);

    List<Logger> GetAllLogs();

    ResponseMessage InsertLogger(LoggerDTO loggerDTO);
}
