<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.caller.*"%>
<%@page import="com.caller.controller.*"%>
<%@page import="com.caller.components.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date" %>
<%@page import="com.caller.entity.UserPages"%>
<%@page import="com.caller.entity.UserInfo"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.lang.reflect.Array" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<%
	Callers obj = new Callers();
ProfileDistributionN prof = new ProfileDistributionN();
ProfileUpdate profileup = new ProfileUpdate();

String User_name = request.getParameter("search_Name");
String User_nic = request.getParameter("search_Nic").replace(" ", "");
String User_dob = request.getParameter("search_Dob").replace(" ", "");
String User_gender = request.getParameter("search_Gender").replace(" ", "");
String User_address = request.getParameter("search_Address");
String User_mobile = request.getParameter("search_Mobile").replace(" ", "");
String User_nominee = request.getParameter("search_Nominee");
String User_nominee_nic= request.getParameter("search_NomineeNic").replace(" ", "");
String User_accno = request.getParameter("search_Acc").replace(" ", "");
String User_profile_status=request.getParameter("search_Newstatus").replace(" ", "");


if(User_profile_status.equals("Active")){
	User_profile_status= "2";
}
if(User_profile_status.equals("Deactive")){
	User_profile_status= "3";
}
if(User_profile_status.equals("Blocked")){
	User_profile_status= "4";
}
if(User_profile_status.equals("Suspended")){
	User_profile_status= "5";
}
/*int profileStatus = Integer.parseInt(User_profile_status);
String User_preStatus = request.getParameter("pre_status");
int preStatusCode = Integer.parseInt(User_preStatus);*/

out.print(User_accno +User_name + User_address +User_dob + User_gender);

String str="";
String status="";
try{
	
	
	prof.setAccNo(User_accno);
	prof.setName(User_name);
	prof.setMobileNumber(User_mobile);
	prof.setNic(User_nic);
	prof.setDob(User_dob);
	prof.setGender(User_gender);
	prof.setAddress(User_address);
	prof.setNominee(User_nominee);
	prof.setNomineeNic(User_nominee_nic);
	prof.setStatusCode(User_profile_status);
	prof.setCreatedBy("");
	prof.setMembershipTypeCode("");
	prof.setPanNo(0);
	prof.setPin("");
	prof.setProfileTypeCode(0);
	prof.setSuperMobileNumber("");
	prof.setUuId("");
	prof.setVerification("");
	prof.setWalletCode("");

	
	profileup.setAccNo(User_accno);
	profileup.setRequestStatus("Approved");
	
	str = obj.updateProfileInfoOriginal(prof, User_accno);
		if(!str.equals(null)){
		status = obj.updaterequestStatus(profileup, User_accno);
		}
	
	}catch(Exception ex){
		out.print(ex);
	}
	out.print("||||||"+str + "|" + status);
	
	response.sendRedirect("notification.jsp");
%>

<body>

</body>
</html>