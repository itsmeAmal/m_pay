
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.caller.entity.UserInfo"%>
<%@page import="com.caller.controller.MainController"%>
<%@page import="com.caller.controller.loginController"%>
<%@page import="java.io.*"%>
<%

loginController loginC = new loginController();
MainController mc = new MainController();
String action = request.getParameter("forgotaction");
UserInfo userData = new UserInfo();
String query;
SimpleDateFormat sdateformat = new SimpleDateFormat("yyyy-MM-dd");
//Secure sec = new Secure();

String serverIP = "" + request.getLocalAddr();
String serv = "2013";//shortcode
String ip = "" + request.getRemoteAddr();
String softVersion = "V1.2";
String platformID = "EVI-ETI";//+request.getHeader("");
String ID = "" + UUID.randomUUID().toString();
String userCompId = "";
String name = "";
String userType = "";
String logData = "" + serverIP + "," + serv + "," + ip + "," + softVersion + "," + platformID + "," + ID;
Date date1 = new Date();
int attempt = 0;
System.out.println("action" + action);


try{
	if (action.equals("forgotloginUser")) {

		String email = "" + request.getParameter("email");
		String username = "" + request.getParameter("username");

		System.out.println("emailLC : " + email);
		System.out.println("usernameLC : " + username);

		

		boolean validator = mc.forgotPassword(email,username); 
	
	
		System.out.println(validator);
		
		if (validator == true) {
			System.out.println("validatorf true");
			String statusf = mc.catchStatusforgot(email,username);
			System.out.println("STATUSf : " + statusf);
			
			if (statusf.equals("LOCKED")) {
				response.sendRedirect("forgotpassword.jsp?err=locked");
			}
			else if(statusf.equals("TERMINATED")){
				response.sendRedirect("forgotpassword.jsp?err=terminated");
			}
			
		
			
			if (!(statusf.equals("LOCKED")) && !(statusf.equals("TERMINATED"))) {
				String authkey = "130491ADE9VcIY7WyB5vst82d3";
				Random rand = new Random();
				int otp = rand.nextInt(900000) + 100000;
				 //String OTP="12345";
				boolean updatorf=mc.updateForgotPassword(otp,username);
				
				if (updatorf==true){
					response.sendRedirect("Login_page.jsp?msg=success");
					String message1 = "Please use the following security code for the IOBD account";
					String message2 =	"Your OTP is "+otp ;
					String message = message1+"<br>"+message2;
					System.out.println("message "+message);
					
					//String USER_NAME = "rsekanayake1994";// GMail user name (just the part before "@gmail.com")
					  //String PASSWORD = "ekanayake123"; // GMail password
					  String USER_NAME = "pumudu@mobios.lk";
					  String PASSWORD = "pumudud@321";
					String RECIPIENT = email;
					  String from = USER_NAME;
				       String pass = PASSWORD;
				  
				      // String[] to ={RECIPIENT} ; // list of recipient email addresses
				     String subject = "IOBD Security";
				      String body = message;
				      // boolean sent= mc.sendGoogleEmail(from,pass,to,subject,body);
				      boolean sent=mc.sendHtmlEmail(from, pass,email, subject,message, email);
				       System.out.println("email "+sent);
					return;
				}
				
				else{
					response.sendRedirect("forgotpassword.jsp?err=help");
					
				}
				
			
			}
		} else {
			System.out.println("Contact Admin");
			response.sendRedirect("forgotpassword.jsp?err=help");
		}
	}
	
	


}catch (Exception e) {
	
	System.out.println("there is a exception"+e);
}





%>