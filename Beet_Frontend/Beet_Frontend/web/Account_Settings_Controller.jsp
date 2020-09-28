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
	ProfileDistributionN UserAccdata = null;
	ProfileUpdate prof = new ProfileUpdate();
	String User_name = request.getParameter("search_Name");
	String User_nic = request.getParameter("search_Nic");
	String User_dob = request.getParameter("search_Dob");
	String User_gender = request.getParameter("search_Gender");
	String User_address = request.getParameter("search_Address");
	String User_mobile = request.getParameter("search_Mobile");
	String User_nominee = request.getParameter("search_Nominee");
	String User_nominee_nic= request.getParameter("search_NomineeNic");
	String User_accno = request.getParameter("search_Acc");
	String User_profile_status=request.getParameter("search_ProfStatus");
	int profileStatus = Integer.parseInt(User_profile_status);
	String User_preStatus = request.getParameter("pre_status");
	int preStatusCode = Integer.parseInt(User_preStatus);

	//int status_code = 0;
	
	String str="";
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
		prof.setRequestStatus("pending");
		prof.setNewStatus(profileStatus);
		prof.setRequestSendTo("111111111");
		prof.setPreStatus(preStatusCode);
		
		str = obj.updateProfileInfo(prof);
		}catch(Exception ex){
	//
		}
		out.print(str);
		
		
		User_name = "";
		User_nic = "";
		User_dob = "";
		User_gender = "";
		User_address = "";
		User_mobile = "";
		User_nominee = "";
		User_nominee_nic= "";
		User_accno = "";
		prof=null;
		response.sendRedirect("Account_Settings.jsp");
%>


<body>
<h5>ewrethryrg</h5>
</body>
</html>