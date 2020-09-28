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

 <!-- session handling -->
<%

//timeout 
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
//response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
int timeout = session.getMaxInactiveInterval(); //seconds
int refresh = session.getMaxInactiveInterval(); 
response.setHeader("Refresh",refresh+"; URL = Login_page.jsp");

response.setHeader("Refresh", timeout + "; URL = Login_page.jsp");
/* response.setHeader("Refresh", refresh + "; URL = Login_page.jsp"); */
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
/* session.invalidate();
 */

//get logged user
UserInfo userData =new UserInfo();
userData= (UserInfo)session.getAttribute("current_user");


//logout session
if (session.getAttribute("current_user") == null || session.getAttribute("current_user").equals("")){
	response.sendRedirect("Login_page.jsp");
	System.out.print("login error redirect");
	return;
}


%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>EPAY - Commission Settings</title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/layout.min.css" rel="stylesheet" type="text/css">
	<!-- <link href="assets/css/components.min.css" rel="stylesheet" type="text/css"> -->
	<link href="assets/css/components_original.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/colors.min.css" rel="stylesheet" type="text/css">
	<link href="global_assets/css/icons/fontawesome/styles.min.css" rel="stylesheet" type="text/css">
	<link href="global_assets/css/extras/animate.min.css" rel="stylesheet" type="text/css">
	
	
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script src="global_assets/js/main/jquery.min.js"></script>
	<script src="global_assets/js/main/bootstrap.bundle.min.js"></script>
	<script src="global_assets/js/plugins/loaders/blockui.min.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script src="global_assets/js/plugins/visualization/d3/d3.min.js"></script>
	<script src="global_assets/js/plugins/visualization/d3/d3_tooltip.js"></script>
	<script src="global_assets/js/plugins/forms/styling/switchery.min.js"></script>
	<script src="global_assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
	<script src="global_assets/js/plugins/ui/moment/moment.min.js"></script>
    <script src="global_assets/js/plugins/visualization/d3/d3.min.js"></script>
	<script src="global_assets/js/plugins/visualization/d3/d3_tooltip.js"></script>

	<script src="assets/js/app.js"></script>
	<script src="global_assets/js/demo_pages/dashboard.js"></script>
	<script src="global_assets/js/demo_pages/datatables_basic.js"></script>
	<script src="global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
    <script src="global_assets/js/demo_pages/widgets_stats.js"></script>
    
	<!-- /theme JS files -->
    <!-- Theme JS files -->
	<script src="global_assets/js/plugins/visualization/d3/d3.min.js"></script>
	<script src="global_assets/js/plugins/visualization/d3/d3_tooltip.js"></script>

	<script src="assets/js/app.js"></script>
	<script src="global_assets/js/demo_pages/widgets_stats.js"></script>
	<!-- /theme JS files -->
    <!-- Theme JS files -->
	<script src="global_assets/js/plugins/visualization/echarts/echarts.min.js"></script>

	<script src="assets/js/app.js"></script>
	<script src="global_assets/js/demo_pages/charts/echarts/bars_tornados.js"></script>
	<!-- /theme JS files -->
    <!-- Theme JS files -->
	<script src="global_assets/js/plugins/visualization/echarts/echarts.min.js"></script>

	<script src="assets/js/app.js"></script>
	<script src="global_assets/js/demo_pages/charts/echarts/pies_donuts.js"></script>
	<!-- /theme JS files -->
    <!-- Theme JS files -->
	<script src="global_assets/js/plugins/visualization/echarts/echarts.min.js"></script>

	<script src="assets/js/app.js"></script>
	<script src="global_assets/js/demo_pages/charts/echarts/columns_waterfalls.js"></script>
	<!-- /theme JS files -->
    <!-- Theme JS files -->
	<script src="global_assets/js/plugins/ui/moment/moment.min.js"></script>
	<script src="global_assets/js/plugins/pickers/daterangepicker.js"></script>
	<script src="global_assets/js/plugins/pickers/anytime.min.js"></script>
	<script src="global_assets/js/plugins/pickers/pickadate/picker.js"></script>
	<script src="global_assets/js/plugins/pickers/pickadate/picker.date.js"></script>
	<script src="global_assets/js/plugins/pickers/pickadate/picker.time.js"></script>
	<script src="global_assets/js/plugins/pickers/pickadate/legacy.js"></script>
	<script src="global_assets/js/plugins/notifications/jgrowl.min.js"></script>

	<!-- /theme JS files -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"> </script>
	<script src="global_assets/js/plugins/pagination/bs_pagination.min.js"></script>
	<script src="global_assets/js/demo_pages/components_pagination.js"></script>

	<script src="global_assets/js/demo_pages/picker_date.js"></script>
		<script src="global_assets/js/plugins/extensions/jquery_ui/interactions.min.js"></script>
	<script src="global_assets/js/plugins/forms/selects/select2.min.js"></script>

	<script src="global_assets/js/demo_pages/form_select2.js"></script>
	
	<script src="global_assets/js/plugins/forms/styling/uniform.min.js"></script>
	<script src="global_assets/js/plugins/forms/styling/switchery.min.js"></script>
	<script src="global_assets/js/plugins/forms/styling/switch.min.js"></script>
	<script src="global_assets/js/demo_pages/form_checkboxes_radios.js"></script>
</head>
<%!

Callers callobj = new Callers();

int transactionTypesId=0;
int transactionTypesId2=0;
String range ="";
String scheduledTime = "";
double minAmount=0;
double maxAmount=0;

double commission=0;
String feesrates = "";
String newFee = "";
String newCommi = "";



/* double fees=0; */
%>



<!-- for Fees Settings Tab  -->
<%
double fee=0;
try{
transactionTypesId = Integer.parseInt(request.getParameter("search_Transtype"));
range = request.getParameter("select_Range");
scheduledTime = request.getParameter("ButtonCreationDemoButton");


if(transactionTypesId==2 || transactionTypesId==3){
	if(range.equals("1")) {
		minAmount=0;
		maxAmount=5000;
	}if(range.equals("2")) {
		minAmount=5001;
		maxAmount=50000;
	}if(range.equals("3")) {
		minAmount=50001;
		maxAmount=100000;
	}
}
if(transactionTypesId==1){
	minAmount=100;
	maxAmount=100;
}
if(transactionTypesId==4){
	minAmount=0;
	maxAmount=100000;
}
if(transactionTypesId==5){
	minAmount=0;
	maxAmount=100000;
}
if(transactionTypesId==7){
	minAmount=0;
	maxAmount=100000;
}

/* Callers callobj = new Callers(); */
if(transactionTypesId !=0 && minAmount!=0 && maxAmount !=0){
	//get fee for selected type and amount limit
		FeesRules fr = callobj.getFeesRules(transactionTypesId, minAmount, maxAmount);
			
		/* out.print(fr.getFee() + "||" + fr.getFeeRate()); */
		if(transactionTypesId==1 || transactionTypesId==4){
			fee=fr.getFeeRate();
		}else{
			fee=fr.getFee();
		}
}else{
	fee=0;
}

	}catch(Exception ex){
		//out.print(ex); 
	}


//update fee for selected type and amount limit

/* FeesRules ufr  = callobj.updatefeesRules(feesrates,fee,transactionTypesId,minAmount,maxAmount); */
		
	
%>
<!-- /for Fees Settings Tab  -->

<!-- for Commission Settings Tab  -->
<%
try{
	//out.print(request.getParameter("search_Transtype2")); 
	transactionTypesId2 = Integer.parseInt(request.getParameter("search_Transtype2"));
	//out.print(transactionTypesId2);	
}catch(Exception ex){
	//out.print("ssss"+ ex);
	transactionTypesId2=0;
}
	
%>

<%
//for get commisiion rates for each user type
double bankRate=0;
double adminRate=0;
double superAgentRate=0;
double distributorRate=0;
double agentRate=0;


try{	
	if(transactionTypesId2!=0){
		//out.print(transactionTypesId2);
		List<CommissionRules> commissionList = callobj.getCommissionDtails(transactionTypesId2);

		for(int i=0; i < commissionList.size(); i++ ){
			
			//out.print(commissionList.get(i).getTransactionTypeId());
			if(commissionList.get(i).getUserTypeId()==1){
				superAgentRate= commissionList.get(i).getRate()*100;
				//out.print("superAgent");
			}
			if(commissionList.get(i).getUserTypeId()==2){
				distributorRate= commissionList.get(i).getRate()*100;
				//out.print("distributor");
			}
			if(commissionList.get(i).getUserTypeId()==3){
				agentRate= commissionList.get(i).getRate()*100;
				//out.print("agent");
			}
			if(commissionList.get(i).getUserTypeId()==6){
				adminRate= commissionList.get(i).getRate()*100;
				//out.print("admin");
			}
			if(commissionList.get(i).getUserTypeId()==7){
				bankRate= commissionList.get(i).getRate()*100;
				//out.print("bank");
			}
			
	}

}else{
	
	bankRate=0;
	 adminRate=0;
	 superAgentRate=0;
	 distributorRate=0;
	 agentRate=0;
}

}catch(Exception ex){
	
}
	

%>
<!-- /for Commission Settings Tab  -->


<body class="sidebar-xs sidebar-secondary-hidden">

	<!-- Main navbar -->
    
	<div class="navbar navbar-expand-md navbar-dark">
		<div class="navbar-brand">

            <h3>EPAY</h3>
		</div>

		<div class="d-md-none">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile">
				<i class="icon-tree5"></i>
			</button>
			<button class="navbar-toggler sidebar-mobile-main-toggle" type="button">
				<i class="icon-paragraph-justify3"></i>
			</button>
		</div>

		<div class="collapse navbar-collapse" id="navbar-mobile">
			<ul class="navbar-nav">
				
			</ul>

			<!-- <span class="badge bg-success ml-md-3 mr-md-auto">Online</span> -->

			<ul class="navbar-nav ml-auto">
				

				<li class="nav-item dropdown dropdown-user">
					<a href="#" class="navbar-nav-link d-flex align-items-center dropdown-toggle" data-toggle="dropdown">
						<img src="global_assets/images/placeholders/placeholder.jpg" class="rounded-circle mr-2" height="34" alt="">
						<span> <%=userData.getName() %>  </span>
					</a>

					<div class="dropdown-menu dropdown-menu-right">
						<a href="Login_page.jsp" class="dropdown-item"><i class="icon-switch2"></i> Logout</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
        
	<!-- /main navbar -->


	<!-- Page content -->
	<div class="page-content">

		<!-- Main sidebar -->
		<div class="sidebar sidebar-dark sidebar-main sidebar-expand-md">

			<!-- Sidebar mobile toggler -->
			<div class="sidebar-mobile-toggler text-center">
				<a href="#" class="sidebar-mobile-main-toggle">
					<i class="icon-arrow-left8"></i>
				</a>
				Navigation
				<a href="#" class="sidebar-mobile-expand">
					<i class="icon-screen-full"></i>
					<i class="icon-screen-normal"></i>
				</a>
			</div>
			<!-- /sidebar mobile toggler -->


			<!-- Sidebar content -->
			<div class="sidebar-content">



				<!-- Main navigation -->
                <div class="card card-sidebar-mobile">
					<ul class="nav nav-sidebar" data-nav-type="accordion">
						<li class="nav-item">
							<li href="#" class="navbar-nav-link sidebar-control sidebar-main-toggle d-none d-md-block">
								<i class="icon-paragraph-justify3"></i>
							</li>
							
							
						</li>
						<!-- Main -->
						<li class="nav-item">
							<a href="Admin_page.jsp" class="nav-link">
								<i class="icon-home4"></i>
								<span>
									Dashboard
								</span>
							</a>
						</li>
						<!-- Search  -->
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link"><i class="icon-search4"></i> <span>Search</span></a>
							<ul class="nav nav-group-sub" data-submenu-title="Search">
								<li class="nav-item"><a href="Transactions_Search.jsp" class="nav-link">Transactions</a></li>
								<!-- <li class="nav-item"><a href="Fees_Commission_Settings.jsp" class="nav-link">Fees and Commissions</a></li> -->
							</ul>
						</li>
						<!-- //Search  -->
						
						<!-- Settings  -->
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link  active"><i class="icon-gear"></i> <span>Settings</span></a>
							<ul class="nav nav-group-sub" data-submenu-title="Settings">
								<li class="nav-item"><a href="Account_Settings.jsp" class="nav-link">Account Settings</a></li>
								<li class="nav-item"><a href="Fees_Commission_Settings.jsp" class="nav-link">Fees and Commissions Settings</a></li>
							</ul>
						</li>
						<!-- //Settings  -->
						
						<!-- Notifications  -->
						
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link"><i class="icon-bell3"></i> <span>Notifications</span></a>
							<ul class="nav nav-group-sub" data-submenu-title="Notifications">
								<li class="nav-item"><a href="notification.jsp" class="nav-link">Updates</a></li>
								<li class="nav-item"><a href="RegistrationsApproval.jsp" class="nav-link">Registrations</a></li>
							</ul>
						</li>
						
						<!-- //Notifications  -->
						
						<!-- /main -->
					</ul>
				</div>
				<!-- /main navigation -->

			</div>
			<!-- /sidebar content -->
			
		</div>
		<!-- /main sidebar -->


		<!-- Main content -->
		<div class="content-wrapper">

			<!-- Page header -->
			<div class="page-header page-header-light">
				<!-- <div class="page-header-content header-elements-md-inline">
					<div class="page-title d-flex">
						<h4><i class="icon-arrow-left52 mr-2"></i> <span class="font-weight-semibold">Home</span> - Dashboard</h4>
						<a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
					</div>

					
				</div> -->

				<div class="breadcrumb-line breadcrumb-line-light header-elements-md-inline">
					<div class="d-flex">
						<div class="breadcrumb">
							<a href="index.html" class="breadcrumb-item"><i class="icon-home2 mr-2"></i> Home</a>
							<span class="breadcrumb-item active">Commission Settings</span>
						</div>

						<a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
					</div>

					<div class="header-elements d-none">
						<div class="breadcrumb justify-content-center">
							

							<!-- <div class="breadcrumb-elements-item dropdown p-0">
								<a href="#" class="breadcrumb-elements-item dropdown-toggle" data-toggle="dropdown">
									<i class="icon-gear mr-2"></i>
									Settings
								</a>

								<div class="dropdown-menu dropdown-menu-right">
									<a href="#" class="dropdown-item"><i class="icon-user-lock"></i> Account security</a>
									<a href="#" class="dropdown-item"><i class="icon-statistics"></i> Analytics</a>
									<a href="#" class="dropdown-item"><i class="icon-accessibility"></i> Accessibility</a>
									<div class="dropdown-divider"></div>
									<a href="#" class="dropdown-item"><i class="icon-gear"></i> All settings</a>
								</div>
							</div> -->
						</div>
					</div>
				</div>
			</div>
			<!-- /page header -->


			<!-- Content area -->
			<div class="content">
			
			
			<!-- Dashboard content -->
			
              <!-- Basic tabs -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header header-elements-inline">
							<h5 class="font-weight-semibold">Approve Profile Updates</h5>									
						</div>

							<div class="card-body" id="tabs">
								<ul class="nav nav-tabs" >
									<li class="nav-item"><a href="#basic-tab1" class="nav-link  " data-toggle="tab">Fees Settings</a></li>
									<li class="nav-item"><a href="#basic-tab2" class="nav-link" data-toggle="tab">Commission Settings</a></li>
									
								</ul>

								<div class="tab-content">
								<!-- Fees tab -->
									<div class="tab-pane fade show " id="basic-tab1">
										<form action="" class="col-lg-6 offset-lg-3" method="post">
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Transaction Type:</label>
												<div class="col-sm-8">
													<select data-placeholder="--Select Transaction Type--" class="form-control select" data-fouc name="search_Transtype" id="search_TranstypeId" >
														<option></option>									
														<option value="3">Cash In</option>
														<option value="4">Cash Out</option>
														<option value="7">Bill Payment</option>
														<option value="2">Fund Transfer</option>
														<option value="5">Mobile top up</option>											
													</select>
												</div>
											</div>
		
											 <div class="form-group row">
												<label class="col-lg-4 col-form-label">Transaction Amount:</label>
												<div class="col-lg-8">
													<select data-placeholder="--Select Amount Range--" class="form-control select" data-fouc name="select_Range" id="select_range" >
														<option></option>									
														<option value="1">Below 5000</option>
														<option value="2">5000 - 50,000</option>
														<option value="3">50,000 - 100,000</option>
													
													</select>
												</div>
											</div>
											<button type="submit" class="btn btn-primary" id="btn_getfees" hidden>Save</button>
										</form>
										<form action="Fees_Settings_Controler.jsp" class="col-lg-6 offset-lg-3" method="post">
											<div class="form-group row">
												<label class="col-lg-4 col-form-label" id="feelable">Current Fee:</label>
												<div class="col-lg-8">
													
													<div class="row">
													<div class="col">
													<input type="text" class="form-control" placeholder="Current Fee"  value="<%=fee %>">
													</div>
													<div class="col"><p id="demo" style="font-size:19px; font-weight:bold; margin-top: 5px;"></p></div>
													</div>
													
												</div>
											</div>
		
											<div class="form-group row">
												<label class="col-lg-4 col-form-label">New Fee:</label>
												<div class="col-lg-8">
													<input type="text" class="form-control" placeholder="New Fee" name="add_NewFee" required value="<%=newFee %>" readonly>
												</div>
											</div>
		
											<div class="form-group row">
												<label class="col-lg-4 col-form-label">Scheduled Time:</label>
												<div class="col-lg-8">
													<button type="button" class="btn btn-light btn-icon" id="ButtonCreationDemoButton" name="ButtonCreationDemoButton" ><i class="icon-calendar3" readonly ></i></button>
													<input type="text" class="form-control" id="ButtonCreationDemoInput" placeholder="Select a date" name="txtScheduledTime"  required>
												</div>
											</div>
		
											
											<input type="text" class="form-control" id="tran_type"  name="tran_type"  value="<%=transactionTypesId%>" hidden>
											<input type="text" class="form-control" id="tran_amount_min"  name="tran_amount_min"  value="<%=minAmount %>" hidden>
											<input type="text" class="form-control" id="tran_amount_max"  name="tran_amount_max" value="<%=maxAmount %>" hidden>	
											
											
											<div class="text-right">
												
												<button type="button" class="btn btn-danger" id="btn_edit_fee">Edit <i class="icon-pencil3 ml-2"></i></button>
												<button type="submit" class="btn btn-primary" id="btn_save_fee">Save <i class="icon-paperplane ml-2"></i></button>
											</div>
										</form>
									</div>
								<!-- Fees tab -->

								<!-- Comission tab -->
								<div class="tab-pane fade show" id="basic-tab2">
										<form action="" class="col-lg-6 offset-lg-3" method="post">
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Transaction Type:</label>
												<div class="col-sm-8">
													<select data-placeholder="--Select Transaction Type--" class="form-control select" data-fouc name="search_Transtype2" id="search_TranstypeId2">
														<option></option>									
														<option value="3">Cash In</option>
														<option value="4">Cash Out</option>
														<option value="7">Bill Payment</option>
														<option value="2">Fund Transfer</option>
														<option value="5">Mobile top up</option>											
													</select>
												</div>
											</div>
						
											<button type="submit" class="btn btn-primary" id="btn_getrates"  hidden>Save</button>
										</form>
										<form action="Commision_Settings_Controler.jsp" class="col-lg-6 offset-lg-3" method="post">
											<div class="form-group row">
												<label class="col-lg-12 col-form-label">Commission Rates for User Types:</label>
											
											</div>
											
											<div class="form-group row">
												<label class="col-lg-4 col-form-label">Bank</label>
												<div class="col-lg-8">
													<div class="row">
														<div class="col-md-4">
															<!-- <input type="text" class="form-control" placeholder="Current Rate"> -->
															<input type="text" class="form-control" placeholder="Current Rate" name="add_CommiBank" id="current_Fee" value="<%=bankRate %> ">
														</div>
														<div class="col-md-4">
															<input type="text" class="form-control" placeholder="New Rate" name="add_NewCommiBank" id="demo1" onChange="calc(this.value,'demo2','demo3','demo4','demo5','result')" required >
														</div>
														
														<div>
														<p style="font-size:19px; font-weight:bold; margin-top: 5px;">%</p>
														</div>
														
													</div>
												</div>
											</div>
											
											<div class="form-group row">
												<label class="col-lg-4 col-form-label">Admin</label>
												<div class="col-lg-8">
													<div class="row">
														<div class="col-md-4">
															<input type="text" class="form-control" placeholder="Current Rate" name="add_CommiAdmin" id="current_Fee" value="<%=adminRate %> ">
														</div>
														<div class="col-md-4">
															<input type="text" class="form-control" placeholder="New Rate" name="add_NewCommiAdmin"  id="demo2" onChange="calc(this.value,'demo1','demo3','demo4','demo5','result')" required>
														</div>
														
														<div>
														<p style="font-size:19px; font-weight:bold; margin-top: 5px;">%</p>
														</div>
													</div>
													
												</div>
											</div>
											
											<div class="form-group row">
												<label class="col-lg-4 col-form-label">Super Agent</label>
												<div class="col-lg-8">
													<div class="row">
														<div class="col-md-4">
															<input type="text" class="form-control" placeholder="Current Rate" name="add_CommiSuperAgent" id="current_Fee" value="<%=superAgentRate %> ">
														</div>
														<div class="col-md-4">
															<input type="text" class="form-control" placeholder="New Rate" name="add_NewCommiSuperAgent"  id="demo3"  onChange="calc(this.value,'demo2','demo1','demo4','demo5','result')" required>
														</div>
														
														<div>
														<p style="font-size:19px; font-weight:bold; margin-top: 5px;">%</p>
														</div>
													</div>
													
												</div>
											</div>
											
											
											<div class="form-group row">
												<label class="col-lg-4 col-form-label">Distributor</label>
												<div class="col-lg-8">
													<div class="row">
														<div class="col-md-4">
															<input type="text" class="form-control" placeholder="Current Rate" name="add_CommiDistributor" id="current_Fee" value="<%=distributorRate %> ">
														</div>
														<div class="col-md-4">
															<input type="text" class="form-control" placeholder="New Rate" name="add_NewCommiDistributor"  id="demo4" onChange="calc(this.value,'demo2','demo3','demo1','demo5','result')" required>
														</div>
														
														<div>
														<p style="font-size:19px; font-weight:bold; margin-top: 5px;">%</p>
														</div>
													</div>
													
												</div> 
											</div>
											
											<div class="form-group row">
												<label class="col-lg-4 col-form-label">Agent</label>
												<div class="col-lg-8">
													<div class="row">
														<div class="col-md-4">
 															<input type="text" class="form-control" placeholder="Current Rate" name="add_CommiAgent" id="current_Fee" value="<%=agentRate %> ">
														</div>
														<div class="col-md-4">
															<input type="text" class="form-control" placeholder="New Rate" name="add_NewCommiAgent"   id="demo5" onChange="calc(this.value,'demo2','demo3','demo4','demo1','result')" required>
														</div>
														
														<div>
														<p style="font-size:19px; font-weight:bold; margin-top: 5px;">%</p>
														</div>
													</div>
													
												</div>
											</div>
											<p id="msg" style="color:red; margin-left:300px; font-size:11px;"></p>
											<input type="text" id="messa" hidden>
											<div class="form-group row">
												<label class="col-lg-4 col-form-label">Scheduled Time:</label>
												<div class="col-lg-8">
													<button type="button" class="btn btn-light btn-icon" id="ButtonCreationDemoButton2" ><i class="icon-calendar3"></i></button>
													<input type="text" class="form-control" id="ButtonCreationDemoInput2"  name="txtScheduledTime2"  placeholder="Select a date"  required> 
												</div>
											</div>
		
													<input type="text" class="form-control" id="tran_type2"  name="tran_type2"  value="<%=transactionTypesId2%>" hidden>
		
		
											<div class="text-right">
											
												<button type="button" class="btn btn-danger" id="btn_edit_commi">Edit <i class="icon-pencil3 ml-2"></i></button>
												<button type="submit" class="btn btn-primary" id="btn_save_commi">Save <i class="icon-paperplane ml-2"></i></button>
											</div>
											</form>
									</div> 
									<!-- /Comission tab -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /basic tabs -->

      
                
            </div>
            
            
			<!-- /dashboard content -->
				
                
			<!--All Transaction Table-->
			
			
			<!--All Transaction Table-->
			<!-- /content area -->


			<!-- Footer -->
			<div class="navbar navbar-expand-lg navbar-light">
				<div class="text-center d-lg-none w-100">
					<button type="button" class="navbar-toggler dropdown-toggle" data-toggle="collapse" data-target="#navbar-footer">
						<i class="icon-unfold mr-2"></i>
						Footer
					</button>
				</div>

				<div class="navbar-collapse collapse" id="navbar-footer">
					<span class="navbar-text">
						&copy;  <a href="#">EPAY Solutions (BD) Ltd</a>
					</span>


				</div>
			</div>
			<!-- /footer -->
    
		</div>
		<!-- /main content -->
        </div>
	</div>
	<!-- /page content -->
</body>

<!-- Fee settings -->
<script type="text/javascript">

var trans_type ="";
var range ="";
var fee = "<%=fee%>";

document.getElementById("btn_save_commi").disabled = true;
 function calc(A,B,C,D,E,SUM) {
var one = Number(A);
// alert(one);

var two = Number(document.getElementById(B).value); 
var three =Number(document.getElementById(C).value);
var four =Number(document.getElementById(D).value);
var five =Number(document.getElementById(E).value);
//alert(three)
 // alert(two);
 var total= one + two+three+four+five;
 
 document.getElementById('messa').value=total;
 
// document.getElementById(SUM).value=total;

if(total==100)
	  {
	  document.getElementById('msg').innerHTML="";
	//  disablesve();
	  document.getElementById("btn_save_commi").disabled = false;
		 
	  }
else
	  {
	  document.getElementById('msg').innerHTML="*New rate must be 100 %";
	document.getElementById("btn_save_commi").disabled = true;
	  }
}


var scheduledAt = "<%=scheduledTime%>"
	$("#search_TranstypeId").on('change',function(){
		trans_type= $(this).val();
		localStorage.setItem("transTypesID",trans_type);
		//$("#tran_type").val(trans_type);
		
	});
	
	$("#select_range").on('change',function(){
		range= $(this).val();
		//$("#tran_amount").val(range);
		
		localStorage.setItem("transRange",range);
 		if(trans_type !== "" && range !== ""){
 			
 			$("#btn_getfees").trigger("click");
 			
		}
 	});
	
	if(localStorage.getItem("transTypesID")==4)
	{
	//alert("HHHHHHH");
	
	document.getElementById("demo").innerHTML="%";
	document.getElementById("feelable").innerHTML="Current Fee Rate";
	}
	
	document.getElementById("search_TranstypeId").value = localStorage.getItem("transTypesID");
	var t1 = localStorage.getItem("transTypesID");
	document.getElementById("select_range").value = localStorage.getItem("transRange");
	
	localStorage.removeItem("transTypesID");
	localStorage.removeItem("transRange");
	
	

	

$("#ButtonCreationDemoButton").click(function(){
	$("#ButtonCreationDemoInput").prop("readonly","false");
});

//enable the disabled text fields
$(document).ready(function()
{
 $('#btn_edit_fee').click(function()
 {
   $("input[name='add_NewFee']").removeAttr("readonly");  
   $("button[name='ButtonCreationDemoButton']").removeAttr("readonly");  
   $("input[name='ButtonCreationDemoInput']").removeAttr("readonly"); 
   $('#btn_save_fee').attr("disabled", false);
 });

 });
 
$('#btn_edit_fee').click(function(){
	 $('#frmShowData input,textarea').attr("readonly",false);
	$('input[type="text"]').attr("disabled",false);
	$('#btn_save_fee').attr("disabled", false); 
	
});

 </script>
 <!-- /Fee settings -->
 
 
 <!-- Commission settings -->
 <script>
 
 var trans_type2 ="";
 
 $("#search_TranstypeId2").on('change',function(){
	 trans_type2 = $(this).val();
	 localStorage.setItem("transTypesID2",trans_type2);
			$("#btn_getrates").trigger("click");
			$("#trans_type2").val(trans_type2);//hidden input trigger
		
	});
 document.getElementById("search_TranstypeId2").value = localStorage.getItem("transTypesID2");
 var t2=  localStorage.getItem("transTypesID2");
 localStorage.removeItem("transTypesID2");
 
 //tab change set
 $(document).ready(function(){
	 if(t1 ===null && t2 === null){
		 $( "#tabs" ).tabs({active:0}); 
	 }
	 if(t2 !== null ){
		 $( "#tabs" ).tabs({active:1}); 

	 }
	 if(t1 !== null){
		 $( "#tabs" ).tabs({active:0});
	 }
 });
 
//enable the desabled readonly
//enable the disabled text fields
$(document).ready(function()
{
 $('#btn_edit_commi').click(function()
 {
   $("input[name='add_NewCommiAgent']").removeAttr("readonly");  
   $("button[name='ButtonCreationDemoButton']").removeAttr("readonly");  
   $("input[name='ButtonCreationDemoInput']").removeAttr("readonly"); 
   $('#btn_save_commi').attr("disabled", false);
 });

 });

 $('#btn_edit_commi').click(function(){
 	 $('#frmShowData input,textarea').attr("readonly",false);
 	$('input[type="text"]').attr("disabled",false);
 	$('#btn_save_commi').attr("disabled", false); 
 	
 });
 
 if(window.history.replaceState){
	 window.history.replaceState(null,null,window.location.href);
 }
 
 </script>

</html>