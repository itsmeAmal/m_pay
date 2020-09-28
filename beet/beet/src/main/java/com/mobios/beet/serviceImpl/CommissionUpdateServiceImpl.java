package com.mobios.beet.serviceImpl;

import com.mobios.beet.model.CommissionRules;
import com.mobios.beet.model.CommissionUpdate;
import com.mobios.beet.repository.CommissionUpdateRepository;
import com.mobios.beet.service.CommissionUpdateService;
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
public class CommissionUpdateServiceImpl implements CommissionUpdateService {
	
	@Autowired
	CommissionUpdateRepository commissionUpdateRepository;
	
	@Autowired
    CommissionRulesServiceImpl commissionRulesServiceImpl;

	//save fees update details in temp_fees table
		@Override
		public String saveCommissionDetails(CommissionUpdate commission) {
			
			return updateApplyByDate(commission, commission.getUpdateFromDate());
			//return "fees details will be send to the appropipate table until it apply.. the date/time is scheduled for selected date/time...";
		}
		
		
		//updating the request status of table FeesUpdate not applied set as applied 
		//this should be removed
		@Override
		public String updateRequestStatus( CommissionUpdate commission, int usertypeid, int transtypeid) {
			
			String requestStatus = commission.getRequestStatus();
			commissionUpdateRepository.updateRequestStatus(requestStatus, usertypeid , transtypeid);
			if(requestStatus.equals("Applied")) {
				return "request of update information has been applied.";
			}else if(requestStatus.equals("Not Applied")) {
				return "request of update information has been not Applied.";
			}else {
				return "request of update information has bee ignored.";
			}
			
		}
		
		
		//set date/time to apply changes
		public String updateApplyByDate( CommissionUpdate commission, String scheduledTime) {
		
			String returnStr ="";
			CommissionRules commissionrules = new CommissionRules();
			
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
				//delay validating
				if(delay<0) {
					System.out.println("Request can not be satisfied");
					returnStr= "The request can not be satisfied ";
				}else {
					
					
					commissionUpdateRepository.save(commission);
					ScheduledExecutorService ses = Executors.newSingleThreadScheduledExecutor();
					ses.schedule(new Runnable(){
					    @Override
					    public void run() {
					    	
					      boolean  Programisrunning = false;
					       System.out.println("Delayed time");
					       //updating temp_commission tables
					      
					       commissionrules.setRate(commission.getNewRate());
					       commissionrules.setUserTypeId(commission.getUserTypeId());
					       commissionrules.setTransactionTypeId(commission.getTransactionTypesId());
					      
					       
					      String str=  commissionRulesServiceImpl.updateCommissionInformation(commissionrules, commission.getUserTypeId() , commission.getTransactionTypesId());
					      System.out.println(str);
					      System.out.println("print here oh hoooooo 3");
					    //updating the request status of table FeesUpdate not applied set as applied
					      commissionUpdateRepository.updateRequestStatus("Applied" , commission.getUserTypeId() , commission.getTransactionTypesId());
					      
					      System.out.println("print here oh hoooooo 1");
					      
					    }
					}, delay, TimeUnit.MILLISECONDS);
					returnStr = "updates will be recoding by :" +delay+ "ms";
					  System.out.println("print here oh hoooooo 2");
				}
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
					return  returnStr;
		}
		
		
	
}
