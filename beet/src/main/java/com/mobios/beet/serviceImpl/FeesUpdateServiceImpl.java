package com.mobios.beet.serviceImpl;

import com.mobios.beet.model.FeesRules;
import com.mobios.beet.model.FeesUpdate;
import com.mobios.beet.repository.FeesUpdateRepository;
import com.mobios.beet.service.FeesUpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@Service
public class FeesUpdateServiceImpl implements FeesUpdateService {

	@Autowired
    FeesUpdateRepository feesUpdateRepository;
	
	@Autowired
    FeesRulesServiceImpl feesRulesServiceImpl = null;
	
	//save fees update details in temp_fees table
	@Override
	public String saveFeesDetails(FeesUpdate fees) {
		
		return updateApplyByDate(fees, fees.getUpdateFromDate());
		//return "fees details will be send to the appropipate table until it apply.. the date/time is scheduled for selected date/time...";
	}
	
	//updating the request status of table FeesUpdate not applied set as applied 
	//this should be removed
	@Override
	public String updateRequestStatus(FeesUpdate fees, int transtypeid, double minamount, double maxamount) {
		
		String requestStatus = fees.getRequestStatus();
		feesUpdateRepository.updateRequestStatus(requestStatus, transtypeid , minamount , maxamount);
		if(requestStatus.equals("Applied")) {
			return "request of update information has been applied.";
		}else if(requestStatus.equals("Not Applied")) {
			return "request of update information has been not Applied.";
		}else {
			return "request of update information has bee ignored.";
		}
		
	}
	
	//set date/time to apply changes
	public String updateApplyByDate(FeesUpdate fees, String scheduledTime) {
	
		String returnStr ="";
		FeesRules feesrules = new FeesRules();
		
		scheduledTime =scheduledTime.replace("_", " ");
		long delay = 0;
		
		try {
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//Date desiredDate = dateFormat.parse("2020-01-24 17:10:00");
			Date desiredDate = dateFormat.parse(scheduledTime);
			
			Date now = new Date();
			System.out.println(now.toString());
			delay = desiredDate.getTime() - now.getTime();
			System.out.println(delay);
			//de;ay validating
			if(delay<0) {
				System.out.println("Request can not be satisfied");
				returnStr= "The request can not be satisfied ";
			}else {
				
				
				feesUpdateRepository.save(fees);
				ScheduledExecutorService ses = Executors.newSingleThreadScheduledExecutor();
				ses.schedule(new Runnable(){
				    @Override
				    public void run() {
				    	
				      boolean  Programisrunning = false;
				       System.out.println("Delayed time");
				       //updating temp_fees tables
				       feesrules.setFee(fees.getNewFee());
				       feesrules.setFeeRate(fees.getNewFeeRate());
				       feesrules.setMaxAmount(fees.getMaxAmount());
				       feesrules.setMinAmount(fees.getMinAmount());
				       feesrules.setTransactionTypesId(fees.getTransactionTypesId());
				      String str=  feesRulesServiceImpl.updateFeesInformation(feesrules, fees.getTransactionTypesId(), fees.getMinAmount(), fees.getMaxAmount());
				      System.out.println(str);
				    //updating the request status of table FeesUpdate not applied set as applied
				      feesUpdateRepository.updateRequestStatus("Applied", fees.getTransactionTypesId(), fees.getMinAmount(), fees.getMaxAmount());
				    }
				}, delay, TimeUnit.MILLISECONDS);
				returnStr = "updates will be recoding by :" +delay+ "ms";
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*
		 * Date date = new Date(); return dateFormat.format(date);
		 */
		
			
				return  returnStr;
	}

	
	
	
}
