package com.mobios.beet.serviceImpl;

import com.mobios.beet.authentication.OTPSender;
import com.mobios.beet.authentication.SMSSend;
import com.mobios.beet.errorHandler.ShowError;
import com.mobios.beet.model.ProfileSubscriber;
import com.mobios.beet.repository.ProfileSubscriberRepository;
import com.mobios.beet.repository.WalletRepository;
import com.mobios.beet.service.ProfileSubscriberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;


@Service
public class ProfileSubscriberServiceImpl implements ProfileSubscriberService {
	
	@Autowired
    ProfileSubscriberRepository profileSubscriberRepository;
	@Autowired
	WalletRepository walletRepository;
	
	

	@Override
	public List<ProfileSubscriber> findAll() {
		// TODO Auto-generated method stub
		List<ProfileSubscriber> allSubscribers = profileSubscriberRepository.findAll();
		return allSubscribers;
	}

	@Override
	public List<ProfileSubscriber> findBysCreatedBy(String sCreatedBy) {
		// TODO Auto-generated method stub
		List<ProfileSubscriber> SubscribersByCreated = profileSubscriberRepository.findBysCreatedBy(sCreatedBy);
		return SubscribersByCreated;
	}

	//send OTP to user mail
	@Override
	public String getDetails(ProfileSubscriber ps1) {
		// TODO Auto-generated method stub
		
		String mobileNo =ps1.getsMobileNumber();
		SMSSend sms = new SMSSend();
		
		try {
			
			String otp="";
			//get user detailsS
			
			ProfileSubscriber ps =  profileSubscriberRepository.getDetails(mobileNo);

			
			OTPSender otpSender = new OTPSender();
			otp= otpSender.generateOtp()+"";
			
			String message = "Your Beet registration OTP is "+otp+"." ;
			

			//Boolean isOTPsend = otpSender.sendHtmlEmail(userName, password, "sahani@mobios.lk", "OTP verifcation for BEET", message, "");
			int resCOde = sms.sendSMS(mobileNo , message);
			System.out.println("workthe message 200");
			System.out.println("resCode: "+resCOde);

			System.out.println("ps obj: "+ps);
			
			if(ps==null) {
				//check OTP send or not
				System.out.println("ps==null");
				if(resCOde == 200) {
					System.out.println("resCOde == 200");
					ProfileSubscriber pr = new ProfileSubscriber();
					pr.setsMobileNumber(mobileNo);
					pr.setsOtp(otp);
					pr.setsStatus("Requested");
					profileSubscriberRepository.save(pr);
					System.out.println("New request has been recorded and OTP:"+otp+" has been sent to the user");
				}else {
					return "0";
				}
			
			}
			else {
				if(resCOde ==200) {
					profileSubscriberRepository.updateOTP(otp, mobileNo);
					profileSubscriberRepository.updateOTPVerificationStatus("Requested", mobileNo);
				}else {
					return "0";
				}
				
			}
		}catch(Exception ex) {
			System.out.println(ex);
		}	
		
		return "1";
	
	}
	
	//save details of user by registration
	public ProfileSubscriber saveNewUser(ProfileSubscriber subscriber ) {
		
		String accno = profileSubscriberRepository.createAccountNumber("5");//profile code 5 - subscriber
		OTPSender otp = new OTPSender();
		String pin = otp.generate4DigitPIN()+"";
		SMSSend sms = new SMSSend();
		
		subscriber.setsStatusCode("5");//status code 5 - suspended
		subscriber.setsAccNo(accno);
		subscriber.setsPin(pin);
		//profileSubscriberRepository.save(subscriber); // saving the new user
		profileSubscriberRepository.updateProfileSubscriberDetails(accno, subscriber.getsName(), subscriber.getsNic(), subscriber.getsDob(), subscriber.getsGender(), subscriber.getsAddress(), pin, subscriber.getsStatusCode(), subscriber.getsMobileNumber());
		String resultWallet= profileSubscriberRepository.createWallet(accno); // creating his wallet
		String walletId = walletRepository.getWalletId(accno);
		profileSubscriberRepository.updateWalletId(walletId , accno);//update wallet code in profile subscriber
		System.out.println(resultWallet +"wallet created....");
		
		try {
			
			
			String message = "Your Beet Account number is "+ accno + "and your pin number is  " + pin ;
			
			//Boolean isMsgSend = otp.sendHtmlEmail(userName, password, "sahani@mobios.lk", "Account details for BEET", message, "");
			int resCode = sms.sendSMS(subscriber.getsMobileNumber(), message);
			if(resCode== 200) {
				System.out.println("success save");
				System.out.println("accno :" +accno + ", pin :" + pin);
			}else {
				return null;
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		
		
		return subscriber;
		
	}
	//validate OTP
	@Override
	public String validateOTP(ProfileSubscriber otp) {
		// TODO Auto-generated method stub
		String mobileNo = otp.getsMobileNumber();
		String code = otp.getsOtp();
		System.out.println(mobileNo + code);
		System.out.println("Error Test ============"+profileSubscriberRepository.getOTPForMobileNO(mobileNo));
		String originalOTPCode =profileSubscriberRepository.getOTPForMobileNO(mobileNo);
		String accountStatusCode = profileSubscriberRepository.getAcountStatus(mobileNo);
		System.out.println("***************"+ accountStatusCode);
		if(code.equals(originalOTPCode)) {
			//verified
			if(accountStatusCode== null) {
				profileSubscriberRepository.updateOTPVerificationStatus("Verified", mobileNo);
				return "1,0";
			}else {
				profileSubscriberRepository.updateOTPVerificationStatus("Verified", mobileNo);
				return "1,"+accountStatusCode ;
			}
			
			
		}
		else {
			return "0";
		}
	
	}

	//get user details by accNo
	@Override
	public ProfileSubscriber getUserByMobileNumber(String mobileNo) {
		ProfileSubscriber ps = new ProfileSubscriber();
		ps = profileSubscriberRepository.getDetails(mobileNo);
		if(ps!= null){
			String walletBalance = profileSubscriberRepository.getWalletDetails(ps.getsAccNo());
			
			ps.setsWalletCode(ps.getsWalletCode()+","+walletBalance);
		}
		
		
		return ps;
	}

	@Override
	public String updateProfileInfo(ProfileSubscriber ps) {
		String pin = ps.getsPin();
		String address= ps.getsAddress();
		String mobileNO = ps.getsMobileNumber();
		OTPSender otp = new OTPSender();
		SMSSend sms = new SMSSend();
	
			
			if((pin ==  null || pin.trim().isEmpty())  && (address != null && !address.trim().isEmpty())) {
				profileSubscriberRepository.updateAddress(address, mobileNO);
			}
			if(address == null || address.trim().isEmpty() && (pin != null && !pin.trim().isEmpty()) ) {
				profileSubscriberRepository.updatePinNumber(pin, mobileNO);
				
				try {
					
					
					String message = "Your new Beet pin number is  " + pin ;
					
					//Boolean isMsgSend = otp.sendHtmlEmail(userName, password, "sahani@mobios.lk", "Account details for BEET", message, "");
					int resCode = sms.sendSMS(mobileNO, message);
					if(resCode== 200) {
						
						System.out.println("pin :" + pin);
						
					}
					
				}catch(Exception ex) {
					System.out.println(ex);
				}
			}
			
			if(pin== null && pin.trim().isEmpty() && address==null && address.trim().isEmpty()) {
				profileSubscriberRepository.updateAddressAndPin(address, pin, mobileNO);
				
				try {
					
					
					String message = "Your pin number is  " + pin ;
					
					//Boolean isMsgSend = otp.sendHtmlEmail(userName, password, "sahani@mobios.lk", "Account details for BEET", message, "");
					int resCode = sms.sendSMS(mobileNO, message);
					if(resCode== 200) {
						System.out.println("pin :" + pin);
					}
					
				}catch(Exception ex) {
					System.out.println(ex);
				}
			}
			
		return "1";
		
		
	}

	@Override
	public String validatePinNum(ProfileSubscriber ps) {
		String pin = ps.getsPin();
		String mobileNo= ps.getsMobileNumber();
		String originalPin= profileSubscriberRepository.getPINnum(mobileNo);
		
		if(pin.equals(originalPin)) {
			return "1";
		}else {
			return "0";
		}
		
	}

	@Override
	public List<ProfileSubscriber> getSuspendedProfiles() {
		List<ProfileSubscriber> suspendedAccountList = profileSubscriberRepository.findBysStatusCode("5");
		return suspendedAccountList;
	}

	@Override
	public ProfileSubscriber saveUserWithProfileImage(ProfileSubscriber ps) {
	
		String returnstr ="";
		
		String accno = profileSubscriberRepository.createAccountNumber("5");//profile code 5 - subscriber
		OTPSender otp = new OTPSender();
		String pin = otp.generate4DigitPIN()+"";
		SMSSend sms = new SMSSend();
		
		ps.setsStatusCode("5");//status code 5 - suspended
		ps.setsAccNo(accno);
		ps.setsPin(pin);
		
		
		try {
	    	
	    	if(!ps.getsImgPath().isEmpty()) {
	    		
	    		
	    		String imageBase64str = ps.getsImgPath();
	    		BufferedImage img = null;
	    		
	    		
				//byte[] imgByte= ps.getsImgPath().getBytes();
	    		//covert string
	    		byte[] imgByte= javax.xml.bind.DatatypeConverter.parseBase64Binary(imageBase64str);
				
				// Creating the directory to store file
	            String rootPath = System.getProperty("catalina.home");
	            // /D:/Beet/BPI
	            //File dir = new File("C:\\Users\\LENOVO\\Desktop\\BeetImages" + File.separator + "tmpFiles");
	            File dir = new File("/D:/Beet/BPI" + File.separator + "tmpFiles");
	            if (!dir.exists()) {
	                dir.mkdirs();
	            }
	
	            // Create the file on server
	            File serverFile = new File(dir.getAbsolutePath() + File.separator + ps.getsName());
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
	            stream.write(imgByte);
	            stream.close();
	
	            System.out.println("Server File Location=" + serverFile.getAbsolutePath());
	            returnstr = serverFile.getAbsolutePath();
	            
	           /* User user = new User();
	            user.setUserName(userName);
	            user.setUserPassword(password);
	            user.setUserImage(imgByte);*/
	            ps.setsImgPath(returnstr);
	            System.out.println(returnstr);
	            
			}
	    	
			}catch(Exception ex) {
				System.out.println(ex);
			}

		//profileSubscriberRepository.save(subscriber); // saving the new user
		profileSubscriberRepository.updateProfileSubscriberDetailsWithImg(accno, ps.getsName(), ps.getsNic(), ps.getsDob(), ps.getsGender(), ps.getsAddress(), pin, ps.getsStatusCode(),ps.getsImgPath(), ps.getsMobileNumber());
		String resultWallet= profileSubscriberRepository.createWallet(accno); // creating his wallet
		String walletId = walletRepository.getWalletId(accno);
		profileSubscriberRepository.updateWalletId(walletId , accno);//update wallet code in profile subscriber
		System.out.println(resultWallet +"wallet created....");
		
		
			try {
			
			
			String message = "Your Beet Account number is "+ accno + " and your pin number is  " + pin ;
			
			//Boolean isMsgSend = otp.sendHtmlEmail(userName, password, "sahani@mobios.lk", "Account details for BEET", message, "");
			int resCode = sms.sendSMS(ps.getsMobileNumber(), message);
			if(resCode== 200) {
				System.out.println("success save");
				System.out.println("accno :" +accno + ", pin :" + pin);
			}else {
				return null;
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return ps;
	}

	@Override
	public List<ProfileSubscriber> getRegistrationProfiles() {
		List<ProfileSubscriber> subscribe_RegistrationList = profileSubscriberRepository.findBysStatusCode("5");
		return subscribe_RegistrationList;
	}

	
	@Override
	public String activateNewAccount(String mobileno) {
		String result_activation = profileSubscriberRepository.activateNewAccount(mobileno);
		return result_activation;
	}

	@Override
	public ResponseEntity<?> getUserByPanNumber(String panNo) {
		ProfileSubscriber ps = new ProfileSubscriber();
		ShowError showError = null;
		ps = profileSubscriberRepository.getPanDetails(panNo);
		if(ps!= null){
			String walletBalance = profileSubscriberRepository.getWalletDetails(ps.getsAccNo());

			ps.setsWalletCode(ps.getsWalletCode()+","+walletBalance);

			return new ResponseEntity<>(ps, HttpStatus.OK);
		}

		else {
			showError = new ShowError("number already exist");
			return new ResponseEntity<>(showError, HttpStatus.BAD_REQUEST);
		}


	}

	@Override
	public ResponseEntity<?> registerEpayUser(ProfileSubscriber profSubscriber)
	{

		String mobileNo =profSubscriber.getsMobileNumber();
		String panNo = profSubscriber.getsPanNo();

		String otp = "";

		ProfileSubscriber ps =  profileSubscriberRepository.getDetails(mobileNo);
		ProfileSubscriber ps1 = profileSubscriberRepository.getPanDetails(panNo);

		OTPSender otpSender = new OTPSender();

		ShowError showError = null;

		if(ps==null && ps1==null)
		{
//			ProfileSubscriber pr = profSubscriber;
			otp= otpSender.generateOtp()+"";
			String pinNo = otpSender.generate4DigitPIN()+"";

			profSubscriber.setsMobileNumber(mobileNo);
			profSubscriber.setsOtp(otp);
			profSubscriber.setsStatus("Verified");

			String accno = profileSubscriberRepository.createAccountNumber("5");//profile code 5 - subscriber

			profSubscriber.setsStatusCode("5");
			profSubscriber.setsAccNo(accno);
			profSubscriber.setsPin(pinNo);

//			profileSubscriberRepository.updateProfileSubscriberDetails(accno, profSubscriber.getsName(), profSubscriber.getsNic(), profSubscriber.getsDob(), profSubscriber.getsGender(), profSubscriber.getsAddress(), pinNo, profSubscriber.getsStatusCode(), profSubscriber.getsMobileNumber());
			profileSubscriberRepository.updateEpayProfileSubscriberDetails(accno, profSubscriber.getsName(), profSubscriber.getsNic(), profSubscriber.getsDob(), profSubscriber.getsGender(), profSubscriber.getsAddress(), pinNo, profSubscriber.getsStatusCode(),profSubscriber.getsPanNo(), profSubscriber.getsMobileNumber());
			String resultWallet= profileSubscriberRepository.createWallet(accno); // creating his wallet

			String walletId = walletRepository.getWalletId(accno);

			profSubscriber.setsWalletCode(walletId);

			System.out.println(walletId+" = "+accno);
			profileSubscriberRepository.updateWalletId(walletId , accno);//update wallet code in profile subscriber
			System.out.println(resultWallet +"wallet created....");

			profileSubscriberRepository.save(profSubscriber);

			return new ResponseEntity<>(profSubscriber, HttpStatus.OK);

		}

		else {
			showError = new ShowError("number already exist");
			return new ResponseEntity<>(showError, HttpStatus.BAD_REQUEST);
		}


	}

}
