<%@page import="com.itextpdf.text.pdf.PdfStructTreeController.returnType"%>
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

<!-- to reduce history records -->
<% 
//String to double
double bankNewRate = Double.parseDouble(request.getParameter("add_NewCommiBank"))/100;
double adminNewRate = Double.parseDouble(request.getParameter("add_NewCommiAdmin"))/100;
double superAgentNewRate = Double.parseDouble(request.getParameter("add_NewCommiSuperAgent"))/100;
double agentNewRate = Double.parseDouble(request.getParameter("add_NewCommiAgent"))/100;
double distributorNewRate = Double.parseDouble(request.getParameter("add_NewCommiDistributor"))/100;

double bankRate = Double.parseDouble(request.getParameter("add_CommiBank"));
double adminRate = Double.parseDouble(request.getParameter("add_CommiAdmin"));
double superAgentRate = Double.parseDouble(request.getParameter("add_CommiSuperAgent"));
double agentRate = Double.parseDouble(request.getParameter("add_CommiAgent"));
double distributorRate = Double.parseDouble(request.getParameter("add_CommiDistributor"));


int trans_type2 = Integer.parseInt(request.getParameter("tran_type2"));
String scheduled_time2 = request.getParameter("txtScheduledTime2");


Callers callObj = new Callers();
//calling Function
CommissionUpdate commissionUpdate= new CommissionUpdate();
//String parsing to assign the object
String str="";
%>
<%

//comparing if not equals
if(bankNewRate != bankRate){
	commissionUpdate=createCommisionUpdateObj(trans_type2, 7,bankNewRate, scheduled_time2);
	str = callObj.updateCommission(commissionUpdate);
	out.print("bank" );
}
if(adminNewRate!=adminRate){
	commissionUpdate=createCommisionUpdateObj(trans_type2, 6,adminNewRate, scheduled_time2);
	str = callObj.updateCommission(commissionUpdate);
	out.print("admin");
}
if(superAgentNewRate!=superAgentRate){
	commissionUpdate=createCommisionUpdateObj(trans_type2, 1,superAgentNewRate, scheduled_time2);
	str = callObj.updateCommission(commissionUpdate);
	out.print("superAgent");
}
if(agentNewRate!=agentRate){
	commissionUpdate=createCommisionUpdateObj(trans_type2, 3,agentNewRate, scheduled_time2);
	str = callObj.updateCommission(commissionUpdate);
	out.print("agent");
}
if(distributorNewRate!=distributorRate){
	commissionUpdate=createCommisionUpdateObj(trans_type2, 2,distributorNewRate, scheduled_time2);
	str = callObj.updateCommission(commissionUpdate);
	out.print("distributor");
}


//if one or more fields empty
/* try{
	if(bankNewRate = null && adminNewRate= null && agentNewRate= null && superAgentNewRate==""  && distributorNewRate==""){
		
	}
}catch(Exception ex){
	
}
 */


%>


<%!
//Create a global function
CommissionUpdate createCommisionUpdateObj(int trans_type2, int user_type , double newRate, String updateFromDate){
	CommissionUpdate comm = new CommissionUpdate();
	comm.setTransactionTypesId(trans_type2);
	comm.setUserTypeId(user_type);
	comm.setNewRate(newRate);
	comm.setUpdateFromDate(updateFromDate);
	
	return comm;
}


%>

<%
response.sendRedirect("Fees_Commission_Settings.jsp");
%>
<body>


</body>
</html>