package com.mobios.beet.authentication;

import com.sun.mail.smtp.SMTPMessage;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import java.util.Properties;
import java.util.Random;

public class OTPSender {
	//otp generate
	public int generateOtp() {
		int _otp = 0;
		Random _rand = new Random();
		int _low = 1000;
		int _high = 9999;
		_otp = _rand.nextInt(_high - _low) + _low;
		return _otp;
	}
	//pin generation
	public int generate4DigitPIN() {
		int _pin = 0;
		Random _rand = new Random();
		int _low = 1000;
		int _high = 9999;
		_pin = _rand.nextInt(_high - _low) + _low;
		return _pin;

	}
	//send otp to email
	public boolean sendHtmlEmail( String userName,String password, String toAddress, String subject,
			String message,String email)
					throws AddressException, MessagingException {

		String host = "mail.mobios.lk";
		String from = "sahani@mobios.lk";

		System.out.println("zsxdfvgbnm"+message);
		
		Properties props = new Properties();

		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "25");

		Session session = Session.getInstance(props);
		session.setDebug(true);

		try {

			SMTPMessage msg = new SMTPMessage(session);


			msg.setFrom(new InternetAddress(from));
			msg.setRecipients(Message.RecipientType.TO, toAddress);
			msg.setSubject(subject);

			Transport tr = session.getTransport("smtp");

			
			Authenticator auth = new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(userName, password);
				}
			};
			
			String username="sahani@mobios.lk";
			String password1="NWTyHsDLE{=^";

			tr.connect(host, username, password1);
			msg.setContent(message,"text/html");  
			msg.saveChanges();  
			tr.sendMessage(msg, msg.getAllRecipients());
			tr.close(); 

		}catch (Exception mex) {
			System.out.println(mex);
		}
		
		return true;
	}


}
