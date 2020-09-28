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
<%@include file="CommonMethods.jsp" %>

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
	<title>EPAY - View Registration Requests</title>

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

<%-- <%!

Callers callobj = new Callers();

String accno= "1000000310939259";

String updateStatus=null;
String preStatus=null;
List<ProfileUpdate> pendingList = null;
List<ProfileUpdate> approvedList = null;
%>
<%

String accno =String.valueOf(request.getSession().getAttribute("userAcount"));
List<ProfileUpdate> profileUpdates = callobj.getProfileUpdateDetailsByAccno(accno);

/*for(int i=0; i<profileUpdates.size(); i++){
	ProfileUpdate pr = profileUpdates.get(i);
	out.print(pr.getAccNo());
	/*if(pr.getRequestStatus().equals("pending")){
		pendingList.add(pr);
	}else{
		approvedList.add(pr);
	}*/
//}
%> --%>

<%
Callers callobj = new Callers();

List<ProfileSubscriber> suspendedList = null;
suspendedList= callobj.getSuspendedProfiles();

String date = null;
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
							<a href="#" class="nav-link "><i class="icon-gear"></i> <span>Settings</span></a>
							<ul class="nav nav-group-sub" data-submenu-title="Settings">
								<li class="nav-item"><a href="Account_Settings.jsp" class="nav-link">Account Settings</a></li>
								<li class="nav-item"><a href="Fees_Commission_Settings.jsp" class="nav-link">Fees and Commissions Settings</a></li>
							</ul>
						</li>
						<!-- //Settings  -->
						
						<!-- Notifications  -->
						
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link  active"><i class="icon-bell3"></i> <span>Notifications</span></a>
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
							<a href="index.html" class="breadcrumb-item"><i class="icon-gear mr-2"></i>Settings</a>
							<span class="breadcrumb-item active">Registration</span>
						</div>

						<a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
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
							<h5 class="font-weight-semibold">Registration Requests</h5>									
						</div>

							<div class="card-body">
							
									<table class="table datatable-basic table-striped " id="mytable">
										<thead>
											<tr>
												<!-- <th>Mobile No</th>
												<th>Account No</th>
												<th>Name</th>
												<th>NIC</th>
												<th>Address</th>
												<th>Gender</th>
												<th>DOB</th>
												<th hidden>Nominee</th>
												<th hidden>Nominee NIC</th>
												<th>Created Date</th>
												<th>Account Status</th>
												<th>Request Status</th>
												<th>Action</th> -->
												<th>Created Date</th>
												<th>Mobile No</th>
												<th>Account No</th>
												<th>Name</th>
												<th>NIC</th>
												<th>Address</th>
												<th>Gender</th>
												<th>DOB</th>												
												<th hidden>Nominee</th>
												<th hidden>Nominee NIC</th>
												<th>Account Status</th>	
												<th>Request Status</th>								
												<th>Action</th>

											</tr>
										</thead>
										 <tbody id="">
											
											<%for(int i=0; i<suspendedList.size(); i++){

												
											%>
											<tr>
												<td><%=suspendedList.get(i).getsCreatedDate()%></td>
												<td><%=suspendedList.get(i).getsMobileNumber()%></td>
												<td><%=suspendedList.get(i).getsAccNo()%></td>
												<td><%=suspendedList.get(i).getsName()%></td>
												<td><%=suspendedList.get(i).getsNic()%></td>
												<td><%=suspendedList.get(i).getsAddress()%></td>
												<td><%=suspendedList.get(i).getsGender()%></td>
												<td><%=formatDate(suspendedList.get(i).getsDob())%></td>
												<td>Suspended</td>
												<td>Pending</td>
												<td><button type="button" class=" btn_view btn bg-teal-400 btn-labeled btn-labeled-left rounded-round" data-toggle="modal" data-target="#modal_default" id="btn_view" ><b><i class="icon-eye2"></i></b>View</button></td>
												
											</tr>
											
											<%} %>
									</tbody> 
									</table>
								</div>

									
						</div>
					</div>
				</div>
				<!-- /basic tabs -->

      
                
            </div>
            
            
          
            
            <div id="modal_default" class="modal fade" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Approve updates</h5>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body">
									<form action="RegistrationApprovalController.jsp" id="frmShowData" method="post">
											<div class="row">											
												<div class="col-md-6">
													<fieldset>																		
														<div class="form-group">
															<label>User Name</label>
															<input type="text" class="form-control" placeholder="Name"  id="user_Name" name="user_Name" value="" readonly>
														</div>
																															
														
														<div class="form-group">
															<label>Date of Birth</label>
															
															<input type="text" placeholder="DOB" class="form-control" id="user_Dob" value=""  name="user_Dob"  readonly>
														</div>
														
														<label>Address</label>
															
														<div class="row">
													
															<div class="col-md-6">
																<input type="text" placeholder="State" class="form-control" id="user_Address1" value=""  name="user_Address1" readonly>
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
															<input type="text" class="form-control" placeholder="NIC"  id="user_Nic" value=""  name="user_Nic"  readonly>
														</div>
											          
				
														<div class="form-group">
															<label>Gender</label>
															<input type="text" class="form-control" placeholder="Gender"  id="user_Gender" value=""  name="user_Gender" readonly>
														</div>
														
														<div class="form-group">
															<label>Mobile No</label>
															<input type="text" class="form-control" placeholder="Mobile No" id="user_Mobile" value=""  name="user_Mobile" readonly>
														</div>
														
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label>Account Created Date</label>
																	<input type="text" class="form-control" placeholder="Created Date" id="user_CreatedDate" value=""  name="user_CreatedDate"  readonly>
																</div>
															</div>
								
														</div>
														<div class="row">
															<div class="col-md-6">
																<div class="form-group">
																	<label>Account Status</label>
																	<input type="text" class="form-control" placeholder="previous status" id="user_accStatus" value=""  name="user_accStatus"  readonly>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label>Request Status</label>
																	<input type="text" class="form-control" placeholder="new status" id="user_reqStatus" value=""  name="user_reqStatus"  readonly>
																</div>
															</div>
														</div>
																												
				
													</fieldset>
												</div>
											</div>
				
											<button type="button" class="btn btn-link" data-dismiss="modal">Reject</button>
											<button type="submit" class="btn bg-primary">Approve</button>
										</form>
							</div>

							<div class="modal-footer">
							
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


</body>

 <script type="text/javascript">
 

	 $("#mytable").on('click','.btn_view',function(){
       
        var currentRow=$(this).closest("tr"); 
        
        var col1=currentRow.find("td:eq(0)").text(); // get SI no from checkbox
        var col2=currentRow.find("td:eq(1)").text(); // get item name
        var col3=currentRow.find("td:eq(2)").text(); // get item code
        var col4=currentRow.find("td:eq(3)").text(); // get supplier
        var col5=currentRow.find("td:eq(4)").text(); // get received qty
        var col6=currentRow.find("td:eq(5)").text(); // get accepted qty
        var col7=currentRow.find("td:eq(6)").text(); // get rejected qty
        var col8=currentRow.find("td:eq(7)").text(); // get remarks
        var col9=currentRow.find("td:eq(8)").text();
        var col10=currentRow.find("td:eq(9)").text();
        var col11=currentRow.find("td:eq(10)").text();
        var col12= currentRow.find("td:eq(11)").text();
       // var col12=currentRow.find("td:eq(11)").text();
        //var data=col1+"\n"+col2+"\n"+col3+"\n"+col4+"\n"+col5+"\n"+col6+"\n"+col7+"\n"+col8+"\n"+col9+"\n"+col10;
        
        //alert(data);
       /*  $('#user_Acc').val(col1);
        $('#user_Name').val(col2);
        $('#user_Nic').val(col3);
        $('#user_Address1').val(col4);      
        $('#user_Gender').val(col5);
        $('#user_Dob').val(col6);
        $('#user_Mobile').val(col7);
        $('#user_Nominee').val(col8);
        $('#user_Nomineenic').val(col9);
        $('#user_preStatus').val(col10);
        $('#user_newStatus').val(col11);
 */        
   
        $('#user_Mobile').val(col1);
        $('#user_Acc').val(col2);
        $('#user_Name').val(col3);
        $('#user_Nic').val(col4);      
        $('#user_Address1').val(col5);
        $('#user_Gender').val(col6);
        $('#user_Dob').val(col7);
        $('#user_CreatedDate').val(col8);
        $('#user_accStatus').val(col9);
        $('#user_reqStatus').val(col10);
    });

	 
</script>
</html>