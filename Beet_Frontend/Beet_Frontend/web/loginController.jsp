<%@page import="com.caller.entity.UserInfo"%>
<%@page import="com.caller.entity.UserPages"%>
<%@page import="com.caller.secure.Secure"%>
<%@page import="com.caller.controller.MainController"%>
<%@page import="com.caller.controller.loginController"%>
<%@page import="com.caller.controller.logger"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>


<% 
loginController lc = new loginController();
MainController mc = new MainController();
logger logs=new logger();
String action = request.getParameter("action");
UserInfo userData = new UserInfo();
String query;
SimpleDateFormat sdateformat = new SimpleDateFormat("yyyy-MM-dd");
Secure sec = new Secure();

String ID = "";
String userCompId = "";
String name = "";
String userType = "";
String logData = "";

Date date1 = new Date();
int attempt = 0;
UserPages userPG = new UserPages();
System.out.println("action" + action);

List<UserPages> pageList = new ArrayList<UserPages>();

try {

	if (action.equals("loginUser")) {

		String user_name = "" + request.getParameter("username");
		String passWord = "" + request.getParameter("password");

		System.out.println("usernameLC : " + user_name);
		System.out.println("passwordLC : " + passWord);

		
		logData = logs.LogInfo(request);
		session.setAttribute("logData", logData);
		
		boolean validator = mc.catchUser(user_name);
		boolean validator2 = mc.catchPass(passWord);
		
		System.out.println(validator);
		System.out.println(validator2);
		
		if (validator == true && validator2 == true ) {
			System.out.println("validatore true");
			String status = mc.catchStatus(user_name);
			System.out.println("STATUS : " + status);
			
			if (status.equals("LOCKED")) {
				response.sendRedirect("Login_page.jsp?err=locked");
			}
			else if(status.equals("TERMINATED")){
				response.sendRedirect("Login_page.jsp?err=teminated");
			} 
			
			
			if (!(status.equals("LOCKED")) && !(status.equals("TERMINATED"))) {
				
				userData = lc.loginUser(user_name, passWord);
				//System.out.println("userData : " + userData);
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				Date date = new Date();
				String CurrentDate = formatter.format(date);

				System.out.println("checkpoint checkuserid : " + userData.getUser_id());
				if (("" + userData.getUser_id()).equals("null")) {

					attempt = mc.catchAttempts(user_name);
					attempt++;
					if (attempt < 10) {
						
						boolean updator = mc.updatStatus(attempt, user_name);
						//LogUtil.getLog("LoginErrEvents").debug(logData+"ERROR,Status=PasswordMismatch[ Username: "+user_name+" Password: "+passWord+"], Attempt: "+attempt+" ,,,");
						//LogUtil.getLog("Events").debug(logData+"ERROR,ERROR,Status=PasswordMismatch[ Username: "+user_name+" Password: "+passWord+"], Attempt: "+attempt+" ,,,");
						response.sendRedirect("Login_page.jsp?err=err5");
						
					}
					if (attempt == 10) {
						boolean updater = mc.updatLOckStatus(user_name);
						response.sendRedirect("Login_page.jsp?err=locked");
					}
					return;
				}
				//LogUtil.getEventLog()
					//	.debug(logData + ",LOGIN,status:validLogin,username:" + user_name + ",,,,,");
				
				//default path check system generated
				if (!("" + userData.getUser_id()).equals("null")) {
					System.out.println("user_id NOT NULL");
					boolean updator = mc.updatStatus(0, user_name);
					ID = userData.getUser_id();
					userCompId = userData.getCompanyid();
					name = userData.getName();
					userType = userData.getUsertype();
					
					//this below row is written to expire password in 3 months.
					//validator = mc.validatePassword(passWord, ID);
					
					if (validator == true) {
						//System.out.println(userData.getTNP_DATAENTRY_STATUS());
						if (userData.getStatus().equals("SYSTEM_GENERATED")) {
							System.out.println("SYSTEM_GENERATED ");
							ID = userData.getUser_id();
							session.setAttribute("user", user_name);
							session.setAttribute("id", ID);
							
							String id = (String) session.getAttribute("id");
							System.out.println(id);
							response.sendRedirect("InitialPasswordReset.jsp");
						}
						//End Hasitha's editing
						//default path check user roles and redirect to them
						if (!(userData.getStatus().equals("SYSTEM_GENERATED"))) {

							System.out.println("NOT SYSTEM_GENERATED");
							System.out.println("Date  "+CurrentDate);
															
							//session attribute set
							ID = userData.getUser_id();
							session.setAttribute("userid", ID); //simple i used
							session.setAttribute("userId", ID); //capital I used
							session.setAttribute("userCompId", userCompId);
							session.setAttribute("name", name);
							session.setAttribute("userType", userType);
							
							//last logged date
							lc.lastloggedin(CurrentDate, ID);
							
							String[] userRoles = userData.getUsertype().split(",");
							userPG = lc.getFirstpage(userRoles[0], 1);
							System.out.println("********1****************" + userRoles.length);
							pageList = lc.getPagesList(userRoles);

							/* if (userData.getTNP_DATAENTRY_USER_ROLE().equalsIgnoreCase("ADMIN")) {
								session.setAttribute("current_user", userData);
								response.sendRedirect("UserCreator.jsp");
							}else */ if (!userRoles[0].equals("")) {
								System.out.println("********2****************" + userRoles.length);
								System.out.println(
										"********3****************" + userData.getStatus());
								session.setAttribute("current_user", userData);
								System.out.println("********4**************** : "
										+ userData.getStatus());
								session.setAttribute("currentUserPages", pageList);
								System.out.println("********5**************** : "
										+ userData.getStatus());
								session.setAttribute("userPG", userPG);
								System.out.println("********6**************** : "
										+ userData.getStatus());
								System.out.println("********7**************** : " + userPG.getPageName());
								System.out.println("********8**************** : " + (String)session.getAttribute("userId"));
								System.out.println("********9**************** : " + (String)session.getAttribute("userCompId"));
								response.sendRedirect(userPG.getPageName());
							}
						}
					} else {
						ID = userData.getUser_id();
						session.setAttribute("user", user_name);
						session.setAttribute("id", ID);
						response.sendRedirect("InitialPasswordReset.jsp?err=err4");
					}
				}
				//edited by Hasitha
			}
		}if(validator==false && validator2 == true ){
			if(user_name.length()==0 ){
				/* System.out.println("Username or password incorrect"); */
				response.sendRedirect("Login_page.jsp?err=err8");//Username is incorrect
			}else{
				response.sendRedirect("Login_page.jsp?err=err8");
			}
		} 
		if(validator==true && validator2 == false ){
			if(passWord.length()==0 ){
				/* System.out.println("Username or password incorrect"); */
				response.sendRedirect("Login_page.jsp?err=err7");//password is incorrect
			}else{
				response.sendRedirect("Login_page.jsp?err=err7");
			}
		}
		if(validator==false && validator2 == false ){
			if(user_name.length()==0 && passWord.length()==0){
				/* System.out.println("Username or password incorrect"); */
				response.sendRedirect("Login_page.jsp?err=err9");//Enter Username and Password
			}else{
				response.sendRedirect("Login_page.jsp?err=err9");
			}
		}
		
		
		
	} //login user end
		// edited by Hasitha
	if (action.equals("initialReset")) {
		String user = (String) session.getAttribute("user");
		String id = (String) session.getAttribute("id");

		String password = request.getParameter("new");

				
		//this below line is written to reset password more than 3 moths		
		//boolean validator = mc.validatePassword(password, ID);
		boolean validator = true;
		
		
		System.out.println(validator);

		if (validator == true) {
			//this below line will update password
			//boolean updator = mc.insertPasssword(password, user, id);
			
			boolean updator = true;
			updator = mc.updatePasssword(password, "ACTIVE", id);
			//updator = mc.updatePasssword(encryptedCheckPwd, "ACTIVE", id);
			session.invalidate();
			response.sendRedirect("Login_page.jsp?msg=ok");
		} else {
			response.sendRedirect("InitialPasswordReset.jsp?err=err1");
		}

	}
	

} catch (Exception e) {
	System.out.println(e);
}
//////////////////////////////////////////////////////////////////////////////////////
%>

