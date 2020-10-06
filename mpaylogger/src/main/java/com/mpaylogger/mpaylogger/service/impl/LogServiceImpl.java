package com.mpaylogger.mpaylogger.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mpaylogger.mpaylogger.model.Log;
import com.mpaylogger.mpaylogger.repository.LogRepositories;
import com.mpaylogger.mpaylogger.service.LogServiceDao;

public class LogServiceImpl implements LogServiceDao
{

	@Autowired
	private LogRepositories LogRepositories;
	
	@Override
	public List<Log> GetAllLogs() {
		List<Log> LogList = LogRepositories.findAll();
		return LogList;
	}

	@Override
	public Log AddLog(Log Log) {
		LogRepositories.save(Log);
		return Log;
	}

	@Override
	public Log UpdateLog(Log Log) {
		if(Log.getId() != 0) {
			LogRepositories.save(Log);			
		}
		return Log;
	}

	@Override
	public Log DeleteLog(int LogId) {
		LogRepositories.deleteById(LogId);
		return LogRepositories.getOne(LogId); 
	}

	@Override
	public Log GetLogByLogId(int LogId) {
		return LogRepositories.getOne(LogId); 
	}
	
}
