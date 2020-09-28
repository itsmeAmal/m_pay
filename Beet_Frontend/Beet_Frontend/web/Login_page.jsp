<%@page import="com.caller.entity.UserInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.caller.entity.UserPages"%>
<%@page import="java.util.List"%>

<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
//response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
int timeout = session.getMaxInactiveInterval();
int refresh = session.getMaxInactiveInterval(); 
response.setHeader("Refresh",refresh+"; URL = Login_page.jsp");

response.setHeader("Refresh", timeout + "; URL = Login_page.jsp");
/* response.setHeader("Refresh", refresh + "; URL = Login_page.jsp"); */
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
session.invalidate();

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println("URL of the System (msg 1) - "+basePath);


String errCode=""+request.getParameter("err");
String message = ""+request.getParameter("msg");
%>
 
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--><html lang="en"><!--<![endif]-->

<script src="http://wcetdesigns.com/assets/javascript/jquery.js"></script>
<script src="http://wcetdesigns.com/assets/javascript/jquery/cookie-plugin.js"></script>
<script type="text/javascript">
	/*window.history.forward();
	function noBack() { 
		window.history.forward(); 
	}*/
	
	/*function noBack(){window.history.forward();}
	noBack();
	window.onload=noBack;
	window.onpageshow=function(evt){if(evt.persisted)noBack();}
	window.onunload=function(){void(0);}*/
	
	history.pushState(null, document.title, location.href);
	window.addEventListener('popstate', function (event)
	{
	  history.pushState(null, document.title, location.href);
	});

	function remember_me(){
		var today = new Date();
		var exdays = today.getDate();
		//var exdays = today.getDate()+"-"+parseInt((today.getMonth())+1)+"-"+today.getFullYear();
		//alert(today.getDate()+"-"+parseInt((today.getMonth())+1)+"-"+today.getFullYear());
		//alert(today.getDate()+"-"+parseInt((today.getMonth())+1)+"-"+today.getFullYear());
		//alert("doc"+document.getElementById("check").value);
		var value = document.getElementById("input_usernameCP").value;
		var c_name = "input_usernameCP";
		var exdate=new Date();
		exdate.setDate(exdate.getDate() + exdays);
		
		var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
		
		document.cookie=c_name + "=" + c_value;
		//alert(c_name);
		//alert(c_name + "=" + c_value);
		
		var value2 = document.getElementById("input_passwordCP").value;
		var c_name2 = "input_passwordCP";
		var exdate2=new Date();
		exdate2.setDate(exdate.getDate() + exdays);
		
		var c_value2=escape(value2) + ((exdays==null) ? "" : "; expires="+exdate2.toUTCString());
		
		document.cookie=c_name2 + "=" + c_value2;
		
		}
		//NEXT PAGE LOAD, THE USERNAME & PASSWORD WILL BE SHOWN IN THEIR FIELDS
		function load_em(){
			
			//alert("fderge");
			   var allcookies = document.cookie;
			  // alert("All Cookies : ");
	
			   // Get all the cookies pairs in an array
			   cookiearray  = allcookies.split(';');
	
			   // Now take key value pair out of this array
			   for(var i=0; i<cookiearray.length; i++){
			      name = cookiearray[i].split('=')[0];
			      value = cookiearray[i].split('=')[1];
			     //alert("name is : " + name + " and Value is : " + value);
			      if(name="input_usernameCP"){
			    	  document.getElementById("input_usernameCP").value=value;
					   //alert("ff"+value);
				   }
			    //  else{
			    //	  document.getElementById("input_usernameCP").value="user name";  
			    //  }
			      if(name="input_passwordCP"){
			    	  document.getElementById("input_passwordCP").value=value;
					 // alert("ff"+value);
				  }
			      //else{
				//	   document.getElementById("input_passwordCP").value="password";  
				 //  }
			   }
			   
			}
		

</script>

<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author"  content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>EPAY - Login Page</title>

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

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">

	</div>
    <div id="login-wrap">		
		<div id="login-inner" class="login-inset">
			<div id="login-circle">
				<section id="login-form" class="login-inner-form">
					<!-- <h1>Login</h1> -->
					<div class="content d-flex justify-content-center align-items-center content-wrapper">
					<form class="form-vertical" action="loginController.jsp" style = "margin-top:80px">
						
						<div class="text-center mb-3">
								<i class="icon-reading icon-2x text-slate-300 border-slate-300 border-3 rounded-round p-3 mb-3 mt-1"></i>
								<h5 class="mb-0">Login to your account</h5>
								<span class="d-block text-muted">Enter your credentials below</span>
						</div>
						</form>
						
						
					<%if(errCode.equalsIgnoreCase("err")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Username or Password is incorrect</h5>
					        </div>
					<%} %>
					        
					<%if(message.equals("ok")){ %>
					        <div id="errDisplay" style="color:green;">
					        	<h5 align="center">You have successfully reset your password.</h5>
					        </div>
			        <%} %>
			        
			        <%if(message.equals("success")){ %>
					        <div id="errDisplay" style="color:green;">
					        	<h5 align="center">Try to log with OTP which you have recieved.</h5>
					        </div>
			        <%} %>
			        
			        <%if(errCode.equals("err3")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">You should reset your password.</h5>
					        </div>
			        <%} %>
			        
			        <%if(errCode.equals("err4")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Username or Password is incorrect</h5>
					        </div>
			        <%} %>
			        
			        <%if(errCode.equals("err5")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Username or Password is incorrect</h5>
					        </div>
			        <%} %>
			        
			        <%if(errCode.equals("locked")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Your account has been locked.</h5>
					        </div>
			        <%} %>
			        
			         <%if(errCode.equals("terminated")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Your account has been terminated.</h5>
					        </div>
			        <%} %>
			        
			        <%if(errCode.equals("err6")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">Enter Username and Password </h5>
					        </div>
			        <%} %>
			        
			         <%if(errCode.equals("err7")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center">The Password that you've entered is incorrect </h5>
					        </div>
			        <%} %>
			        
			         <%if(errCode.equals("err8")){ %>
					       <div id="errDisplay" style="color:red;">
					        	<h5 align="center">The Username that you've entered doesn't match any account </h5>
					          </div>
			        <%} %>
			        
			         <%if(errCode.equals("err9")){ %>
					        <div id="errDisplay" style="color:red;">
					        	<h5 align="center"> The Username that you've entered is incorrect</h5>
					        </div>
			        <%} %>
			        
				<form class="form-vertical" action="loginController.jsp" >
						<div class="form-group form-group-feedback form-group-feedback-left control-group-merged">
								<input type="text" class="form-control" placeholder="Username" name="username" id="username" class="big required" autocomplete="off" required>
								<div class="form-control-feedback">
									<i class="icon-user text-muted"></i>
								</div>
						</div>

						<div class="form-group form-group-feedback form-group-feedback-left control-group">
								<input type="password" placeholder="Password" class="form-control" name="password" id="password" class="big required" autocomplete="off" autocomplete="off" required>
								<div class="form-control-feedback">
									<i class="icon-lock2 text-muted"></i>
								</div>
						</div>
						<div class="control-group">
						</div>
						
						<div class="form-actions">
							<input type="hidden" name="action" id="action" value="loginUser" >
							<button type="submit" class="btn btn-success btn-block btn-large">Login</button><br>
							<a href="forgotpassword.jsp">Forgot Password?</a>
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

<script type="text/javascript">

var messageValue ="<%= message%>";

if(messageValue === "success"){
	//alert("jhjjjj");
	$("#password").attr("placeholder","OTP");
}
 else{
	$("#password").attr("placeholder","Password");
} 



</script>


</body>



</html>
