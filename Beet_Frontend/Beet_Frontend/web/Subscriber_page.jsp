<%@page import="com.caller.*"%>
<%@page import="com.caller.controller.*"%>
<%@page import="com.caller.components.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@page import="com.caller.entity.UserPages"%>
<%@page import="com.caller.entity.UserInfo"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.lang.reflect.Array" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Base64"%>
<%@page import="java.text.DecimalFormat" %>

<!-- session handling -->
 <%

	response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control","no-store");  //Directs caches not to store the page under any circumstance
	//response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	 int timeout = session.getMaxInactiveInterval(); //seconds
	int refresh = session.getMaxInactiveInterval(); 
	response.setHeader("Refresh",refresh+"; URL = Login_page.jsp");
	
	response.setHeader("Refresh", timeout + "; URL = Login_page.jsp"); 
	/* response.setHeader("Refresh", refresh + "; URL = Login_page.jsp"); */
	/* response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
	/* session.invalidate(); */
	
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	System.out.println("URL of the System (msg 1) - "+basePath);
	
	
	String errCode=""+request.getParameter("err");
	String message = ""+request.getParameter("msg"); 

%>

<%
//logout session
if (session.getAttribute("current_user") == null || session.getAttribute("current_user").equals("")){
	response.sendRedirect("Login_page.jsp");
	System.out.print("login error redirect");
	return;
}

%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>EPAY - DashBoard</title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/layout.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/components.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/colors.min.css" rel="stylesheet" type="text/css">
	<link href="global_assets/css/icons/fontawesome/styles.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="assets/css/custom.css">
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
	<script src="global_assets/js/plugins/pickers/daterangepicker.js"></script>
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

	<script src="assets/js/app.js"></script>
	<script src="global_assets/js/demo_pages/picker_date.js"></script>
	<!-- /theme JS files -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"> </script>
	
	
<style type="text/css">
.class1 {
	width:65%;
	float:left;
	}
	
	.class2 {
	width:35%;
	float:right;
	}
	
	.class3{
	width:50%;
	float:left;
	}
	
	.class4{
	width:50%;
	float:right;
	}
	
</style>

 </head>

 
<%!
String userAccount = ""; 
%>
 <%!
	String uname = "";
%>

<%
/* Login */
String userCrateSatus = ""+session.getAttribute("addstatus");
String userDeleteSatus = ""+session.getAttribute("deleteStatus");
String updateuserStatus = ""+session.getAttribute("updatestatus");
String unlockStatus = ""+session.getAttribute("unlockStatus");
String addOrg=""+session.getAttribute("addOrg");
String replaceStatus = ""+session.getAttribute("replaceStatus");
String editOrg =""+session.getAttribute("editOrg");


System.out.println("*****addOrg****"+addOrg);
System.out.println("*****editOrg****"+editOrg);
System.out.println("****userCrateSatus**"+userCrateSatus);
System.out.println("****updateuserStatus**"+updateuserStatus);
System.out.println("****deleteuserStatus**"+userDeleteSatus);
System.out.println("****unlockStatus**"+unlockStatus);
System.out.println("****replaceStatus**"+replaceStatus);

String errCode1 = "" + request.getParameter("st");
UserInfo userData = new UserInfo();
userData = (UserInfo) session.getAttribute("current_user");

String current_user = userData.getUser_id();
 userAccount = userData.getSub_account_no(); 

String username = userData.getName();
uname= userData.getName();
/*  out.print(userAccount); */ 
String orgname=userData.getOrganization();
String createdBy=userData.getCreated_by();
String current_user_id = userData.getUser_autoid();
System.out.println("****current_user_id**"+current_user_id);



List<UserPages> pageList= new ArrayList<UserPages>();
  //ession.setAttribute("currentUserPages", pageList);
  pageList= (List<UserPages>)session.getAttribute("currentUserPages");
  System.out.println("orgname1= "+orgname);
  System.out.println("createdBy= "+createdBy);
  System.out.println("userid= "+current_user);
  System.out.println("Accountno="+userAccount);
  System.out.println("****@@@@@@@@@1**"+pageList.size());
  boolean pgSt=false;
  String[] userRolesArr=userData.getUsertype().split(",");
   for(int j=0;j<userRolesArr.length;j++){ 
   if(userRolesArr[j].equals("Subscriber")){
    pgSt=true;
    System.out.println("****@@@@@@@@@2**"+pgSt);
   }
  }
   System.out.println("****@@@@@@@@@2.1**"+pgSt);
  if(!pgSt){
	  session.invalidate();
   response.sendRedirect("index.jsp");
   return;
  }		 

  
  request.getSession().setAttribute("userName", username);
/* /Login */ 
%>  

<%!
Callers callobj = new Callers();
	int clicks = 0;
	int click2 = 10;
	
	double top1 =0;
	 double top2 =0;
	 double top3 =0;
	 double top4 =0;
	 DecimalFormat Decf = new DecimalFormat("0");
	
	
%>

<!-- to load 10 by 10 that retrive transactions from database for the user account no -->
<%
 	List<DataDisplay> tablelist = callobj.getTableDataByAccno(userAccount,clicks);
%>
<%
    String param = request.getParameter("integer");
		//String param = request.getParameter("button1");
    try
    {
       int i = Integer.parseInt(param);
	
       clicks = clicks + 10;
       click2 = 0 + 10;
    } 
    catch (NumberFormatException e)
    {
    	
    }
    
    
    String param1 = request.getParameter("integer1");
    
  //  String param1 = request.getParameter("button2");

    try
    {
       int i = Integer.parseInt(param1);
	
       click2 = click2 + 10;
       clicks = clicks - 10;
       
    } 
    catch (NumberFormatException e)
    {
    	
    }   
%> 
<%
	tablelist =  callobj.getTableDataByAccno(userAccount,clicks); 
%>   
<!-- end -->

<%
	/* Objects for widgets */ 
	//get system date by default
		Date dateParser = new Date();
		String date = new SimpleDateFormat("yyyy-MM-dd").format(dateParser);
		
		//get date start and end date range for the current month
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MONTH, 0);
		calendar.set(Calendar.DATE, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		Date monthFirstDay = calendar.getTime();
		calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		Date monthLastDay = calendar.getTime();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String startDateStr = df.format(monthFirstDay);
		String endDateStr = df.format(monthLastDay);
	
		List<TransactionAll> TransactionListDisplayByAccno  = callobj.getDetailsByAccNo(userAccount);

		DailySummaryTypeController dailySummaryTypeController = new DailySummaryTypeController();
		DailySummaryType dailSummaryTypeByAccNo = dailySummaryTypeController.dailySummaryTypeProcessorByAccNo(date, userAccount);
		DailySummaryStatusController dailySummaryStatusController = new DailySummaryStatusController();
		DailySummaryStatus dailySummaryStatusByAccNo = dailySummaryStatusController.dailyStatusProcessorByAccNo(date, userAccount);

		BarChartsControllerByAccNo barChartsControllerByAccNo = new BarChartsControllerByAccNo();
		TransactionSummaryController transactionSummaryController = new TransactionSummaryController();
		TransactionSummary transactionSummaryByAccNo = transactionSummaryController.transactionSummaryProccesorByAccNo(startDateStr,endDateStr, date, userAccount);

		int[] hourlySuccessTransactionArr = barChartsControllerByAccNo.createtHourlySuccessBarChartByAccNo(date, userAccount);
		int[] hourlyFailTransactionArr = barChartsControllerByAccNo.createtHourlyFailBarChartByAccNo(date, userAccount);
		int[] hourlyTimeoutTransactionArr = barChartsControllerByAccNo.createtHourlyTimeoutBarChartByAccNo(date, userAccount);
		int[] hourlyAllTransactionArr = barChartsControllerByAccNo.createtHourlyAllBarChartByAccNo(date, userAccount);

		MonthlyTransByDateController monthlyTransByDateController= new MonthlyTransByDateController();
		int[] monthlyTransactionByDate = monthlyTransByDateController.createMonthlyTransByDateByAccNo(startDateStr, endDateStr, userAccount);
		String[] dateHolder = monthlyTransByDateController.createDates();

		AllTransactionsSummaryByMonthController allTransactionsSummaryByMonthController = new AllTransactionsSummaryByMonthController();
		int[]allTransactionByMonth= allTransactionsSummaryByMonthController.createAllTransByMonth();

		List<ProfileUpdate> profileUpdates = callobj.getProfileUpdateDetailsByAccno(userAccount);

		ProfileTypeController userTypeController = new ProfileTypeController();
		ProfileType userType = userTypeController.userTypeProcessor();

		request.getSession().setAttribute("userAcount", userAccount);
		
		MerchantTypesByAccNoController merchantTypesByAccNoController = new MerchantTypesByAccNoController();
		MerchantTypesByAccNo merchantTypesByAccNo =merchantTypesByAccNoController.merchantTypeByAccNo(userAccount);
		
		/* /Objects for widgets */
		int top1c = merchantTypesByAccNo.getTop1Count();	
		int top2c = merchantTypesByAccNo.getTop2Count();
		int top3c = merchantTypesByAccNo.getTop3Count();
		int top4c = merchantTypesByAccNo.getTop4Count();
		 int total = top1c + top2c + top3c + top4c ;
		 
		 
		 
		 if(total==0){
			 
			  top1 =0;
			  top2 =0;
			  top3 =0;
			  top4 =0;
			 
		 }else{
		
	
		/* int total = merchantTypesByAccNo.getTop1Count()+merchantTypesByAccNo.getTop2Count()+merchantTypesByAccNo.getTop3Count()+merchantTypesByAccNo.getTop4Count(); */
		 top1 =(Double.valueOf(top1c)/Double.valueOf(total)*100);
		 top2 =(Double.valueOf(top2c)/Double.valueOf(total)*100);
		 top3 =(Double.valueOf(top3c)/Double.valueOf(total)*100);
			
		 
			top1 =Double.parseDouble(Decf.format(top1));
			top2 =Double.parseDouble(Decf.format(top2));
			top3 = Double.parseDouble(Decf.format(top3));
			top4 = Double.parseDouble(Decf.format(top4));
			
		 }
		/* out.print("///" + top1 +"///"+ top2 +"///"+ top3 +"///"+ top4 +"///"+total + "///"+ merchantTypesByAccNo.getTop1Count()); */
%>

<body class="sidebar-xs sidebar-secondary-hidden">

	<!-- Main navbar -->
	<div class="navbar navbar-expand-md navbar-dark">
	<!-- BEET Logo -->
		<div class="navbar-brand">
            <h3>EPAY</h3>
		</div>
	<!-- /BEET Logo -->
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

			<!-- Show the logged user -->
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown dropdown-user">
					<a href="#" class="navbar-nav-link d-flex align-items-center dropdown-toggle" data-toggle="dropdown">
						<img src="global_assets/images/placeholders/placeholder.jpg" class="rounded-circle mr-2" height="34" alt="">
						<span><%=userData.getName()%></span>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<a href="Login_page.jsp" class="dropdown-item"><i class="icon-switch2"></i> Logout</a>
					</div>
				</li>
			</ul>
			<!-- /Show the logged user -->
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
							<a href="#" class="navbar-nav-link sidebar-control sidebar-main-toggle d-none d-md-block">
								<i class="icon-paragraph-justify3"></i>
							</a>
						</li>
						<!-- Main -->
						<li class="nav-item">
							<a href="index.html" class="nav-link active">
								<i class="icon-home4"></i>
								<span>
									Dashboard
								</span>
							</a>
						</li>
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
				<div class="breadcrumb-line breadcrumb-line-light header-elements-md-inline">
					<div class="d-flex">
						<div class="breadcrumb">
							<a href="index.html" class="breadcrumb-item"><i class="icon-home2 mr-2"></i> Home</a>
							<span class="breadcrumb-item active">Dashboard</span>
						</div>

						<a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
					</div>

					<!-- <div class="header-elements d-none">
						<div class="breadcrumb justify-content-center">
							

							<div class="breadcrumb-elements-item dropdown p-0">
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
							</div>
						</div>
					</div> -->
				</div>
			</div>
			<!-- /page header -->


			<!-- Content area -->
			<div class="content">
			
			<!-- Dashboard content -->
				<div class="row">
                <div class="col-xl-12">
                    <div class="row">
                    <div class="col-xl-8">
                        <div class="row">
                        <div class="col-xl-12">
                        
                         <!-- whole line card -->
               <div class="row">
                   <div class="col-xl-12">
                   	<div class="row">
                   		<div class="col-xl-4"  style="border-color: 2px; border-style: none; ">
                   			<div class="row">
                   				<div class="col-sm-12"  style="border-color: 2px; border-style: none; ">
                   					<div class="card card-body bg-danger-400 has-bg-image">
										<div class="media">
											<div class="media-body">
												<h3 class="mb-0">
												<%/* wallet details */
												 // wallet total
												List<Wallet> walletDetails = null;
			
												walletDetails = callobj.getWalletDetailsByAccno(userAccount); 
												String amount="";
												double wallet_total = 0;
													
												 for(int x = 0; x < walletDetails.size(); x++){
													 
													amount = walletDetails.get(x).getAmount();
													/* out.println(amount);*/
													
													//decode amount of each wallet
													byte[] decodedBytes = Base64.getDecoder().decode(amount);
												     String decodedString = new String(decodedBytes);
												     wallet_total += Double.parseDouble(decodedString);
												 }  %>
										  <!-- /java code to get wallet amount  -->
										 <%= wallet_total %>
												
												</h3>
												<span class="text-uppercase font-size-xs">Wallet balance</span>
											</div>
			
											<div class="ml-3 align-self-center">
												<i class="icon-coins icon-3x opacity-75"></i>
											</div>
										</div>
									</div>
                   				</div>
                   				
                   				<div class="col-sm-12"  style="border-color: 2px; border-style: none; ">
                   					<div class="card card-body bg-success-400 has-bg-image">
										<div class="media">
											<div class="media-body">
												<h3 class="mb-0">389</h3>
												<span class="text-uppercase font-size-xs">points</span>
											</div>
			
											<div class="ml-3 align-self-center">
												<i class="icon-star-half icon-3x opacity-75"></i>
											</div>
										</div>
									</div>
                   				</div>
                   			</div>
                   		</div>
                   		
                   		<div class="col-xl-8" style="border-color: 2px; border-style: none; height: 250px;">
                   			<!-- Donut multiples -->
								<div class="card" style="border-color: 2px; border-style: none; height: 225px;">
									<div class="card-body">
										<div class="chart-container" >
											<div class="chart has-fixed-height" id="pie_multiples" style="border-color: 2px; border-style: none;"></div>
										</div>
									</div>
								</div>
							<!-- /donut multiples -->
                   		</div>
                   		
                   	
                   	</div>
                   		
                  		
                   </div>     
							  
                             
          </div> 
                            <!-- /whole line card -->
                              
                            <div class="row">
                                    <!--Yearly Total Count-->
							 <div class="col-lg-4">

								<div class="card bg-teal-300">
									<div class="card-body">
										<div class="d-flex">
											<h3 class="font-weight-semibold mb-0"><!----></h3>
											<!--<span class="badge bg-teal-800 badge-pill align-self-center ml-auto">10</span>-->
					                	</div>
					                	
					                	<div> 
					                	<div class="class1">                                 
											<div class="font-size-lg opacity-80">
											<span class=" mb-0  ml-0" style="font-size: 15px; align-content: center;">Total transactions </span>
											<span class=" mb-0  ml-5" style="font-size: 25px;"> <%= transactionSummaryByAccNo.getAllTransactionCount()%> </span></div>
										</div>
                                        <div class= "class2">
											<!-- <h6 style="align-content: center;">Amount</h6> -->
                                            <div class="font-size-lg opacity-80">
                                             <span class=" mb-2  ml-1" style="font-size: 12px; align-content: center;"> Amount </span>                                
                                            <span class=" mb-0  ml-1" style="font-size: 16px; align-content: center; margin-top: 20px;"> <%= transactionSummaryByAccNo.getAllTransactionAmount() %> </span>                                          
                                           </div>
										</div>
                                       </div>
									</div>

								
									<div id="today-revenue"></div>
									
									
								</div>
								<!-- /members online -->

							</div>
                                <!--/Yearly Total Count-->
                                
                                
                                <!--Monthly Total Count-->
							<div class="col-lg-4">

								<!-- Current server load -->
								<div class="card bg-pink-300">
									<div class="card-body">
									<div> 
					                	<div class="class3">  
                                        <!-- <h5 id="txt"></h5> --> <!-- month should generate -->                            
											<div class="font-size-lg opacity-80">
											
										 <div id="txt" style="font-size: 20px;"></div>
										 <div>
										 <span class=" mb-2  ml-0" style="font-size: 12px; align-content: center;"> Amount </span>                                
                                         <span class=" mb-0  ml-1" style="font-size: 12px; align-content: center; margin-top: 20px;"> <%= transactionSummaryByAccNo.getMonthlyTransactionAmount() %> </span>                                                                                    
										 </div>
										 </div>
										 </div>
                                        <div class= "class4">
											<!-- <h6 style="align-content: center;">Amount</h6> -->
                                            <div class="font-size-lg opacity-80">
                                           <span class=" mb-0  ml-2" style="font-size: 15px; ">Transactions </span>
											<span class=" mb-0  ml-4" style="font-size: 25px;"> <%= transactionSummaryByAccNo.getMonthlyTransactionCount() %> </span></div>										
                                            </div>
										
                                       </div>
									</div>

									<div id="monthly-sales-stats"></div>
								</div>
								<!-- /current server load -->

							</div>
                                <!--/Monthly Total Count-->

                                <!--Daily Total Count-->
							<div class="col-lg-4">

								<!-- Today's revenue -->
							<div class="card bg-blue-300">
									<div class="card-body">
									<div> 
					                	<div class="class1">  
                                        <!-- <h5 id="txt"></h5> --> <!-- month should generate -->                            
											<div class="font-size-lg opacity-80">
											<span class=" mb-0  ml-0" style="font-size: 15px; ">Today transactions </span>
											<span class=" mb-0  ml-5" style="font-size: 25px;" id = "todaytransaction">  </span></div>
										</div>
                                        <div class= "class2">
											<!-- <h6 style="align-content: center;">Amount</h6> -->
                                            <div class="font-size-lg opacity-80">
                                             <span class=" mb-5  ml-1 " style="font-size: 12px; align-content: center;"> Amount </span>                                
                                            <span class=" mb-0  ml-1 pt-5" style="font-size: 16px; align-content: center; " id="todayamount"> </span>                                          
                                           </div>
										</div>
                                       </div>
									
									</div>

									<!-- <div id="today-revenue"></div> -->
									<div class="container-fluid">
										<div id="members-online" style="border:thin; border-color: #FFF; border-style: none;"></div>
									</div>
										
									
								</div>  
								<!-- /today's revenue -->

							</div>
                                <!--Daily Total Count-->
						</div>
                            </div>
                        </div>
                        </div>
                        <!--Calender-->
                        <div class="col-xl-4"  style="border-color: 2px; border-style: none; ">
                        
                            <div class="row">
                            <div class="col-sm-12">
                               
                            <!-- Infographic style -->
								<div class="card" style="margin-top: 0px;  max-height: 420px">
									
		
									<div class="card-body" >
										<div id ="todaydate"></div>
										<div class="chart-container">
										<div class="chart has-fixed-height" id="pie_infographic" _echarts_instance_="ec_1571047017857" style="-webkit-tap-highlight-color: transparent; user-select: none; position: relative;"><div style="position: relative; overflow: hidden; width: 318px; height: 400px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="318" height="400" style="position: absolute; left: 0px; top: 0px; width: 318px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(0, 0, 0, 0.75); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 13px/20px Roboto, sans-serif; padding: 10px 15px; left: 317px; top: 0px;"></div></div>
									
										</div>
									</div>
								</div>
                                   
						<!-- /infographic style -->
                            </div>
                            </div>
                        </div>
                        <!--Calender-->
                    </div>
                    </div>
                </div>
				<!-- /dashboard content -->
				
                
				<!--All Transaction Table-->
				<div class="card">
					<div class="card-header header-elements-inline">
						<h5 class="card-title">All Transactions</h5>
						<div class="header-elements">
	                	</div>
					</div>

					<div class="card-body">
						<table class="table datatable-basic table-striped ">
							<thead>
									<tr>
										<th>No</th>
										<th>Transaction ID</th>
										<th>Date</th>
										<th>Account To</th>
										<th>Account From</th>
										<th>Transaction Type</th>									
										<th>Amount</th>
										<th>Status</th>
										
									</tr>
							</thead>
							<tbody id="mytbody">
								
								
								<%  for(int i=0;i<tablelist.size();i++){%>
	 <% 
										String accto=null;
										String accfrom=null;
										
										/*  System.out.println(tablelist.get(i).getT_id()); */
										 
										 String SplitAccountNo = tablelist.get(i).getAccount_no();
										 
										 SplitAccountNo= SplitAccountNo.replace(" ", "");
										 String[] accnoArr= SplitAccountNo.split(",");
											
										/* out.print(i+1+"."); */
										if(accnoArr.length ==1){
											accto="not recorded";
											accfrom = accnoArr[0];
										}else{
											accfrom=accnoArr[0];
											accto=accnoArr[1];
										}
										
										/* out.print(accfrom +"|" + accto);
										out.print("***"); */
										%>
 
								<tr>
									<td><%= i+1 %></td>									
									<td><%=tablelist.get(i).getT_id()%></td>
									<td><%=tablelist.get(i).getDate()%></td>
									<td><%=accfrom%> </td>
									<td><%=accto%></td> 
									<td><%=tablelist.get(i).getType()%></td>
									<td><%=tablelist.get(i).getAmount()%></td>
									<td><%=tablelist.get(i).getStatus()%></td>
									
									
								</tr>
								<%}%>
							
							
							</tbody>
						</table>
						<div>
							<span style="float:right;margin-left:5px;">
								<form id="idForm" action="" method="post">
									<input type="hidden" name="integer" value="1"/>
									 <input id="front" type="submit" class="btn btn-primary" value="Next" onclick="check2()"/>
								</form>
							</span>
							<span style="float:right;">
								<form id="idForm" action="" method="post">
									<input type="hidden" name="integer1"  value="1"/>
									 <input id="back" type="submit" class="btn btn-primary" value="Prev" onclick="check()"/>
								</form>
							</span>
						</div>
					</div>
			</div>
			
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
	


<script>
	
// Calender script
	  /*******calendar*********/

$(document).ready(function () {
	$('#mytbody tr').each(function(){
    	var col_val = $(this).find("td:last").html();
    	console.log(col_val);
	    
    	if ($.trim(col_val) === 'fail')  {
	        $(this).css("background-color","#ffcdd2");
	    }
	    if ($.trim(col_val) === 'timeout'){
	    	 $(this).css("background-color","#ffe0b2");
	    }
});
	
	
	
    setSysdate();
        var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]; 
        var dayNames= [ "Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday" ];

        var newDate = new Date();
            newDate.setDate(newDate.getDate());
	
            var mon = newDate.getMonth()+1;
        	var today= newDate.getFullYear() +"-" + mon + "-" + newDate.getDate()
        	$('#todaydate').text(today);
        	
        setInterval( function() {
	       var hours = new Date().getHours();
	       $(".hour").html(( hours < 10 ? "0" : "" ) + hours);
           var seconds = new Date().getSeconds();
	       $(".second").html(( seconds < 10 ? "0" : "" ) + seconds);
           var minutes = new Date().getMinutes();
	       $(".minute").html(( minutes < 10 ? "0" : "" ) + minutes);
    
}, 2000);	
    
function setSysdate(){
        var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]; 
        var dayNames= [ "Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday" ];

           var newDate = new Date();
           newDate.setDate(newDate.getDate());
           $(".month span,.month2 span").text(monthNames[newDate.getMonth()]);
           $("#txt").text(monthNames[newDate.getMonth()]);
           $(".date span,.date2 span").text(newDate.getDate())
           $(".day span,.day2 span").text(dayNames[newDate.getDay()]);

}
    

document.getElementById("cale").onclick = function () { 
         var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]; 
         var dayNames= [ "Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday" ];
    
		      $("#datepicker").datepicker( {
                       
						firstDay: 1,
						
						prevText: '<i class="fa fa-fw fa-angle-left"></i>',
							nextText: '<i class="fa fa-fw fa-angle-right"></i>',
						
						//bg
						
						  onSelect: function() {
							var date = $.datepicker.formatDate("dd", $(this).datepicker('getDate'));
								$('span.bgText').text(date);
                            var month = $(this).datepicker('getDate').getMonth(); 
                               $(".month span,.month2 span").text(monthNames[month]);
                             
                               var wdate = $.datepicker.formatDate("yy-mm-dd", $(this).datepicker('getDate'));
                               
                               window.location.replace("Admin_page.jsp?wdate="+wdate);
                               
   							<%
   							String wdate=request.getParameter("wdate");
   					        if(wdate!=null){
   					         	dailySummaryStatusByAccNo = dailySummaryStatusController.dailyStatusProcessorByAccNo(wdate, userAccount);
					         	dailSummaryTypeByAccNo = dailySummaryTypeController.dailySummaryTypeProcessorByAccNo(wdate, userAccount);
					          	transactionSummaryByAccNo = transactionSummaryController.transactionSummaryProccesorByAccNo("2019-11-01_14:51:10","2019-11-31_14:51:10",wdate,userAccount);
					          	hourlySuccessTransactionArr = barChartsControllerByAccNo.createtHourlySuccessBarChartByAccNo(wdate, userAccount);
					           	hourlyFailTransactionArr = barChartsControllerByAccNo.createtHourlyFailBarChartByAccNo(wdate,userAccount);
					           	hourlyTimeoutTransactionArr = barChartsControllerByAccNo.createtHourlyTimeoutBarChartByAccNo(wdate, userAccount);
					           	hourlyAllTransactionArr = barChartsControllerByAccNo.createtHourlyAllBarChartByAccNo(wdate, userAccount);
					           	monthlyTransactionByDate = monthlyTransByDateController.createMonthlyTransByDate("2019-11-01_14:51:10","2019-11-31_14:51:10");
					             
					          
   					          
   					        }
   					        
   							//Display(wdate); 
   							%>
                               //var wholedate = $.datepicker.formatDate
                                // alert(wdate);

                                 $('#todaydate').text(wdate);
                               
						          $(document).on("click", function(event){
                                      var $trigger = $("#datepicker" );
                                            if($trigger !== event.target && !$trigger.has(event.target).length){
                                                $("#datepicker" ).hide();
                                
                                                    }            
                                        });                   
                           
                            $( ".block" ).click(function() {
                                $( ".anim04c" ).stop();
                                });
							}
                                    
                
				});
				 
					
 };

$(".outer").on({
    mousedown:function(){
        $(".dribbble").css("opacity","1");
    },
    mouseup:function(){
        $(".dribbble").css("opacity","0");
    }
});



});

/*******calendar*********/
</script>

	   
 <script type="text/javascript">
 
	/* bar charts script */
	$(document).ready(function(){
	console.log("dfiuehrg9he***********************************");
		 var barData = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];
		
		 <%for(int i=0; i<hourlySuccessTransactionArr.length; i++){%>
		barData[<%=i%>] = "<%=hourlySuccessTransactionArr[i] %>";
		<%}%>
		  
		_BarChart('#hours-available-bars', 24, 40, true, 'elastic', 1200, 50, '#4CAF50', 'hours', barData);
		 
		 var barData1 = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];
		<%for(int i=0; i< hourlyTimeoutTransactionArr.length; i++){%>
		barData1[<%=i%>] = "<%=hourlyTimeoutTransactionArr[i] %>";
		<%}%>  
		
		_BarChart('#hours-available-bars1', 24, 40, true, 'elastic', 1200, 50, '#777777', 'hours' , barData1);
		
		  var barData2 = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];
		<%for(int i=0; i< hourlyFailTransactionArr.length; i++){%>
		barData2[<%=i%>] = "<%=hourlyFailTransactionArr[i] %>";
		<%}%>  
		
		_BarChart('#goal-bars', 24, 40, true, 'elastic', 1200, 50, '#f44336', 'hours' , barData2);
		
		var barData3 = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];

			 <%for(int i=0; i< hourlyAllTransactionArr.length; i++){%>
			barData3[<%=i%>] = "<%=hourlyAllTransactionArr[i] %>";
			<%}%>  
			_BarChart('#members-online', 24, 75, true, 'elastic', 1200, 50, 'rgba(255,255,255,0.5)', 'members', barData3); 
	});
	
	
	
	 var _BarChart = function(element, barQty, height, animate, easing, duration, delay, color, tooltip, barData) {
	        if (typeof d3 == 'undefined') {
	            console.warn('Warning - d3.min.js is not loaded.');
	            return;
	        }

	        // Initialize chart only if element exsists in the DOM
	        if($(element).length > 0) {


	            // Basic setup
	            // ------------------------------

	            // Add data set
	            //var bardata = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];
	        	var bardata= barData;
	           // for (var i=0; i < barQty; i++) {
	          //      bardata.push(Math.round(Math.random()*10) + 10);
	          //  }

	            // Main variables
	            var d3Container = d3.select(element),
	                width = d3Container.node().getBoundingClientRect().width;
	            


	            // Construct scales
	            // ------------------------------

	            // Horizontal
	            var x = d3.scale.ordinal()
	                .rangeBands([0, width], 0.3);

	            // Vertical
	            var y = d3.scale.linear()
	                .range([0, height]);



	            // Set input domains
	            // ------------------------------

	            // Horizontal
	            x.domain(d3.range(0, bardata.length));

	            // Vertical
	            y.domain([0, d3.max(bardata)]);



	            // Create chart
	            // ------------------------------

	            // Add svg element
	            var container = d3Container.append('svg');

	            // Add SVG group
	            var svg = container
	                .attr('width', width)
	                .attr('height', height)
	                .append('g');



	            //
	            // Append chart elements
	            //

	            // Bars
	            if(element== '#members-online' || element== '#goal-bars' || element== '#hours-available-bars1' || element =='#hours-available-bars'){
	            var bars = svg.selectAll('rect')
	                .data(bardata)
	                .enter()
	                .append('rect')
	                    .attr('class', 'd3-random-bars')
	                    .attr('width', x.rangeBand())
	                    .attr('x', function(d,i) {
	                        return x(i);
	                    })
	                    .style('fill', color);

	            }
	            

	            // Tooltip
	            // ------------------------------

	            var tip = d3.tip()
	                .attr('class', 'd3-tip')
	                .offset([-10, 0]);

	            // Show and hide
	            if(tooltip == 'hours' || tooltip == 'goal' || tooltip == 'members') {
	                bars.call(tip)
	                    .on('mouseover', tip.show)
	                    .on('mouseout', tip.hide);
	            }

	            // Daily meetings tooltip content
	            if(tooltip == 'hours') {
	                tip.html(function (d, i) {
	                    return '<div class="text-center">' +
	                            '<h6 class="m-0">' + d + '</h6>' +
	                            '<span class="font-size-sm">transactions</span>' +
	                            '<div class="font-size-sm">' + i + ':00' + '</div>' +
	                        '</div>'
	                });
	            }

	            // Statements tooltip content
	            if(tooltip == 'goal') {
	                tip.html(function (d, i) {
	                    return '<div class="text-center">' +
	                            '<h6 class="m-0">' + d + '</h6>' +
	                            '<span class="font-size-sm">transactions</span>' +
	                            
	                        '</div>'
	                });
	            }

	            // Online members tooltip content
	            if(tooltip == 'members') {
	                tip.html(function (d, i) {
	                    return '<div class="text-center">' +
	                            '<h6 class="m-0">' + d  + '</h6>' +
	                            '<span class="font-size-sm">transactions</span>' +
	                            '<div class="font-size-sm">' + i + ':00' + '</div>' +
	                        '</div>'
	                });
	            }



	            // Bar loading animation
	            // ------------------------------

	            // Choose between animated or static
	            if(animate) {
	                withAnimation();
	            } else {
	                withoutAnimation();
	            }

	            // Animate on load
	            function withAnimation() {
	                bars
	                    .attr('height', 0)
	                    .attr('y', height)
	                    .transition()
	                        .attr('height', function(d) {
	                            return y(d);
	                        })
	                        .attr('y', function(d) {
	                            return height - y(d);
	                        })
	                        .delay(function(d, i) {
	                            return i * delay;
	                        })
	                        .duration(duration)
	                        .ease(easing);
	            }

	            // Load without animateion
	            function withoutAnimation() {
	                bars
	                    .attr('height', function(d) {
	                        return y(d);
	                    })
	                    .attr('y', function(d) {
	                        return height - y(d);
	                    })
	            }



	            // Resize chart
	            // ------------------------------

	            // Call function on window resize
	            $(window).on('resize', barsResize);

	            // Call function on sidebar width change
	            $(document).on('click', '.sidebar-control', barsResize);

	            // Resize function
	            // 
	            // Since D3 doesn't support SVG resize by default,
	            // we need to manually specify parts of the graph that need to 
	            // be updated on window resize
	            function barsResize() {

	                // Layout variables
	                width = d3Container.node().getBoundingClientRect().width;


	                // Layout
	                // -------------------------

	                // Main svg width
	                container.attr('width', width);

	                // Width of appended group
	                svg.attr('width', width);

	                // Horizontal range
	                x.rangeBands([0, width], 0.3);


	                // Chart elements
	                // -------------------------

	                // Bars
	                svg.selectAll('.d3-random-bars')
	                    .attr('width', x.rangeBand())
	                    .attr('x', function(d,i) {
	                        return x(i);
	                    });
	            }
	        }
	    };
	        
    $(document).ready(function(){
    	//_DailyRevenueLineChart('#today-revenue', 75);
    	_MonthlySalesAreaChart('#monthly-sales-stats',75, 'rgba(255,255,255,0.5)');
    });
    
    var _MonthlySalesAreaChart = function(element, height, color) {
        if (typeof d3 == 'undefined') {
            console.warn('Warning - d3.min.jsmonthNames is not loaded.');
            return;
        }

        // Initialize chart only if element exsists in the DOM
        if($(element).length > 0) {


            // Basic setup
            // ------------------------------

            // Define main variables
            var d3Container = d3.select(element),
                margin = {top: 25, right: 15, bottom: 25, left: 15},
                width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right,
                height = height - margin.top - margin.bottom;

            // Date and time format
            var parseDate = d3.time.format('%Y-%m-%d').parse,
                bisectDate = d3.bisector(function(d) { return d.date; }).left,
                formatDate = d3.time.format('%b %d');


            // Create SVG
            // ------------------------------

            // Container
            var container = d3Container.append('svg');

            // SVG element
            var svg = container
                .attr('width', width + margin.left + margin.right)
                .attr('height', height + margin.top + margin.bottom)
                .append('g')
                    .attr('transform', 'translate(' + margin.left + ',' + margin.top + ')')



            // Construct chart layout
            // ------------------------------

            // Area
            var area = d3.svg.area()
                .x(function(d) { return x(d.date); })
                .y0(height)
                .y1(function(d) { return y(d.value); })
                .interpolate('monotone')


            // Construct scales
            // ------------------------------

            // Horizontal
            var x = d3.time.scale().range([0, width ]);

            // Vertical
            var y = d3.scale.linear().range([height, 0]);


            // Create axes
            // ------------------------------

            // Horizontal
            var xAxis = d3.svg.axis()
                .scale(x)
                .orient('bottom')
                .ticks(d3.time.days, 6)
                .innerTickSize(4)
                .tickPadding(8)
                .tickFormat(d3.time.format('%b %d'));


            // Load data
            // ------------------------------

          // d3.json('../../../../global_assets/demo_data/dashboard/monthly_sales.json', function (error, data) {

                // Show what's wrong if error
               // if (error) return console.error(error);

                
                var data = [
                	  {
                		    "date": "<%= dateHolder[0].toString()%>",
                		    "value": <%=monthlyTransactionByDate[0] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[1].toString()%>",
                		    "value": <%=monthlyTransactionByDate[1] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[2].toString()%>",
                		    "value": <%=monthlyTransactionByDate[2] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[3].toString()%>",
                		    "value": <%=monthlyTransactionByDate[3] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[4].toString()%>",
                		    "value": <%=monthlyTransactionByDate[4] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[5].toString()%>",
                		    "value": <%=monthlyTransactionByDate[5] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[6].toString()%>",
                		    "value":<%=monthlyTransactionByDate[6] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[7].toString()%>",
                		    "value": <%=monthlyTransactionByDate[7] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[8].toString()%>",
                		    "value": <%=monthlyTransactionByDate[8] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[9].toString()%>",
                		    "value": <%=monthlyTransactionByDate[9] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[10].toString()%>",
                		    "value": <%=monthlyTransactionByDate[10] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[11].toString()%>",
                		    "value":<%=monthlyTransactionByDate[11] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[12].toString()%>",
                		    "value": <%=monthlyTransactionByDate[12] %> 
                		  },
                		  {
                		    "date":  "<%= dateHolder[13].toString()%>",
                		    "value": <%=monthlyTransactionByDate[13] %>
                		  },
                		  {
                		    "date": "<%= dateHolder[14].toString()%>",
                		    "value": <%=monthlyTransactionByDate[14] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[15].toString()%>",
                		    "value": <%=monthlyTransactionByDate[15] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[16].toString()%>",
                		    "value": <%=monthlyTransactionByDate[16] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[17].toString()%>",
                		    "value": <%=monthlyTransactionByDate[17] %>
                		  },
                		  {
                		    "date":  "<%= dateHolder[18].toString()%>",
                		    "value": <%=monthlyTransactionByDate[18] %>
                		  },
                		  {
                		  "date":  "<%= dateHolder[19].toString()%>",
                		  "value":<%=monthlyTransactionByDate[19] %>
                		  },
                		  {
                		  "date":  "<%= dateHolder[20].toString()%>",
                		  "value": <%=monthlyTransactionByDate[20] %>
                		  },
                		  {
                		  "date":  "<%= dateHolder[21].toString()%>",
                		  "value": <%=monthlyTransactionByDate[21] %>
                		  },
                		  {
                		  "date":  "<%= dateHolder[22].toString()%>",
                		  "value": <%=monthlyTransactionByDate[22] %>
                		  },
                		  {
                		  "date":  "<%= dateHolder[23].toString()%>",
                		  "value": <%=monthlyTransactionByDate[23] %>
                		  },
                		  {
                		  "date":  "<%= dateHolder[24].toString()%>",
                		  "value": <%=monthlyTransactionByDate[24] %>
                		  },
                		  {
                		  "date":  "<%= dateHolder[25].toString()%>",
                		  "value":<%=monthlyTransactionByDate[25] %>
                		  },
                		  {
                		  "date":  "<%= dateHolder[26].toString()%>",
                		  "value": <%=monthlyTransactionByDate[26] %>
                		  },
                		  {
                		  "date":  "<%= dateHolder[27].toString()%>",
                		  "value": <%=monthlyTransactionByDate[27] %>
                		  },
                		  {
                		  "date":  "<%= dateHolder[28].toString()%>",
                		  "value": <%=monthlyTransactionByDate[28] %>
                		  },
                		  {
                		  "date":  "<%= dateHolder[29].toString()%>",
                		  "value": <%=monthlyTransactionByDate[29] %>
                		  },
                		  {
                		  "date":  "<%= dateHolder[30].toString()%>",
                		  "value": <%=monthlyTransactionByDate[30] %>
                		  }
                		]
                	 
              
                
                
                // Pull out values
                data.forEach(function (d) {
                    d.date = parseDate(d.date);
                    d.value = +d.value;
                });

                // Get the maximum value in the given array
                var maxY = d3.max(data, function(d) { return d.value; });

                // Reset start data for animation
                var startData = data.map(function(datum) {
                    return {
                        date: datum.date,
                        value: 0
                    };
                });


                // Set input domains
                // ------------------------------

                // Horizontal
                x.domain(d3.extent(data, function(d, i) { return d.date; }));

                // Vertical
                y.domain([0, d3.max( data, function(d) { return d.value; })]);



                //
                // Append chart elements
                //

                // Append axes
                // -------------------------

                // Horizontal
                var horizontalAxis = svg.append('g')
                    .attr('class', 'd3-axis d3-axis-horizontal d3-axis-solid')
                    .attr('transform', 'translate(0,' + height + ')')
                    .call(xAxis);

                // Add extra subticks for hidden hours
                horizontalAxis.selectAll('.d3-axis-subticks')
                    .data(x.ticks(d3.time.days), function(d) { return d; })
                    .enter()
                        .append('line')
                        .attr('class', 'd3-axis-subticks')
                        .attr('y1', 0)
                        .attr('y2', 4)
                        .attr('x1', x)
                        .attr('x2', x);



                // Append area
                // -------------------------

                // Add area path
                svg.append('path')
                    .datum(data)
                    .attr('class', 'd3-area')
                    .attr('d', area)
                    .style('fill', color)
                    .transition() // begin animation
                        .duration(1000)
                        .attrTween('d', function() {
                            var interpolator = d3.interpolateArray(startData, data);
                            return function (t) {
                                return area(interpolator (t));
                            }
                        });



                // Append crosshair and tooltip
                // -------------------------

                //
                // Line
                //

                // Line group
                var focusLine = svg.append('g')
                    .attr('class', 'd3-crosshair-line')
                    .style('display', 'none');

                // Line element
                focusLine.append('line')
                    .attr('class', 'vertical-crosshair')
                    .attr('y1', 0)
                    .attr('y2', -maxY)
                    .style('stroke', '#e5e5e5')
                    .style('shape-rendering', 'crispEdges')


                //
                // Pointer
                //

                // Pointer group
                var focusPointer = svg.append('g')
                    .attr('class', 'd3-crosshair-pointer')
                    .style('display', 'none');

                // Pointer element
                focusPointer.append('circle')
                    .attr('r', 3)
                    .style('fill', '#fff')
                    .style('stroke', color)
                    .style('stroke-width', 1)


                //
                // Text
                //

                // Text group
                var focusText = svg.append('g')
                    .attr('class', 'd3-crosshair-text')
                    .style('display', 'none');

                // Text element
                focusText.append('text')
                    .attr('dy', -10)
                    .style('font-size', 12);


                //
                // Overlay with events
                //

                svg.append('rect')
                    .attr('class', 'd3-crosshair-overlay')
                    .style('fill', 'none')
                    .style('pointer-events', 'all')
                    .attr('width', width)
                    .attr('height', height)
                        .on('mouseover', function() {
                            focusPointer.style('display', null);        
                            focusLine.style('display', null)
                            focusText.style('display', null);
                        })
                        .on('mouseout', function() {
                            focusPointer.style('display', 'none'); 
                            focusLine.style('display', 'none');
                            focusText.style('display', 'none');
                        })
                        .on('mousemove', mousemove);


                // Display tooltip on mousemove
                function mousemove() {

                    // Define main variables
                    var mouse = d3.mouse(this),
                        mousex = mouse[0],
                        mousey = mouse[1],
                        x0 = x.invert(mousex),
                        i = bisectDate(data, x0),
                        d0 = data[i - 1],
                        d1 = data[i],
                        d = x0 - d0.date > d1.date - x0 ? d1 : d0;

                    // Move line
                    focusLine.attr('transform', 'translate(' + x(d.date) + ',' + height + ')');

                    // Move pointer
                    focusPointer.attr('transform', 'translate(' + x(d.date) + ',' + y(d.value) + ')');

                    // Reverse tooltip at the end point
                    if(mousex >= (d3Container.node().getBoundingClientRect().width - focusText.select('text').node().getBoundingClientRect().width - margin.right - margin.left)) {
                        focusText.select('text').attr('text-anchor', 'end').attr('x', function () { return (x(d.date) - 15) + 'px' }).text(formatDate(d.date) + ' - ' + d.value + ' ');
                    }
                    else {
                        focusText.select('text').attr('text-anchor', 'start').attr('x', function () { return (x(d.date) + 15) + 'px' }).text(formatDate(d.date) + ' - ' + d.value + '');
                    }
                }



                // Resize chart
                // ------------------------------

                // Call function on window resize
                $(window).on('resize', monthlySalesAreaResize);

                // Call function on sidebar width change
                $(document).on('click', '.sidebar-control', monthlySalesAreaResize);

                // Resize function
                // 
                // Since D3 doesn't support SVG resize by default,
                // we need to manually specify parts of the graph that need to 
                // be updated on window resize
                function monthlySalesAreaResize() {

                    // Layout variables
                    width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right;


                    // Layout
                    // -------------------------

                    // Main svg width
                    container.attr('width', width + margin.left + margin.right);

                    // Width of appended group
                    svg.attr('width', width + margin.left + margin.right);


                    // Axes
                    // -------------------------

                    // Horizontal range
                    x.range([0, width]);

                    // Horizontal axis
                    svg.selectAll('.d3-axis-horizontal').call(xAxis);

                    // Horizontal axis subticks
                    svg.selectAll('.d3-axis-subticks').attr('x1', x).attr('x2', x);


                    // Chart elements
                    // -------------------------

                    // Area path
                    svg.selectAll('.d3-area').datum(data).attr('d', area);

                    // Crosshair
                    svg.selectAll('.d3-crosshair-overlay').attr('width', width);
                }
          //  });
        }
    };

    $(document).ready(function(){
    	var todayTransaction = "<%= transactionSummaryByAccNo.getDailyTransactionCount()%>";
    	$('#todaytransaction').text(todayTransaction); 
    	var todayamount = "<%= transactionSummaryByAccNo.getDailyTransactionAmount()%>"
    	$('#todayamount').text(todayamount);
    });
    
    $(document).ready(function(){
    	
    	 var success_count_js ="<%=dailySummaryStatusByAccNo.getSuccessCount()%>";
    	var success_percentage_js ="<%=dailySummaryStatusByAccNo.getSuccessPer()%>";
    	var fail_count_js = "<%= dailySummaryStatusByAccNo.getFailCount()%>";
    	var fail_percentage_js= "<%=dailySummaryStatusByAccNo.getFailPer()%>";
    	var timeout_count_js = "<%=dailySummaryStatusByAccNo.getTimeoutCount()%>";
    	var timeout_percentage_js = "<%=dailySummaryStatusByAccNo.getTimeoutPer()%>"; 
    	_RoundedProgressChart('#hours-available-progress', 38, 2, '#4CAF50', success_percentage_js, 'icon-shield-check text-success', 'Success', success_count_js);
    	_RoundedProgressChart('#goal-progress', 38, 2, '#f44336', fail_percentage_js, 'icon-shield-notice text-danger', 'Fail',fail_count_js );
    	_RoundedProgressChart('#hours-available-progress1', 38, 2, '#777777', timeout_percentage_js, 'icon-notification2 text-grey', 'Time Out',timeout_count_js );   
    });
    
    var _RoundedProgressChart = function(element, radius, border, color, end, iconClass, textTitle, textAverage) {
        if (typeof d3 == 'undefined') {
            console.warn('Warning - d3.min.js is not loaded.');
            return;
        }

        // Initialize chart only if element exsists in the DOM
        if($(element).length > 0) {


            // Basic setup
            // ------------------------------

            // Main variables
            var d3Container = d3.select(element),
                startPercent = 0,
                iconSize = 32,
                endPercent = end,
                twoPi = Math.PI * 2,
                formatPercent = d3.format('.0%'),
                boxSize = radius * 2;

            // Values count
            var count = Math.abs((endPercent - startPercent) / 0.01);

            // Values step
            var step = endPercent < startPercent ? -0.01 : 0.01;



            // Create chart
            // ------------------------------

            // Add SVG element
            var container = d3Container.append('svg');

            // Add SVG group
            var svg = container
                .attr('width', boxSize)
                .attr('height', boxSize)
                .append('g')
                .attr('transform', 'translate(' + (boxSize / 2)  + ',' + (boxSize / 2) + ')');



            // Construct chart layout
            // ------------------------------

            // Arc
            var arc = d3.svg.arc()
                .startAngle(0)
                .innerRadius(radius)
                .outerRadius(radius - border);



            //
            // Append chart elements
            //

            // Paths
            // ------------------------------

            // Background path
            svg.append('path')
                .attr('class', 'd3-progress-background')
                .attr('d', arc.endAngle(twoPi))
                .style('fill', '#eee');

            // Foreground path
            var foreground = svg.append('path')
                .attr('class', 'd3-progress-foreground')
                .attr('filter', 'url(#blur)')
                .style('fill', color)
                .style('stroke', color);

            // Front path
            var front = svg.append('path')
                .attr('class', 'd3-progress-front')
                .style('fill', color)
                .style('fill-opacity', 1);



            // Text
            // ------------------------------

            // Percentage text value
            var numberText = d3.select(element)
                .append('h2')
                    .attr('class', 'pt-1 mt-2 mb-1')

            // Icon
            d3.select(element)
                .append('i')
                    .attr('class', iconClass + ' counter-icon')
                    .attr('style', 'top: ' + ((boxSize - iconSize) / 2) + 'px');

            // Title
            d3.select(element)
                .append('div')
                    .text(textTitle);

            // Subtitle
            d3.select(element)
                .append('div')
                    .attr('class', 'font-size-sm text-muted mb-3')
                    .text(textAverage);



            // Animation
            // ------------------------------

            // Animate path
            function updateProgress(progress) {
                foreground.attr('d', arc.endAngle(twoPi * progress));
                front.attr('d', arc.endAngle(twoPi * progress));
                numberText.text(formatPercent(progress));
            }

            // Animate text
            var progress = startPercent;
            (function loops() {
                updateProgress(progress);
                if (count > 0) {
                    count--;
                    progress += step;
                    setTimeout(loops, 10);
                }
            })();
        }
    };
    
    $(document).ready(function(){
    	_DailyRevenueLineChart('#today-revenue', 75);
    });
    
    var _DailyRevenueLineChart = function(element, height) {
        if (typeof d3 == 'undefined') {
            console.warn('Warning - d3.min.js is not loaded.');
            return;
        }

        // Initialize chart only if element exsists in the DOM
        if($(element).length > 0) {


            // Basic setup
            // ------------------------------

            // Add data set
            var dataset = [
                {
                	'index': '1',
                    'name': 'Janauary',
                    'value': <%=allTransactionByMonth[0] %>
                }, {
                	'index': '2',
                    'name': 'February',
                    'value': <%=allTransactionByMonth[1]%>
                }, {
                	'index': '3',
                    'name': 'March',
                    'value': <%= allTransactionByMonth[2]%>
                }, {
                	'index':'4',
                    'name': 'April',
                    'value': <%= allTransactionByMonth[3]%>
                }, {
                	'index':'5',
                    'name': 'May',
                    'value': <%=allTransactionByMonth[4]%>
                } , {
                	'index':'6',
                    'name': 'June',
                    'value': <%=allTransactionByMonth[5]%>
                } , {
                	'index':'7',
                    'name': 'July',
                    'value': <%=allTransactionByMonth[6]%>
                } , {
                	'index':'8',
                    'name': 'August',
                    'value': <%= allTransactionByMonth[7]%>
                } , {
                	'index':'9',
                    'name': 'September',
                    'value': <%= allTransactionByMonth[8]%>
                } , {
                	'index':'10',
                    'name': 'October',
                    'value': <%=allTransactionByMonth[9]%>
                } , {
                	'index':'11',
                    'name': 'November',
                    'value': <%=allTransactionByMonth[10]%>
                } , {
                	'index':'12',
                    'name': 'December',
                    'value': <%= allTransactionByMonth[11]%>
                } 
            ];

            // Main variables
            var d3Container = d3.select(element),
                margin = {top: 0, right: 0, bottom: 10, left: 0},
                width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right,
                height = height - margin.top - margin.bottom,
                padding = 20;

            // Format date
           /*  var parseDate = d3.time.format('%m/%d/%y').parse,
                formatDate = d3.time.format('%a, %B %e');
 */

 				

            // Add tooltip
            // ------------------------------

            var tooltip = d3.tip()
                .attr('class', 'd3-tip')
                .html(function (d) {
                    return '<ul class="list-unstyled mb-1">' +
                        '<li>' + '<div class="font-size-base my-1"><i class="icon-check2 mr-2"></i>' + d.name + '</div>' + '</li>' +
                        '<li>' + 'Transactions: &nbsp;' + '<span class="font-weight-semibold float-right">' + d.value + '</span>' + '</li>' + 
                    '</ul>';
                });



            // Create chart
            // ------------------------------

            // Add svg element
            var container = d3Container.append('svg');

            // Add SVG group
            var svg = container
                    .attr('width', width + margin.left + margin.right)
                    .attr('height', height + margin.top + margin.bottom)
                    .append('g')
                        .attr('transform', 'translate(' + margin.left + ',' + margin.top + ')')
                        .call(tooltip);



            // Load data
            // ------------------------------

            dataset.forEach(function (d) {
                d.index = parseInt(d.index);
                d.value = +d.value;
            });



            // Construct scales
            // ------------------------------

            // Horizontal
            var x = d3.time.scale()
                .range([padding, width - padding]);

            // Vertical
            var y = d3.scale.linear()
                .range([height, 5]);



            // Set input domains
            // ------------------------------

            // Horizontal
            x.domain(d3.extent(dataset, function (d) {
                return d.index;
            }));

            // Vertical
            y.domain([0, d3.max(dataset, function (d) {
                return Math.max(d.value);
            })]);



            // Construct chart layout
            // ------------------------------

            // Line
            var line = d3.svg.line()
                .x(function(d) {
                    return x(d.index);
                })
                .y(function(d) {
                    return y(d.value)
                });



            //
            // Append chart elements
            //

            // Add mask for animation
            // ------------------------------

            // Add clip path
            var clip = svg.append('defs')
                .append('clipPath')
                .attr('id', 'clip-line-small');

            // Add clip shape
            var clipRect = clip.append('rect')
                .attr('class', 'clip')
                .attr('width', 0)
                .attr('height', height);

            // Animate mask
            clipRect
                  .transition()
                      .duration(1000)
                      .ease('linear')
                      .attr('width', width);



            // Line
            // ------------------------------

            // Path
            var path = svg.append('path')
                .attr({
                    'd': line(dataset),
                    'clip-path': 'url(#clip-line-small)',
                    'class': 'd3-line d3-line-medium'
                })
                .style('stroke', '#fff');

            // Animate path
            svg.select('.line-tickets')
                .transition()
                    .duration(1000)
                    .ease('linear');



            // Add vertical guide lines
            // ------------------------------

            // Bind data
            var guide = svg.append('g')
                .selectAll('.d3-line-guides-group')
                .data(dataset);

            // Append lines
            guide
                .enter()
                .append('line')
                    .attr('class', 'd3-line-guides')
                    .attr('x1', function (d, i) {
                        return x(d.index);
                    })
                    .attr('y1', function (d, i) {
                        return height;
                    })
                    .attr('x2', function (d, i) {
                        return x(d.index);
                    })
                    .attr('y2', function (d, i) {
                        return height;
                    })
                    .style('stroke', 'rgba(255,255,255,0.3)')
                    .style('stroke-dasharray', '4,2')
                    .style('shape-rendering', 'crispEdges');

            // Animate guide lines
            guide
                .transition()
                    .duration(1000)
                    .delay(function(d, i) { return i * 150; })
                    .attr('y2', function (d, i) {
                        return y(d.value);
                    });



            // Alpha app points
            // ------------------------------

            // Add points
            var points = svg.insert('g')
                .selectAll('.d3-line-circle')
                .data(dataset)
                .enter()
                .append('circle')
                    .attr('class', 'd3-line-circle d3-line-circle-medium')
                    .attr('cx', line.x())
                    .attr('cy', line.y())
                    .attr('r', 3)
                    .style('stroke', '#fff')
                    .style('fill', '#29B6F6');



            // Animate points on page load
            points
                .style('opacity', 0)
                .transition()
                    .duration(250)
                    .ease('linear')
                    .delay(1000)
                    .style('opacity', 1);


            // Add user interaction
            points
                .on('mouseover', function (d) {
                    tooltip.offset([-10, 0]).show(d);

                    // Animate circle radius
                    d3.select(this).transition().duration(250).attr('r', 4);
                })

                // Hide tooltip
                .on('mouseout', function (d) {
                    tooltip.hide(d);

                    // Animate circle radius
                    d3.select(this).transition().duration(250).attr('r', 3);
                });

            // Change tooltip direction of first point
            d3.select(points[0][0])
                .on('mouseover', function (d) {
                    tooltip.offset([0, 10]).direction('e').show(d);

                    // Animate circle radius
                    d3.select(this).transition().duration(250).attr('r', 4);
                })
                .on('mouseout', function (d) {
                    tooltip.direction('n').hide(d);

                    // Animate circle radius
                    d3.select(this).transition().duration(250).attr('r', 3);
                });

            // Change tooltip direction of last point
            d3.select(points[0][points.size() - 1])
                .on('mouseover', function (d) {
                    tooltip.offset([0, -10]).direction('w').show(d);

                    // Animate circle radius
                    d3.select(this).transition().duration(250).attr('r', 4);
                })
                .on('mouseout', function (d) {
                    tooltip.direction('n').hide(d);

                    // Animate circle radius
                    d3.select(this).transition().duration(250).attr('r', 3);
                })



            // Resize chart
            // ------------------------------

            // Call function on window resize
            $(window).on('resize', revenueResize);

            // Call function on sidebar width change
            $(document).on('click', '.sidebar-control', revenueResize);

            // Resize function
            // 
            // Since D3 doesn't support SVG resize by default,
            // we need to manually specify parts of the graph that need to 
            // be updated on window resize
            function revenueResize() {

                // Layout variables
                width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right;


                // Layout
                // -------------------------

                // Main svg width
                container.attr('width', width + margin.left + margin.right);

                // Width of appended group
                svg.attr('width', width + margin.left + margin.right);

                // Horizontal range
                x.range([padding, width - padding]);


                // Chart elements
                // -------------------------

                // Mask
                clipRect.attr('width', width);

                // Line path
                svg.selectAll('.d3-line').attr('d', line(dataset));

                // Circles
                svg.selectAll('.d3-line-circle').attr('cx', line.x());

                // Guide lines
                svg.selectAll('.d3-line-guides')
                    .attr('x1', function (d, i) {
                        return x(d.date);
                    })
                    .attr('x2', function (d, i) {
                        return x(d.date);
                    });
            }
        }
    };
    
    
   </script>



 <script>

    
    /* ------------------------------------------------------------------------------
 *
 *  # Custom JS code
 *
 *  Place here all your custom js. Make sure it's loaded after app.js
 *
 * ---------------------------------------------------------------------------- */

  /*******colapse navbar*********/
				var App = function () {
				
				
				    //
				    // Setup module components
				    //
				
				    // Transitions
				    // -------------------------
				
				    // Disable all transitions
				    var _transitionsDisabled = function() {
				        $('body').addClass('no-transitions');
				    };
				
				    // Enable all transitions
				    var _transitionsEnabled = function() {
				        $('body').removeClass('no-transitions');
				    };
				
				
				    // Sidebars
				    // -------------------------
				
				    //
				    // On desktop
				    //
				
				    // Resize main sidebar
				    var _sidebarMainResize = function() {
				
				        // Flip 2nd level if menu overflows
				        // bottom edge of browser window
				        var revertBottomMenus = function() {
				            $('.sidebar-main').find('.nav-sidebar').children('.nav-item-submenu').hover(function() {
				                var totalHeight = 0,
				                    $this = $(this),
				                    navSubmenuClass = 'nav-group-sub',
				                    navSubmenuReversedClass = 'nav-item-submenu-reversed';
				
				                totalHeight += $this.find('.' + navSubmenuClass).filter(':visible').outerHeight();
				                if($this.children('.' + navSubmenuClass).length) {
				                    if(($this.children('.' + navSubmenuClass).offset().top + $this.find('.' + navSubmenuClass).filter(':visible').outerHeight()) > document.body.clientHeight) {
				                        $this.addClass(navSubmenuReversedClass)
				                    }
				                    else {
				                        $this.removeClass(navSubmenuReversedClass)
				                    }
				                }
				            });
				        }
				
				        // If sidebar is resized by default
				        if($('body').hasClass('sidebar-xs')) {
				            revertBottomMenus();
				        }
				
				        // Toggle min sidebar class
				        $('.sidebar-main-toggle').on('click', function (e) {
				            e.preventDefault();
				
				            $('body').toggleClass('sidebar-xs').removeClass('sidebar-mobile-main');
				            revertBottomMenus();
				        });
				    };
				
				    // Toggle main sidebar
				    var _sidebarMainToggle = function() {
				        $(document).on('click', '.sidebar-main-hide', function (e) {
				            e.preventDefault();
				            $('body').toggleClass('sidebar-main-hidden');
				        });
				    };
				
				    // Toggle secondary sidebar
				    var _sidebarSecondaryToggle = function() {
				        $(document).on('click', '.sidebar-secondary-toggle', function (e) {
				            e.preventDefault();
				            $('body').toggleClass('sidebar-secondary-hidden');
				        });
				    };
				
				
				    // Show right, resize main
				    var _sidebarRightMainToggle = function() {
				        $(document).on('click', '.sidebar-right-main-toggle', function (e) {
				            e.preventDefault();
				
				            // Right sidebar visibility
				            $('body').toggleClass('sidebar-right-visible');
				
				            // If visible
				            if ($('body').hasClass('sidebar-right-visible')) {
				
				                // Make main sidebar mini
				                $('body').addClass('sidebar-xs');
				
				                // Hide children lists if they are opened, since sliding animation adds inline CSS
				                $('.sidebar-main .nav-sidebar').children('.nav-item').children('.nav-group-sub').css('display', '');
				            }
				            else {
				                $('body').removeClass('sidebar-xs');
				            }
				        });
				    };
				
				    // Show right, hide main
				    var _sidebarRightMainHide = function() {
				        $(document).on('click', '.sidebar-right-main-hide', function (e) {
				            e.preventDefault();
				
				            // Opposite sidebar visibility
				            $('body').toggleClass('sidebar-right-visible');
				            
				            // If visible
				            if ($('body').hasClass('sidebar-right-visible')) {
				                $('body').addClass('sidebar-main-hidden');
				            }
				            else {
				                $('body').removeClass('sidebar-main-hidden');
				            }
				        });
				    };
				
				    // Toggle right sidebar
				    var _sidebarRightToggle = function() {
				        $(document).on('click', '.sidebar-right-toggle', function (e) {
				            e.preventDefault();
				
				            $('body').toggleClass('sidebar-right-visible');
				        });
				    };
				
				    // Show right, hide secondary
				    var _sidebarRightSecondaryToggle = function() {
				        $(document).on('click', '.sidebar-right-secondary-toggle', function (e) {
				            e.preventDefault();
				
				            // Opposite sidebar visibility
				            $('body').toggleClass('sidebar-right-visible');
				
				            // If visible
				            if ($('body').hasClass('sidebar-right-visible')) {
				                $('body').addClass('sidebar-secondary-hidden');
				            }
				            else {
				                $('body').removeClass('sidebar-secondary-hidden');
				            }
				        });
				    };
				
				
				    // Toggle content sidebar
				    var _sidebarComponentToggle = function() {
				        $(document).on('click', '.sidebar-component-toggle', function (e) {
				            e.preventDefault();
				            $('body').toggleClass('sidebar-component-hidden');
				        });
				    };
				
				
				    //
				    // On mobile
				    //
				
				    // Expand sidebar to full screen on mobile
				    var _sidebarMobileFullscreen = function() {
				        $('.sidebar-mobile-expand').on('click', function (e) {
				            e.preventDefault();
				            var $sidebar = $(this).parents('.sidebar'),
				                sidebarFullscreenClass = 'sidebar-fullscreen'
				
				            if(!$sidebar.hasClass(sidebarFullscreenClass)) {
				                $sidebar.addClass(sidebarFullscreenClass);
				            }
				            else {
				                $sidebar.removeClass(sidebarFullscreenClass);
				            }
				        });
				    };
				
				    // Toggle main sidebar on mobile
				    var _sidebarMobileMainToggle = function() {
				        $('.sidebar-mobile-main-toggle').on('click', function(e) {
				            e.preventDefault();
				            $('body').toggleClass('sidebar-mobile-main').removeClass('sidebar-mobile-secondary sidebar-mobile-right');
				
				            if($('.sidebar-main').hasClass('sidebar-fullscreen')) {
				                $('.sidebar-main').removeClass('sidebar-fullscreen');
				            }
				        });
				    };
				
				    // Toggle secondary sidebar on mobile
				    var _sidebarMobileSecondaryToggle = function() {
				        $('.sidebar-mobile-secondary-toggle').on('click', function (e) {
				            e.preventDefault();
				            $('body').toggleClass('sidebar-mobile-secondary').removeClass('sidebar-mobile-main sidebar-mobile-right');
				
				            // Fullscreen mode
				            if($('.sidebar-secondary').hasClass('sidebar-fullscreen')) {
				                $('.sidebar-secondary').removeClass('sidebar-fullscreen');
				            }
				        });
				    };
				
				    // Toggle right sidebar on mobile
				    var _sidebarMobileRightToggle = function() {
				        $('.sidebar-mobile-right-toggle').on('click', function (e) {
				            e.preventDefault();
				            $('body').toggleClass('sidebar-mobile-right').removeClass('sidebar-mobile-main sidebar-mobile-secondary');
				
				            // Hide sidebar if in fullscreen mode on mobile
				            if($('.sidebar-right').hasClass('sidebar-fullscreen')) {
				                $('.sidebar-right').removeClass('sidebar-fullscreen');
				            }
				        });
				    };
				
				    // Toggle component sidebar on mobile
				    var _sidebarMobileComponentToggle = function() {
				        $('.sidebar-mobile-component-toggle').on('click', function (e) {
				            e.preventDefault();
				            $('body').toggleClass('sidebar-mobile-component');
				        });
				    };
				
				
				    // Navigations
				    // -------------------------
				
				    // Sidebar navigation
				    var _navigationSidebar = function() {
				
				        // Define default class names and options
				        var navClass = 'nav-sidebar',
				            navItemClass = 'nav-item',
				            navItemOpenClass = 'nav-item-open',
				            navLinkClass = 'nav-link',
				            navSubmenuClass = 'nav-group-sub',
				            navSlidingSpeed = 250;
				
				        // Configure collapsible functionality
				        $('.' + navClass).each(function() {
				            $(this).find('.' + navItemClass).has('.' + navSubmenuClass).children('.' + navItemClass + ' > ' + '.' + navLinkClass).not('.disabled').on('click', function (e) {
				                e.preventDefault();
				
				                // Simplify stuff
				                var $target = $(this),
				                    $navSidebarMini = $('.sidebar-xs').not('.sidebar-mobile-main').find('.sidebar-main .' + navClass).children('.' + navItemClass);
				
				                // Collapsible
				                if($target.parent('.' + navItemClass).hasClass(navItemOpenClass)) {
				                    $target.parent('.' + navItemClass).not($navSidebarMini).removeClass(navItemOpenClass).children('.' + navSubmenuClass).slideUp(navSlidingSpeed);
				                }
				                else {
				                    $target.parent('.' + navItemClass).not($navSidebarMini).addClass(navItemOpenClass).children('.' + navSubmenuClass).slideDown(navSlidingSpeed);
				                }
				
				                // Accordion
				                if ($target.parents('.' + navClass).data('nav-type') == 'accordion') {
				                    $target.parent('.' + navItemClass).not($navSidebarMini).siblings(':has(.' + navSubmenuClass + ')').removeClass(navItemOpenClass).children('.' + navSubmenuClass).slideUp(navSlidingSpeed);
				                }
				            });
				        });
				
				        // Disable click in disabled navigation items
				        $(document).on('click', '.' + navClass + ' .disabled', function(e) {
				            e.preventDefault();
				        });
				
				        // Scrollspy navigation
				        $('.nav-scrollspy').find('.' + navItemClass).has('.' + navSubmenuClass).children('.' + navItemClass + ' > ' + '.' + navLinkClass).off('click');
				    };
				
				    // Navbar navigation
				    var _navigationNavbar = function() {
				
				        // Prevent dropdown from closing on click
				        $(document).on('click', '.dropdown-content', function(e) {
				            e.stopPropagation();
				        });
				
				        // Disabled links
				        $('.navbar-nav .disabled a, .nav-item-levels .disabled').on('click', function(e) {
				            e.preventDefault();
				            e.stopPropagation();
				        });
				
				        // Show tabs inside dropdowns
				        $('.dropdown-content a[data-toggle="tab"]').on('click', function(e) {
				            $(this).tab('show');
				        });
				    };
				
				
				    // Components
				    // -------------------------
				
				    // Tooltip
				    var _componentTooltip = function() {
				
				        // Initialize
				        $('[data-popup="tooltip"]').tooltip();
				
				        // Demo tooltips, remove in production
				        var demoTooltipSelector = '[data-popup="tooltip-demo"]';
				        if($(demoTooltipSelector).is(':visible')) {
				            $(demoTooltipSelector).tooltip('show');
				            setTimeout(function() {
				                $(demoTooltipSelector).tooltip('hide');
				            }, 2000);
				        }
				    };
				
				    // Popover
				    var _componentPopover = function() {
				        $('[data-popup="popover"]').popover();
				    };
				
				
				    // Card actions
				    // -------------------------
				
				    // Reload card (uses BlockUI extension)
				    var _cardActionReload = function() {
				        $('.card [data-action=reload]:not(.disabled)').on('click', function (e) {
				            e.preventDefault();
				            var $target = $(this),
				                block = $target.closest('.card');
				            
				            // Block card
				            $(block).block({ 
				                message: '<i class="icon-spinner2 spinner"></i>',
				                overlayCSS: {
				                    backgroundColor: '#fff',
				                    opacity: 0.8,
				                    cursor: 'wait',
				                    'box-shadow': '0 0 0 1px #ddd'
				                },
				                css: {
				                    border: 0,
				                    padding: 0,
				                    backgroundColor: 'none'
				                }
				            });
				
				            // For demo purposes
				            window.setTimeout(function () {
				               $(block).unblock();
				            }, 2000); 
				        });
				    };
				
				    // Collapse card
				    var _cardActionCollapse = function() {
				        var $cardCollapsedClass = $('.card-collapsed');
				
				        // Hide if collapsed by default
				        $cardCollapsedClass.children('.card-header').nextAll().hide();
				
				        // Rotate icon if collapsed by default
				        $cardCollapsedClass.find('[data-action=collapse]').addClass('rotate-180');
				
				        // Collapse on click
				        $('.card [data-action=collapse]:not(.disabled)').on('click', function (e) {
				            var $target = $(this),
				                slidingSpeed = 150;
				
				            e.preventDefault();
				            $target.parents('.card').toggleClass('card-collapsed');
				            $target.toggleClass('rotate-180');
				            $target.closest('.card').children('.card-header').nextAll().slideToggle(slidingSpeed);
				        });
				    };
				
				    // Remove card
				    var _cardActionRemove = function() {
				        $('.card [data-action=remove]').on('click', function (e) {
				            e.preventDefault();
				            var $target = $(this),
				                slidingSpeed = 150;
				
				            // If not disabled
				            if(!$target.hasClass('disabled')) {
				                $target.closest('.card').slideUp({
				                    duration: slidingSpeed,
				                    start: function() {
				                        $target.addClass('d-block');
				                    },
				                    complete: function() {
				                        $target.remove();
				                    }
				                });
				            }
				        });
				    };
				
				    // Card fullscreen mode
				    var _cardActionFullscreen = function() {
				        $('.card [data-action=fullscreen]').on('click', function (e) {
				            e.preventDefault();
				
				            // Define vars
				            var $target = $(this),
				                cardFullscreen = $target.closest('.card'),
				                overflowHiddenClass = 'overflow-hidden',
				                collapsedClass = 'collapsed-in-fullscreen',
				                fullscreenAttr = 'data-fullscreen';
				
				            // Toggle classes on card
				            cardFullscreen.toggleClass('fixed-top h-100 rounded-0');
				
				            // Configure
				            if (!cardFullscreen.hasClass('fixed-top')) {
				                $target.removeAttr(fullscreenAttr);
				                cardFullscreen.children('.' + collapsedClass).removeClass('show');
				                $('body').removeClass(overflowHiddenClass);
				                $target.siblings('[data-action=move], [data-action=remove], [data-action=collapse]').removeClass('d-none');
				            }
				            else {
				                $target.attr(fullscreenAttr, 'active');
				                cardFullscreen.removeAttr('style').children('.collapse:not(.show)').addClass('show ' + collapsedClass);
				                $('body').addClass(overflowHiddenClass);
				                $target.siblings('[data-action=move], [data-action=remove], [data-action=collapse]').addClass('d-none');
				            }
				        });
				    };
				
				
				    // Misc
				    // -------------------------
				
				    // Dropdown submenus. Trigger on click
				    var _dropdownSubmenu = function() {
				
				        // All parent levels require .dropdown-toggle class
				        $('.dropdown-menu').find('.dropdown-submenu').not('.disabled').find('.dropdown-toggle').on('click', function(e) {
				            e.stopPropagation();
				            e.preventDefault();
				
				            // Remove "show" class in all siblings
				            $(this).parent().siblings().removeClass('show').find('.show').removeClass('show');
				
				            // Toggle submenu
				            $(this).parent().toggleClass('show').children('.dropdown-menu').toggleClass('show');
				
				            // Hide all levels when parent dropdown is closed
				            $(this).parents('.show').on('hidden.bs.dropdown', function(e) {
				                $('.dropdown-submenu .show, .dropdown-submenu.show').removeClass('show');
				            });
				        });
				    };
				
				    // Header elements toggler
				    var _headerElements = function() {
				
				        // Toggle visible state of header elements
				        $('.header-elements-toggle').on('click', function(e) {
				            e.preventDefault();
				            $(this).parents('[class*=header-elements-]').find('.header-elements').toggleClass('d-none');
				        });
				
				        // Toggle visible state of footer elements
				        $('.footer-elements-toggle').on('click', function(e) {
				            e.preventDefault();
				            $(this).parents('.card-footer').find('.footer-elements').toggleClass('d-none');
				        });
				    };
				
				
				    //
				    // Return objects assigned to module
				    //
				
				    return {
				
				        // Disable transitions before page is fully loaded
				        initBeforeLoad: function() {
				            _transitionsDisabled();
				        },
				
				        // Enable transitions when page is fully loaded
				        initAfterLoad: function() {
				            _transitionsEnabled();
				        },
				
				        // Initialize all sidebars
				        initSidebars: function() {
				
				            // On desktop
				            _sidebarMainResize();
				            _sidebarMainToggle();
				            _sidebarSecondaryToggle();
				            _sidebarRightMainToggle();
				            _sidebarRightMainHide();
				            _sidebarRightToggle();
				            _sidebarRightSecondaryToggle();
				            _sidebarComponentToggle();
				
				            // On mobile
				            _sidebarMobileFullscreen();
				            _sidebarMobileMainToggle();
				            _sidebarMobileSecondaryToggle();
				            _sidebarMobileRightToggle();
				            _sidebarMobileComponentToggle();
				        },
				
				        // Initialize all navigations
				        initNavigations: function() {
				            _navigationSidebar();
				            _navigationNavbar();
				        },
				
				        // Initialize all components
				        initComponents: function() {
				            _componentTooltip();
				            _componentPopover();
				        },
				
				        // Initialize all card actions
				        initCardActions: function() {
				            _cardActionReload();
				            _cardActionCollapse();
				            _cardActionRemove();
				            _cardActionFullscreen();
				        },
				
				        // Dropdown submenu
				        initDropdownSubmenu: function() {
				            _dropdownSubmenu();
				        },
				
				        initHeaderElementsToggle: function() {
				            _headerElements();
				        },
				
				        // Initialize core
				        initCore: function() {
				            App.initSidebars();
				            App.initNavigations();
				            App.initComponents();
				            App.initCardActions();
				            App.initDropdownSubmenu();
				            App.initHeaderElementsToggle();
				        }
				    }
				}();
				
				
				// Initialize module
				// ------------------------------
				
				// When content is loaded
				document.addEventListener('DOMContentLoaded', function() {
				    App.initBeforeLoad();
				    App.initCore();
				});
				
				// When page is fully loaded
				window.addEventListener('load', function() {
				    App.initAfterLoad();
				});
				
				/*******colapse navbar*********/
				/*/Dashboard js */

</script>

<script type="text/javascript">

/* 	//pie donut script */
	/* ------------------------------------------------------------------------------
	 *
	 *  # Echarts - Pie and Donut charts
	 *
	 *  Demo JS code for echarts_pies_donuts.html page
	 *
	 * ---------------------------------------------------------------------------- */


	// Setup module
	// ------------------------------

	var EchartsPiesDonuts = function() {


	    //
	    // Setup module components
	    //
	    


	    // Pie and donut charts
	    var _piesDonutsExamples = function() {
	        if (typeof echarts == 'undefined') {
	            console.warn('Warning - echarts.min.js is not loaded.');
	            return;
	        }


	        var pie_infographic_element = document.getElementById('pie_infographic');
	        var pie_multiples_element = document.getElementById('pie_multiples');


	        //
	        // Charts configuration
	        //

	      	            // Donut multiples
        if (pie_multiples_element) {

            // Initialize chart
            var pie_multiples = echarts.init(pie_multiples_element);
          
            
			<%-- var totalCount= <% =merchantTypesByAccNo.getTop1Count() + merchantTypesByAccNo.getTop2Count() + merchantTypesByAccNo.getTop3Count() + merchantTypesByAccNo.getTop4Count()%>; --%>
		/* 	var top1Count = (top1/totalCount)*100;  */
            //
            // Chart config
            //

            // Top text label
            var labelTop = {
                show: true,
                position: 'center',
                formatter: '{b}\n\n',
                fontSize: 15,
                lineHeight: 50,
                rich: {
                    a: {}
                }
            };

            // Background item style
            var backStyle = {
                color: '#eee',
                left:10,
                
                emphasis: {
                    color: '#eee'
                }
            };

            // Bottom text label
            var labelBottom = {
                color: '#333',
                show: true,
                position: 'center',
                formatter: function (params) {
                    return '\n\n\n\n' + (100 - params.value) + '%'
                },
                fontWeight: 500,
                lineHeight: 35,
                rich: {
                    a: {}
                },
                emphasis: {
                    color: '#333'
                }
            };

            // Set inner and outer radius
            var radius = [35,45];

            // Options
            pie_multiples.setOption({

                // Colors
                color: [
                    '#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80',
                    '#8d98b3','#e5cf0d','#97b552','#95706d','#dc69aa',
                    '#07a2a4','#9a7fd1','#588dd5','#f5994e','#c05050',
                    '#59678c','#c9ab00','#7eb00a','#6f5553','#c14089'
                ],

                // Global text styles
                textStyle: {
                    fontFamily: 'Roboto, Arial, Verdana, sans-serif',
                    fontSize: 13
                },

                // Add title
                title: {
                    text: 'Expences',
                    left: 'center',
                    textStyle: {
                        fontSize: 17,
                        fontWeight: 500
                    },
                    subtextStyle: {
                        fontSize: 12
                    }
                },

                // Add legend
                legend: {
                    bottom: 225,
                    left: 'center',
                    data: ['<%=merchantTypesByAccNo.getTop1Name()%>', '<%=merchantTypesByAccNo.getTop2Name()%>', '<%=merchantTypesByAccNo.getTop3Name()%>','<%=merchantTypesByAccNo.getTop4Name()%>'],
                    itemHeight: 8,
                    itemWidth: 8,
                    selectedMode: false
                },

                // Ad9d series
                series: [
                    {
                        type: 'pie',
                        center: ['10%', '23%'],
                        radius: radius,
                        hoverAnimation: false,
                        data: [
                            {name: 'other', value: <%=100-top1%>, label: labelBottom, itemStyle: backStyle},
                            {name: '<%=merchantTypesByAccNo.getTop1Name()%>', value: <%=top1%>, label: labelTop}
                            
                            
                          
                        ]
                    },
                    {
                        type: 'pie',
                        center: ['35%', '23%'],
                        radius: radius,
                        hoverAnimation: false,
                        data: [
                            {name: 'other', value: <%=100-top2%>, label: labelBottom, itemStyle: backStyle},
                            {name: '<%=merchantTypesByAccNo.getTop2Name()%>', value: <%=top2%>, label: labelTop}
                        ]
                    },
                    {
                        type: 'pie',
                        center: ['60%', '23%'],
                        radius: radius,
                        hoverAnimation: false,
                        data: [
                            {name: 'other', value: <%=100-top3%>, label: labelBottom, itemStyle: backStyle},
                            {name: '<%=merchantTypesByAccNo.getTop3Name()%>', value: <%=top3%>, label: labelTop}
                        ]
                    },
                    {
                        type: 'pie',
                        center: ['85%', '23%'],
                        radius: radius,
                        hoverAnimation: false,
                        data: [
                            {name: 'other', value: <%=100-top4%>, label: labelBottom, itemStyle: backStyle},
                            {name: '<%=merchantTypesByAccNo.getTop4Name()%>', value: <%=top4%>, label: labelTop}
                        ]
                    }

                ]
            });
        }
	        // Infographic style
	       if (pie_infographic_element) {

	            // Initialize chart
	            var pie_infographic = echarts.init(pie_infographic_element);


	            //
	            // Chart config
	            //

	            // Common styles
	            var dataStyle = {
	                normal: {
	                    borderWidth: 1,
	                    borderColor: '#fff',
	                    label: {show: false},
	                    labelLine: {show: false}
	                }
	            };
	            var placeHolderStyle = {
	                normal: {
	                    color: 'transparent',
	                    borderWidth: 0
	                }
	            };

	            // Options
	            pie_infographic.setOption({
	            	

	                // Colors
	                color: [
	                    '#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80',
	                    '#8d98b3','#e5cf0d','#97b552','#95706d','#dc69aa',
	                    '#07a2a4','#9a7fd1','#588dd5','#f5994e','#c05050',
	                    '#59678c','#c9ab00','#7eb00a','#6f5553','#c14089'
	                ],

	                // Global text styles
	                textStyle: {
	                    fontFamily: 'Roboto, Arial, Verdana, sans-serif',
	                    fontSize: 13
	                },

	                // Add title
	                title: {
	                    text:'',
	                    subtext: '',
	                    right: '0%',
	                    top: '0%',
	                    textStyle: {
	                        color: 'rgba(30,144,255,0.8)',
	                        fontSize: 12,
	                        fontWeight: 500
	                    },
	                    subtextStyle: {
	                        fontSize: 12
	                    }
	                },

	                // Add tooltip
	                tooltip: {
	                    trigger: 'item',
	                    backgroundColor: 'rgba(0,0,0,0.75)',
	                    padding: [10, 15],
	                    textStyle: {
	                        fontSize: 13,
	                        fontFamily: 'Roboto, sans-serif'
	                    },
	                    formatter: function (params) {
	                        if(params.color == "transparent")return;
	                        return params.percent + '%' + ' - ' + params.seriesName;
	                    }
	                },

	                // Add legend
	                legend: {
	                    orient: 'vertical',
	                    top: '0%',
	                  /*   left: (pie_infographic_element.offsetWidth / 2) + 20, */
	                  left:'0%',
	                    data: ['Cash In','Cash Out','Mobile Top Up','Fund Transfers','Bill Payments'],
	                    itemHeight: 8,
	                    itemWidth: 8,
	                    itemGap: 0
	                },

	                // Add series
	               
	                
	                series: [
	         
	                
	                    {
	                        name: 'Cash In',
	                        type: 'pie',
	                        cursor: 'default',
	                        clockWise: false,
	                        radius: ['45%', '55%'],
	                        hoverOffset: 0,
	                        itemStyle: dataStyle,
	                        data: [
	                            {
	                                value:  <%= dailSummaryTypeByAccNo.getCashinCount()%> ,
	                                name: 'Cash In'
	                            },
	                            {
	                                value:  <%= 100-dailSummaryTypeByAccNo.getCashinCount()%> ,
	                                name: '',
	                                itemStyle: placeHolderStyle
	                            }
	                        ]
	                    },

	                    {
	                        name: 'Cash Out',
	                        type:'pie',
	                        cursor: 'default',
	                        clockWise: false,
	                        radius: ['35%', '45%'],
	                        hoverOffset: 0,
	                        itemStyle: dataStyle,
	                        data: [
	                            {
	                                value:  <%= dailSummaryTypeByAccNo.getCashoutCount()%> , 
	                                name: 'Cash Out'
	                            },
	                            {
	                                value: <%= 100-dailSummaryTypeByAccNo.getCashoutCount()%> ,
	                                name: 'invisible',
	                                silent: false,
	                                itemStyle: placeHolderStyle
	                            }
	                        ]
	                    },

	                    {
	                        name: 'Mobile Top Up',
	                        type: 'pie',
	                        cursor: 'default',
	                        clockWise: false,
	                        radius: ['25%', '35%'],
	                        hoverOffset: 0,
	                        itemStyle: dataStyle,
	                        data: [
	                            {
	                                value:<%= dailSummaryTypeByAccNo.getTopupCount()%> , 
	                                name: 'Mobile Top Up'
	                            },
	                            {
	                                value:  <%= 100-dailSummaryTypeByAccNo.getTopupCount()%> ,
	                                name: 'invisible',
	                                itemStyle: placeHolderStyle
	                            }
	                        ]
	                    },
	                    {
	                        name: 'Fund Transfers',
	                        type:'pie',
	                        cursor: 'default',
	                        clockWise: false,
	                        radius: ['15%', '25%'],
	                        hoverOffset: 0,
	                        itemStyle: dataStyle,
	                        data: [
	                            {
	                                value:  <%= dailSummaryTypeByAccNo.getFundCount()%> , 
	                                name: 'Fund Transfers'
	                            },
	                            {
	                                value: <%= 100-dailSummaryTypeByAccNo.getFundCount()%> ,
	                                name: 'invisible',
	                                silent: false,
	                                itemStyle: placeHolderStyle
	                            }
	                        ]
	                    },
	                                       {
	                        name: 'Bill Payments',
	                        type:'pie',
	                        cursor: 'default',
	                        clockWise: false,
	                        radius: ['5%', '15%'],
	                        hoverOffset: 0,
	                        itemStyle: dataStyle,
	                        data: [
	                            {
	                                value: <%= dailSummaryTypeByAccNo.getBillCount()%> , 
	                                name: 'Bill Payments'
	                            },
	                            {
	                                value:  <%=100-dailSummaryTypeByAccNo.getBillCount()%> ,
	                                name: 'invisible',
	                                silent: false,
	                                itemStyle: placeHolderStyle
	                            }
	                        ]
	                    }
	                	
	                
	                ]
	                
	            });
	        }


	       
	        //
	        // Resize charts
	        //

	        // Resize function
	        var triggerChartResize = function() {
	        	pie_infographic_element && pie_infographic.resize();
	            pie_multiples_element && pie_multiples.resize();
	        };

	        // On sidebar width change
	        $(document).on('click', '.sidebar-control', function() {
	            setTimeout(function () {
	                triggerChartResize();
	            }, 0);
	        });

	        // On window resize
	        var resizeCharts;
	        window.onresize = function () {
	            clearTimeout(resizeCharts);
	            resizeCharts = setTimeout(function () {
	                triggerChartResize();
	            }, 200);
	        };
	    };


	    //
	    // Return objects assigned to module
	    //

	    return {
	        init: function() {
	            _piesDonutsExamples();
	        }
	    }
	}();


	// Initialize module
	// ------------------------------

	document.addEventListener('DOMContentLoaded', function() {
	    EchartsPiesDonuts.init();
	});
/* /pie donut script */
	
	
	



// Initialize module
// ------------------------------

document.addEventListener('DOMContentLoaded', function() {
    EchartsPiesDonuts.init();
});

</script>


</body>
</html>
