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
	<title>EPAY - Settings</title>

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

<%!Callers obj = new Callers();
	ProfileDistributionN UserAccdata = null;%>


<%
	
String User_name = "";
String User_nic = "";
String User_dob = "";
String User_gender = "";
String User_address = "";
String User_mobile = "";
String User_nominee = "";
String User_nominee_nic= "";
String User_accno = "";
int status_code = 0;

	
	//String accno = "1000001198364273";
	String Searchby_accno ="";
	Searchby_accno = request.getParameter("search_Accno");
	
	
		try{
			
			if(!Searchby_accno.equals("") || Searchby_accno!=null){
				UserAccdata = obj.getuserDetailsByAccount(Searchby_accno);
			}
		
			
			User_accno = UserAccdata.getAccNo();
			User_name = UserAccdata.getName();
			User_nic = UserAccdata.getNic();
			User_dob = UserAccdata.getDob();
			User_gender = UserAccdata.getGender();
			User_address = UserAccdata.getAddress();
			User_mobile = UserAccdata.getMobileNumber();
			User_nominee = UserAccdata.getNominee();
			User_nominee_nic = UserAccdata.getNomineeNic();
			status_code = Integer.parseInt(UserAccdata.getStatusCode());
			
			
		}catch(Exception ex){
			//out.print(ex);
		}
		 
		//out.println(User_name+"------"+User_nic+"------"+User_gender+"--------"+User_address+"------"+User_mobile+"-------"+User_nominee+"---------"+User_nominee_nic);
		Searchby_accno="";
%>
<%
		String user =String.valueOf(request.getSession().getAttribute("userName"));
%>

<body class="sidebar-xs sidebar-secondary-hidden">

	<!-- Main navbar -->
    
	<div class="navbar navbar-expand-md navbar-dark">
		<div class="navbar-brand">
<!--
			<a href="index.html" class="d-inline-block">
				<img src="../../../../global_assets/images/logo_light.png" alt="">
			</a>
-->
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
							<span class="breadcrumb-item active">Account Settings</span>
						</div>

						<a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
					</div>

					
				</div>
			</div>
			<!-- /page header -->


			<!-- Content area -->
			<div class="content">
			
			<!-- Dashboard content -->
			<div class="row">
                <div class="col-xl-12">
                	<div class="row">
                		<div class="col-md-4">
                			<div class="card">
                				<div class="card-header header-elements-inline">
									<h5 class="font-weight-semibold"><i class="icon-search4 mr-2"></i>Search</h5>									
								</div>
								<div class="card-body">
		                			<form form="frmsearch" action="" method="post">
		                				<input type="text" class="form-control" placeholder="Account No" name="search_Accno" id="search_Account"><br>
		                				<button type="submit" class="btn btn-outline-primary btn-lg icon-search4" style="float:right" id="btn_searchUserdetails" onclick="myfunction()">Search</button>
		                			</form>
		                		</div>
                			</div>
  
                			
                			<div class="card">
                				<div class="card-header header-elements-inline">
									<h5 class="font-weight-semibold"><i class="icon-cogs mr-2"></i> Account Details</h5>									
								</div>
								<div class="card-body" style="height:227px">
		                			<form form="" action="" method="post">
		                				<%if(!User_accno.equals("")) {%>
		                				<div class="row">
			                				<div class="col-md-6">
			                					<label class="font-weight-bold " style="font-size: 16px;"><%=User_accno %></label>
			                				</div>
			                				
			                				<%if(status_code == 2){ %>
			                				<div class="col-md-6">
			                					<label><span class="badge-lg badge-primary badge-icon"><i class="icon-user-check"></i>ACTIVE ACCOUNT</span></label>
			                				</div>
			                				<% } if(status_code == 3){ %>
			                					<div class="col-md-6">
				                					<label ><span class="badge-sm badge-danger badge-icon" style="font-size:12px;"><i class="icon-user-cancel"></i>DEACTIVATED ACCOUNT </span></label>
				                				</div>
			                				<% } if(status_code == 4){ %>
			                					<div class="col-md-6">
				                					<label><span class="badge-lg badge-warning badge-icon"><i class="icon-user-lock"></i>BLOCKED ACCOUNT</span></label>
				                				</div>
			                				<%} %>
			                			</div>
			                			
			                			<br>
			                				
			                				<%if(status_code == 2){ %>
			                					<div class="col-md-12">
			                						
					                				<div class="form-check form-check-switchery form-check-right">
														<label class="form-check-label">
														<input type="checkbox" class="form-check-input-switchery-primary" id="chck_active" checked data-fouc >
															Activate Account
														</label>
													</div>
													<br>
													<div class="form-check form-check-switchery form-check-right">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input-switchery-danger" id="chck_deactive" data-fouc >
															Deactivate Account
														</label>
													</div>
													<br>	
													<div class="form-check form-check-switchery form-check-right">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input-switchery-warning" id="chck_block" data-fouc >
															Block Account
														</label>
													</div>
			                					</div>
			                				<%} if(status_code == 3){ %>
			                					<div class="col-md-12">
			                						
					                				<div class="form-check form-check-switchery form-check-right">
														<label class="form-check-label">
														<input type="checkbox" class="form-check-input-switchery-primary" id="chck_active" data-fouc >
															Activate Account
														</label>
													</div>
													<br>
													<div class="form-check form-check-switchery form-check-right">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input-switchery-danger" id="chck_deactive" checked data-fouc >
															Deactivate Account
														</label>
													</div>
													<br>	
													<div class="form-check form-check-switchery form-check-right">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input-switchery-warning" id="chck_block" data-fouc >
															Block Account
														</label>
													</div>
			                					</div>
			                				<%}if(status_code == 4){ %>
			                					<div class="col-md-12">
			                						
					                				<div class="form-check form-check-switchery form-check-right">
														<label class="form-check-label">
														<input type="checkbox" class="form-check-input-switchery-primary" id="chck_active" data-fouc >
															Activate Account
														</label>
													</div>
													<br>
													<div class="form-check form-check-switchery form-check-right">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input-switchery-danger" id="chck_deactive" data-fouc >
															Deactivate Account
														</label>
													</div>
													<br>	
													<div class="form-check form-check-switchery form-check-right">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input-switchery-warning" id="chck_block" checked data-fouc >
															Block Account
														</label>
													</div>
			                					</div>
			                				<%} %>
										<%} else{%>
											<div class="col-md-12">
			                					<label><span class="badge-lg badge-info badge-icon"><i class="icon-shield-notice"></i>NO ACCOUNT DETAILS TO DISPLAY HERE!!</span></label>
			                				</div>
			                				<br>
			                				<div class="form-check form-check-switchery form-check-right">
												<label class="form-check-label">
												<input type="checkbox" class="form-check-input-switchery-primary" checked data-fouc >
													Activate Account
												</label>
											</div>
											<br>
											<div class="form-check form-check-switchery form-check-right">
												<label class="form-check-label">
													<input type="checkbox" class="form-check-input-switchery-danger" checked data-fouc >
													Deactivate Account
												</label>
											</div>
											<br>	
											<div class="form-check form-check-switchery form-check-right">
												<label class="form-check-label">
													<input type="checkbox" class="form-check-input-switchery-warning" checked data-fouc >
													Block Account
												</label>
											</div>
										<%} %>
		                			</form>
		                		</div>
                			</div>
                		</div>
                		<div class="col-md-8">
                			<div class="card">
                				<div class="card-header header-elements-inline">
                					<h5 class="font-weight-semibold"><i class="icon-users mr-2"></i> User Details</h5>
                				</div>
								<div class="card-body">
		                			<div class="card-body">
										<form action="Account_Settings_Controller.jsp" id="frmShowData" method="post">
											<div class="row">											
												<div class="col-md-6">
													<fieldset>																		
														<div class="form-group">
															<label>User Name</label>
															<input type="text" class="form-control" placeholder="Name"  id="user_Name" name="search_Name" value="<%= User_name%>" readonly>
														</div>
																															
														
														<div class="form-group">
															<label>Date of Birth</label>
															<%-- <span class="input-group-prepend">
																<span class="input-group-text"><i class="icon-calendar22"></i></span>
																<input type="text" class="form-control daterange-single"  id="user_Dob" value="<%= User_dob%>">  
															</span> --%>
															<input type="text" placeholder="DOB" class="form-control" id="user_Dob" value="<%= User_dob%>"  name="search_Dob"  readonly>
														</div>
														
														<label>Address</label>
															
														<div class="row">
													
															<div class="col-md-6">
																<input type="text" placeholder="State" class="form-control" id="user_Address1" value="<%= User_address%>"  name="search_Address" readonly>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<input type="text" placeholder="Province" class="form-control" readonly>
																</div>
															</div>
														</div>
																												
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	
																	<input type="text" placeholder="Address line 1" class="form-control" readonly>
																</div>
															</div>
				
														</div>
														<div class="form-group">
															<input type="text" class="form-control" placeholder="Address line 2" readonly>
														</div>
													</fieldset>
												</div>
				
												<div class="col-md-6">
													<fieldset>		
														<div class="form-group">
															<label>NIC</label>
															<input type="text" class="form-control" placeholder="NIC"  id="user_Nic" value="<%= User_nic%>"  name="search_Nic"  readonly>
														</div>
											          
				
														<div class="form-group">
															<label>Gender</label>
															<input type="text" class="form-control" placeholder="Gender"  id="user_Gender" value="<%= User_gender%>"  name="search_Gender" readonly>
														</div>
														
														<div class="form-group">
															<label>Mobile No</label>
															<input type="text" class="form-control" placeholder="Mobile No" id="user_Mobile" value="<%= User_mobile%>"  name="search_Mobile" readonly>
														</div>
														
														<div class="row">
															<div class="col-md-7">
																<div class="form-group">
																	<label>Nominee</label>
																	<input type="text" class="form-control" placeholder="Nominee" id="user_Nominee" value="<%= User_nominee%>"  name="search_Nominee"  readonly>
																</div>
															</div>
															<div class="col-md-5">
																<div class="form-group">
																	<label>Nominee NIC</label>
																	<input type="text" class="form-control" placeholder="Nominee NIC" id="user_Nomineenic" value="<%= User_nominee_nic%>"  name="search_NomineeNic" readonly>
																	<input type="hidden" class="form-control" name="search_Acc" id="user_Acc" value="<%=User_accno %>" >
																	<input type="hidden" class="form-control" name="search_ProfStatus" id="user_Status" >
																	<input type="hidden" class="form-control"  id="pre_status" name="pre_status"> 
																</div>
															</div>
														</div>
														
																												
				
													</fieldset>
												</div>
											</div>
				
											<div class="text-right">
												<button type="button" class="btn btn-danger" id="btn_edit">Edit <i class="icon-pencil3 ml-2"></i></button>
												<button type="submit" class="btn btn-primary" id="btn_save">Save <i class="icon-paperplane ml-2"></i></button>
											</div>
										</form>
					</div>
		                		</div>
                			</div>
                		</div>
                	</div>
                </div>
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


<script type="text/javascript">
$(document).ready(function(){
	$('input[type="checkbox"]').attr("disabled",true);
	//$('#btn_edit').attr("disabled", true);
	$('#btn_save').attr("disabled", true);
});

$('#btn_searchUserdetails').click(function(){
	$('#btn_edit').attr("disabled", false);	
});


$('#btn_edit').click(function(){
	$('#frmShowData input,textarea').attr("readonly",false);
	$('input[type="checkbox"]').attr("disabled",false);
	$('#btn_save').attr("disabled", false);
});

$('#btn_save').click(function(){
 	//alert("do you want to save details?");
	var checkStatus;
	var preStatus= <%=status_code%>;
	if ($('#chck_active').is(':checked')) {
		checkStatus= "2";	
	}if($('#chck_deactive').is(':checked')){
		checkStatus= "3";
	}if($('#chck_block').is(':checked')){
		checkStatus="4";
	} 
	$("#user_Status").val(checkStatus);
	$("#pre_status").val(preStatus);
	alert(checkStatus +"  | "+ preStatus);
});
</script>

</body>
</html>