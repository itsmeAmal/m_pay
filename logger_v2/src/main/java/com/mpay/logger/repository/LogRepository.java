package com.mpay.logger.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mpay.logger.model.Logger;

public interface LogRepository extends JpaRepository<Logger, Integer>{

}
