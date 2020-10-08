package com.mpay.logger.service;

import com.mpay.logger.dto.LoggerDTO;
import com.mpay.logger.model.Logger;
import com.mpay.logger.response.ResponseMessage;

import java.math.BigDecimal;
import java.util.List;

public interface LogService {
    Logger AddLogger(int FromUserType, String FromUserAccNo, int ToUserType, String ToUserAccNo,
                            BigDecimal Amount, int TransactionType, String SuccessStatus);

    List<Logger> GetAllLogs();

    ResponseMessage InsertLogger(LoggerDTO loggerDTO);
}
