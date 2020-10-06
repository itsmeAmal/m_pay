package com.mpaylogger.mpaylogger.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mpaylogger.mpaylogger.model.Log;

public interface LogRepositories extends JpaRepository<Log, Integer>{

}
