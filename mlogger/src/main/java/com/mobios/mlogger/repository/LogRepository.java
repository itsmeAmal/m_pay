package com.mobios.mlogger.repository;

import com.mobios.mlogger.model.Logger;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

@Repository
public interface LogRepository extends JpaRepository<Logger, Integer> {
}
