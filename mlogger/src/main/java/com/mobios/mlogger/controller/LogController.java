package com.mobios.mlogger.controller;

import com.mobios.mlogger.dto.LoggerDTO;
import com.mobios.mlogger.model.Logger;
import com.mobios.mlogger.response.ResponseMessage;
import com.mobios.mlogger.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

@RestController
@RequestMapping("/log")
@CrossOrigin(origins = "*")
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
        return logService.InsertLogger(loggerDTO);
    }

    @GetMapping("/GetAll")
    public List<Logger> GetAllLogs()
    {
        return logService.GetAllLogs();
    }
    
    @GetMapping("/getbydaterange/{fromdate}/{todate}") 
    public List<Logger> GetLogsByDateRange(@PathVariable(value = "fromdate") Date fromdate,@PathVariable(value = "todate") Date todate)
    {
    	return logService.GetLogsByDateRange(fromdate, todate);   	
    } 
}
