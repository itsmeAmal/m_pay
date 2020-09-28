package com.caller.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.smtp.SMTPMessage;


public class MainController {

	private static final MainController mc = new MainController();

	public static MainController getInstance() {
		return mc;
	}

	boolean validator2 = false;
	boolean validator3 = false;
	
public boolean catchUser(String user_name) throws SQLException {
		
		System.out.println("Check point catchUser");
		DatabaseController dbController = DatabaseController.getInstance();
		Connection con = null;
		con = DatabaseController.getConnection();
		System.out.println("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm"+con);
		ResultSet rs = null;
		PreparedStatement statement = null;
		String SQL = "SELECT * FROM user WHERE username=?";

		try {
			statement = con.prepareStatement(SQL);
			statement.setString(1, user_name);
			rs = statement.executeQuery();

			if (rs.next()) {
				validator3 = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return validator3;

	}

public boolean catchPass(String passWord) throws SQLException {
	
	System.out.println("Check point catchPass");
	DatabaseController dbController = DatabaseController.getInstance();
	Connection con = null;
	con = DatabaseController.getConnection();
	ResultSet rs = null;
	PreparedStatement statement = null;
	String SQL = "SELECT * FROM user WHERE password=?";

	try {
		statement = con.prepareStatement(SQL);
		statement.setString(1, passWord);
		rs = statement.executeQuery();

		if (rs.next()) {
			validator2 = true;
		}

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	return validator2;

}


int attempt = 0;

public int catchAttempts(String user_name) throws SQLException {
	
	System.out.println("Check point catchAttempts");
	DatabaseController dbController = new DatabaseController();
	Connection conn = null;
	conn = DatabaseController.getConnection();
	ResultSet rs = null;
	PreparedStatement statement = null;
	String query = "SELECT login_attempts FROM user WHERE username=?";
	try {
		statement = conn.prepareStatement(query);
		statement.setString(1, user_name);
		rs = statement.executeQuery();

		while (rs.next()) {
			attempt = rs.getInt("login_attempts");
		}
	} finally {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	// System.out.println("////////////////"+count);
	return attempt;

}

boolean updator2 = false;

public boolean updatStatus(int attempt, String user_name) throws SQLException {
	
	System.out.println("Check point updateAttempts");
	DatabaseController dbController = DatabaseController.getInstance();
	Connection conn = null;
	conn = DatabaseController.getConnection();
	ResultSet rs = null;
	PreparedStatement statement = null;
	String query = "UPDATE `user` SET `login_attempts` = ? WHERE username=?";
	try {
		statement = conn.prepareStatement(query);
		statement.setInt(1, attempt);
		statement.setString(2, user_name);
		int row = statement.executeUpdate();
		updator2 = true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	return updator2;

}


boolean updator3 = false;

public boolean updatLOckStatus(String user_name) throws SQLException {
	System.out.println("Check point updatLOckStatus");
	DatabaseController dbController = DatabaseController.getInstance();
	Connection conn = null;
	conn = DatabaseController.getConnection();
	ResultSet rs = null;
	PreparedStatement statement = null;
	String query = "UPDATE `user` SET `status` = 'LOCKED' WHERE username=?";
	try {
		statement = conn.prepareStatement(query);
		statement.setString(1, user_name);
		int row = statement.executeUpdate();
		updator3 = true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	return updator3;

}


boolean updator4 = false;

public boolean updatePasssword(String password, String status, String id) throws SQLException {
	DatabaseController dbController = DatabaseController.getInstance();
	Connection connection = null;
	connection = DatabaseController.getConnection();
	ResultSet rs = null;
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat();
	format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String DateToStr = format.format(date);
	PreparedStatement statement = null;
	String query = "UPDATE `user` SET status = ?, password=? WHERE user_id=?";
	try {
//		Secure sec = new Secure();
//		String updatePwd = sec.encrypt(password);
		
		statement = connection.prepareStatement(query);
		statement.setString(1, status);
		//statement.setString(2, password);
		statement.setString(2, password);
		statement.setString(3, id);
		int row = statement.executeUpdate();
		updator4 = true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	return updator4;
}



String status;

public String catchStatus(String user_name) throws SQLException {
	System.out.println("Check point catchStatus");
	DatabaseController dbController = new DatabaseController();
	Connection conn = null;
	conn = DatabaseController.getConnection();
	ResultSet rs = null;
	PreparedStatement statement = null;
	String sql = "SELECT status FROM user WHERE username=?";
	try {
		statement = conn.prepareStatement(sql);
		statement.setString(1, user_name);
		rs = statement.executeQuery();

		while (rs.next()) {
			status = rs.getString("status");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		if (conn != null) {
			conn.close();
		}
	}
	
	//System.out.println("Check point catchStatus "+status);
	return status;

}


/*public boolean sendHtmlEmail( String userName,
		 String password, String toAddress, String subject,
		String message,String email) throws AddressException,
		MessagingException {
	
	boolean isSent = false ;
	String host = "mail.mobios.lk";
	String port = "25";
	String mailFrom = "pumudu@mobios.lk";
	//String password = "star@123";
	//String subject = "AllStars message";
	
	try {
		
		// sets SMTP server properties
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		//    properties.put("mail.smtp.starttls.enable", "true");
		//  properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		// creates a new session with an authenticator
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		};
	
		Session session = Session.getInstance(properties, auth);
	
		// creates a new e-mail message
		Message msg = new MimeMessage(session);
	
		msg.setFrom(new InternetAddress(userName));
		InternetAddress[] toAddresses = { new InternetAddress(email) };
		msg.setRecipients(Message.RecipientType.TO, toAddresses);
	
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		// set plain text message
		msg.setContent(message, "text/html");
	
		// sends the e-mail
		Transport.send(msg);
		isSent = true;
		
	} catch (Exception e) {
		System.out.println("email not sent " +e+",");
		isSent = false;
	}

	return isSent;

}*/

public boolean sendHtmlEmail( String userName,String password, String toAddress, String subject,
		String message,String email)
				throws AddressException, MessagingException {

	String host = "mail.mobios.lk";
	String from = "pumudu@mobios.lk";

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
		
		String username="pumudu@mobios.lk";
		String password1="pumudu@321";

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



boolean validatorf=false;
public boolean forgotPassword(String email,String username) throws SQLException {
		
		System.out.println("Check point forgotpassword");
		DatabaseController dbController = DatabaseController.getInstance();
		Connection con = null;
		con = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String SQL = "SELECT * FROM user WHERE email=? AND username=?";

		try {
			statement = con.prepareStatement(SQL);
			statement.setString(1, email);
			statement.setString(2, username);
			rs = statement.executeQuery();

			if (rs.next()) {
				validatorf = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			}
		return validatorf;
		}


String statusf;

public String catchStatusforgot(String email,String username) throws SQLException {
	System.out.println("Check point catchStatusf");
	DatabaseController dbController = new DatabaseController();
	Connection conn = null;
	conn = DatabaseController.getConnection();
	ResultSet rs = null;
	PreparedStatement statement = null;
	String sql = "SELECT status FROM user WHERE email=? AND username=?";
	try {
		statement = conn.prepareStatement(sql);
		statement.setString(1, email);
		statement.setString(2, username);
		rs = statement.executeQuery();

		while (rs.next()) {
			statusf = rs.getString("status");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		if (conn != null) {
			conn.close();
		}
	}
	
	//System.out.println("Check point catchStatus "+status);
	return statusf;

}


boolean updatorf = false;

public boolean updateForgotPassword(int OTP,String username) throws SQLException {
	System.out.println("Check point updateForgotPassword");
	DatabaseController dbController = DatabaseController.getInstance();
	Connection conn = null;
	conn = DatabaseController.getConnection();
	ResultSet rs = null;
	PreparedStatement statement = null;
	String query = "UPDATE `user` SET `status` = 'SYSTEM_GENERATED',`password` = '"+OTP+"' WHERE username=?";
	try {
		statement = conn.prepareStatement(query);
		statement.setString(1, username);
		int row = statement.executeUpdate();
		updatorf = true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	return updatorf;

}



}
