<%@page import="com.caller.entity.UserInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.caller.entity.UserPages"%>
<%@page import="java.util.List"%>

<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	int timeout = session.getMaxInactiveInterval();
	response.setHeader("Refresh", timeout + "; URL = index.jsp");
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
	//session.invalidate();
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("basepath>>>>>>>>>>>>>>>>>>>>>>>>" + basePath);

	//if (request.getParameter("username") == null) {
	//	response.sendRedirect("index.jsp");
	//}
%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--><html lang="en"><!--<![endif]-->

<script src="http://wcetdesigns.com/assets/javascript/jquery.js"></script>
<script src="http://wcetdesigns.com/assets/javascript/jquery/cookie-plugin.js"></script>
<!-- Core Scripts -->
	<script src="assets/js/libs/jquery-1.8.3.min.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<script src="assets/js/libs/jquery.placeholder.min.js"></script>

	<!-- Login Script -->
	<script src="assets/js/login.js"></script>

	<!-- Validation -->
	<script src="plugins/validate/jquery.validate.min.js"></script>

	<!-- Uniform Script -->
	<script src="plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript">
	function checkSet() {
		var set = document.getElementById('new').value;
		var confrm = document.getElementById('confirm').value;
		var errCount = 0;

		if (set == null || set == "") {
			document.getElementById('show1').innerHTML = "You should enter a new password";
			return false;
		}
		if (confrm == null || confrm == "") {
			document.getElementById('show1').innerHTML = "You should enter a new password";
			return false;
		}
		if ((set != null || set != "") && (confrm != null || confrm != "")) {
			if (set.length < 6) {
				document.getElementById('show1').innerHTML = "Password should contain atleast 6 charcters!";
				return false;
			} else {
				if (set == confrm) {
					var re1 = /[0-9]/;
					if (!re1.test(set)) {
						errCount++;
					}
					var re2 = /[a-z]/;
					if (!re2.test(set)) {
						errCount++;
					}
					var re3 = /[A-Z]/;
					if (!re3.test(set)) {
						errCount++;
					}
					var re4 = /[~`!#$%\^&*+=\-\[\]\\;,/{}|\\":<>\?]/;
					if (!re4.test(set)) {
						errCount++;
						//alert(errCount);
					}
					if (errCount>1) {
						document.getElementById('show1').innerHTML = "Your password must have 3 of the following.<br>";
						document.getElementById('show2').innerHTML = "<ul><li>Upper case letters.</li><li>Lowercase letters.</li><li>Special characters.</li><li>A numeric letter.</li></ul>";
						return false;
					}
					if (errCount == 1){
						return true;
					}
				}
				else{
					document.getElementById('show1').innerHTML = "Entered Passwords are not matching!";
					return false;
				}
			}
		}
	}
</script>

<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author"  content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title> EPAY - Password Reset</title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/layout.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/components.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/colors.min.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script src="global_assets/js/main/jquery.min.js"></script>
	<script src="global_assets/js/main/bootstrap.bundle.min.js"></script>
	<script src="global_assets/js/plugins/loaders/blockui.min.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script src="assets/js/app.js"></script>
	<!-- /theme JS files -->
	

</head>

<body>
	<!-- onLoad="load_em()" -->
	<%
		String errCode = "" + request.getParameter("err");
	%>
	<%
	String user = (String)request.getSession().getAttribute("id"); 
	System.out.println("!!!!!####"+user);
	%>
	
	</div>
    <div id="login-wrap">		
		<div id="login-inner" class="login-inset">
			<div id="login-circle">
				<section id="login-form" class="login-inner-form">
				<div class="content d-flex justify-content-center align-items-center content-wrapper">
					<form class="form-vertical" action="loginController.jsp" method="post"
                          onsubmit="return validation()" form="password" style = "margin-top:100px">
					
								<%if(errCode.equals("err1")){ %>
							        <div id="errDisplay" style="color:red;">
							        	<h5 align="center">Choose a password you haven't used within 90 days.</h5>
							        </div>
					        	<%} %>
					        	<%if(errCode.equals("err4")){ %>
							        <div id="errDisplay" style="color:red;">
							        	<h5 align="center">You should reset your password.</h5>
							        </div>
					        	<%} %>
						
						<div class="text-center mb-3">
								<i class="icon-reading icon-2x text-slate-300 border-slate-300 border-3 rounded-round p-3 mb-3 mt-1"></i>
								<h5 class="mb-0">Reset Your Password</h5>
						</div>
						
						<div class="form-group form-group-feedback form-group-feedback-left control-group-merged">
								<input type="password" class="form-control" placeholder="Enter New Password"
									name="new" id="new" class="big" style="width:200px">
								<div class="form-control-feedback">
									<i class="icon-lock2 text-muted"></i>
								</div>
						</div>

						<div class="form-group form-group-feedback form-group-feedback-left control-group">
								<input type="password" class="form-control" placeholder="Confirm New Password" name="confirm" id="confirm" class="big required" autocomplete="off" style="width:200px">
								<div class="form-control-feedback">
									<i class="icon-lock2 text-muted"></i>
								</div>
						</div>
						<div class="control-group">
						</div>
						
						<div class="form-actions">
							<button type="submit" id="submit"
								class="btn btn-danger btn-block btn-large"
								onclick="return checkSet()">Submit</button>
							<input type="hidden" name="action" id="action"
								value="initialReset">
						</div>
						
						
					</form>
					<div class="content d-flex justify-content-center align-items-center">
				</section>
				
				
			</div>

		</div>

	    
    </div>

	<!-- Core Scripts -->
	<script src="assets/js/libs/jquery-1.8.3.min.js"></script>
	<script src="assets/js/libs/jquery.placeholder.min.js"></script>
    
    <!-- Login Script -->
    <script src="assets/js/login.js"></script>

    <!-- Validation -->
    <script src="plugins/validate/jquery.validate.min.js"></script>
    
    <!-- Uniform Script -->
    <script src="plugins/uniform/jquery.uniform.min.js"></script>

</body>
</html>
