<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.text.DecimalFormat" %>
<%! 
	public String formatDate(Date date)
	{
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    String strDate= formatter.format(date);
	    System.out.println(strDate);

	    return strDate;
	    
	}

	public String RoundUpValue(double amount)
	{
		String df = new DecimalFormat("#.00").format(amount);
		return df;
	}

%>