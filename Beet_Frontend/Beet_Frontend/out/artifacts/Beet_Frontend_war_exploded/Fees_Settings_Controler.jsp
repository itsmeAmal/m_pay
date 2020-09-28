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

//Assigning to string
String trans_type = request.getParameter("tran_type").replace(" ", "");
String trans_amount_min= request.getParameter("tran_amount_min").replace(" ", "");
String trans_amount_max= request.getParameter("tran_amount_max").replace(" ", "");
String new_fee = request.getParameter("add_NewFee").replace(" ", "");
String scheduled_time = request.getParameter("txtScheduledTime");

//string assign to int and double
int trans_typeInt= Integer.parseInt(trans_type);
double trans_amount_minInt = Double.parseDouble(trans_amount_min);
double trans_amount_maxInt = Double.parseDouble(trans_amount_max);
double new_feeInt = 0 ;
double new_feeRateInt= 0 ;

if(trans_typeInt==1 || trans_typeInt==4){
	new_feeRateInt =Double.parseDouble(new_fee);
	new_feeInt =0;
}else{
	new_feeInt = Double.parseDouble(new_fee);
	new_feeRateInt=0;
}

try{
	Callers callobj= new Callers();
	//creating a object of modle class
	FeesUpdate feesUpdate = new FeesUpdate();
	//set to object of model class
	feesUpdate.setTransactionTypesId(trans_typeInt);
	feesUpdate.setMinAmount(trans_amount_minInt);
	feesUpdate.setMaxAmount(trans_amount_maxInt);
	feesUpdate.setUpdateFromDate(scheduled_time);
	feesUpdate.setNewFee(new_feeInt);
	feesUpdate.setNewFeeRate(new_feeRateInt);
	
	String str = callobj.updateFees(feesUpdate);
	
	out.print(str);
}catch(Exception ex){
	out.print(ex);
}


response.sendRedirect("Fees_Commission_Settings.jsp");
%>
<body>

<!-- just print values -->
<p><%=trans_type %></p>
<p><%=trans_amount_min%></p>
<p><%=trans_amount_max%></p>
<p><%=new_fee %></p>
<p><%=scheduled_time %></p>
</body>
</html>