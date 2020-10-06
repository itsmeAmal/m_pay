package com.mpaylogger.mpaylogger.service;

import java.util.List;

import com.mpaylogger.mpaylogger.model.Log;

public interface LogServiceDao 
{

	public List<Log> GetAllLogs();
	
	public Log AddLog(Log Log); 
	
	public Log UpdateLog(Log Log);
	
	public Log DeleteLog(int LogId);
	
	public Log GetLogByLogId(int LogId); 
	
}
