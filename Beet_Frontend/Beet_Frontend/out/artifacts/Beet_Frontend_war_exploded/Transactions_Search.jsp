<%@page import="com.caller.*" %>
<%@page import="com.caller.controller.*" %>
<%@page import="com.caller.components.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="com.caller.entity.UserPages" %>
<%@page import="com.caller.entity.UserInfo" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.lang.reflect.Array" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.util.Base64" %>
<%@page import="java.util.Calendar" %>

<!-- session handling -->
<%

    //timeout
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
//response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    int timeout = session.getMaxInactiveInterval(); //seconds
    int refresh = session.getMaxInactiveInterval();
    response.setHeader("Refresh", refresh + "; URL = Login_page.jsp");

    response.setHeader("Refresh", timeout + "; URL = Login_page.jsp");
    /* response.setHeader("Refresh", refresh + "; URL = Login_page.jsp"); */
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
    /* session.invalidate();
     */

//get logged user
    UserInfo userData = new UserInfo();
    userData = (UserInfo) session.getAttribute("current_user");


//logout session
    if (session.getAttribute("current_user") == null || session.getAttribute("current_user").equals("")) {
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
    <title>EPAY - Search</title>

    <!-- Global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet"
          type="text/css">
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
    <!-- <script src="../../../../global_assets/js/demo_pages/dashboard.js"></script> -->
    <script src="global_assets/js/demo_pages/datatables_basic.js"></script>
    <script src="global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
    <script src="global_assets/js/demo_pages/widgets_stats.js"></script>

    <!-- /theme JS files -->
    <!-- Theme JS files -->
    <script src="global_assets/js/plugins/visualization/d3/d3.min.js"></script>
    <script src="global_assets/js/plugins/visualization/d3/d3_tooltip.js"></script>

    <%--    <script src="assets/js/app.js"></script>--%>
    <script src="global_assets/js/demo_pages/widgets_stats.js"></script>
    <!-- /theme JS files -->
    <!-- Theme JS files -->
    <script src="global_assets/js/plugins/visualization/echarts/echarts.min.js"></script>

    <%--    <script src="assets/js/app.js"></script>--%>
    <script src="global_assets/js/demo_pages/charts/echarts/bars_tornados.js"></script>
    <!-- /theme JS files -->
    <!-- Theme JS files -->
    <script src="global_assets/js/plugins/visualization/echarts/echarts.min.js"></script>

    <%--    <script src="assets/js/app.js"></script>--%>
    <script src="global_assets/js/demo_pages/charts/echarts/pies_donuts.js"></script>
    <!-- /theme JS files -->
    <!-- Theme JS files -->
    <script src="global_assets/js/plugins/visualization/echarts/echarts.min.js"></script>

    <%--    <script src="assets/js/app.js"></script>--%>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <script src="global_assets/js/plugins/pagination/bs_pagination.min.js"></script>
    <script src="global_assets/js/demo_pages/components_pagination.js"></script>

    <script src="global_assets/js/demo_pages/picker_date.js"></script>
    <script src="global_assets/js/plugins/extensions/jquery_ui/interactions.min.js"></script>
    <script src="global_assets/js/plugins/forms/selects/select2.min.js"></script>

    <script src="global_assets/js/demo_pages/form_select2.js"></script>

</head>

<%
    Callers callobj = new Callers();
    List<TransactionAll> allTransactionListDisplay = callobj.getDetails();
%>

<%!
    String Var_Searchby_transid = "";
    String Var_Searchby_accno = "";
    String var_Searchby_status = "";
    String var_Searchby_startdate = "";
    String var_Searchby_enddate = "";
    String var_Searchby_type = "";
    String Var_Searchby_amount_min = "";
    String Var_Searchby_amount_max = "";

%>


<%

    String Searchby_transid = request.getParameter("search_Transid");
    String Searchby_accno = request.getParameter("search_Accno");
    String Searchby_status = request.getParameter("search_Status");
    String Searchby_dateRange = request.getParameter("btnSearchByDate");
    String Searchby_transtype = request.getParameter("search_Transtype");
    String Searchby_amount_min = request.getParameter("search_Amount_Min");
    String Searchby_amount_max = request.getParameter("search_Amount_Max");


    try {

        if (Searchby_transid.equals("")) {
            Searchby_transid = "empt";
        }

        if (Searchby_accno.equals("")) {
            Searchby_accno = "empt";
        }
        if (Searchby_status.equals("")) {
            Searchby_status = "empt";
        }
        if (Searchby_transtype.equals("")) {
            Searchby_transtype = "empt";
        }
        if (Searchby_dateRange.equals("")) {
            Searchby_dateRange = "empt";
            //out.print("****************"+ Searchby_dateRange );
        }
        if (Searchby_amount_min.equals("") && Searchby_amount_max.equals("")) {
            Searchby_amount_min = "empt";
            Searchby_amount_max = "empt";
        }
        if (!Searchby_amount_min.equals("") && Searchby_amount_max.equals("")) {
            Searchby_amount_max = "10000";
        }
        if (Searchby_amount_min.equals("") && !Searchby_amount_max.equals("")) {
            Searchby_amount_min = "0";
        }
        //out.print(Searchby_amount_min +"****************"+ Searchby_amount_max );
        if (Searchby_transtype.equals("cashin")) {
            Searchby_transtype = "3";
        } else if (Searchby_transtype.equals("cashout")) {
            Searchby_transtype = "4";
        } else if (Searchby_transtype.equals("fundtransfer")) {
            Searchby_transtype = "2";
        } else if (Searchby_transtype.equals("topup")) {
            Searchby_transtype = "5";
        } else if (Searchby_transtype.equals("billpayment")) {
            Searchby_transtype = "7";
        }
    } catch (Exception ex) {
        //out.print(ex);
    }


    String startDate = "empt";
    String endDate = "empt";
    //out.print(dateRange +"|||||||||      ");

    try {

        if (!Searchby_dateRange.equals("empt")) {
            String[] arr = Searchby_dateRange.split("-");
            startDate = arr[0];
            endDate = arr[1];


            String[] starDateArr = startDate.split("/");
            startDate = starDateArr[2] + "-" + starDateArr[0] + "-" + starDateArr[1];

            String[] endDateArr = endDate.split("/");
            endDate = endDateArr[2] + "-" + endDateArr[0] + "-" + endDateArr[1];
            startDate = startDate + "_00:00:00";
            endDate = endDate + "_23:59:59";

        } else {
            startDate = "empt";
            endDate = "empt";
        }

    } catch (Exception ex) {
        //System.out.print(ex);
    }
    startDate = startDate.replace(" ", "");
    endDate = endDate.replace(" ", "");
    //out.print("bbbbbbbbbbbbbbbbbbbbb"+startDate + "|"+ endDate + "|||"+Searchby_accno +"|||"+Searchby_status +"|||"+Searchby_transtype +"|||"+Searchby_amount_min +"|||"+Searchby_amount_max);

    try {

        allTransactionListDisplay = callobj.searchAll(startDate, endDate, Searchby_accno, Searchby_status, Searchby_transtype, Searchby_amount_min, Searchby_amount_max);
        //out.print(allTransactionListDisplay.size());

        if (!Searchby_transid.equals("empt")) {
            TransactionAll tr = callobj.searchByTrnsactionId(Searchby_transid);
            allTransactionListDisplay.add(tr);
            //out.print("+++++++++++++++++++++++" +Searchby_transid);
        }

    } catch (Exception ex) {
        //out.print(ex);
    }

    Var_Searchby_transid = Searchby_transid;
    Var_Searchby_accno = Searchby_accno;
    var_Searchby_status = Searchby_status;
    var_Searchby_startdate = startDate;
    var_Searchby_enddate = endDate;
    var_Searchby_type = Searchby_transtype;
    Var_Searchby_amount_min = Searchby_amount_min;
    Var_Searchby_amount_max = Searchby_amount_max;
    //out.print(var_Searchby_status);

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
                    <img src="global_assets/images/placeholders/placeholder.jpg" class="rounded-circle mr-2" height="34"
                         alt="">
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
                        <a href="Admin_page.jsp" class="nav-link ">
                            <i class="icon-home4"></i>
                            <span>
									Dashboard
								</span>
                        </a>
                    </li>
                    <!-- Search  -->
                    <li class="nav-item nav-item-submenu ">
                        <a href="#" class="nav-link active"><i class="icon-search4"></i> <span>Search</span></a>
                        <ul class="nav nav-group-sub" data-submenu-title="Search">
                            <li class="nav-item"><a href="Transactions_Search.jsp" class="nav-link">Transactions</a>
                            </li>
                        </ul>
                    </li>
                    <!-- //Search  -->

                    <!-- Settings  -->
                    <li class="nav-item nav-item-submenu">
                        <a href="#" class="nav-link"><i class="icon-gear"></i> <span>Settings</span></a>
                        <ul class="nav nav-group-sub" data-submenu-title="Settings">
                            <li class="nav-item"><a href="Account_Settings.jsp" class="nav-link">Account Settings</a>
                            </li>
                            <li class="nav-item"><a href="Fees_Commission_Settings.jsp" class="nav-link">Fees and
                                Commissions Settings</a></li>
                        </ul>
                    </li>
                    <!-- //Settings  -->

                    <!-- Notifications  -->

                    <li class="nav-item nav-item-submenu">
                        <a href="#" class="nav-link"><i class="icon-bell3"></i> <span>Notifications</span></a>
                        <ul class="nav nav-group-sub" data-submenu-title="Notifications">
                            <li class="nav-item"><a href="notification.jsp" class="nav-link">Updates</a></li>
                            <li class="nav-item"><a href="RegistrationsApproval.jsp" class="nav-link">Registrations</a>
                            </li>
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

            <div class="breadcrumb-line breadcrumb-line-light header-elements-md-inline">
                <div class="d-flex">
                    <div class="breadcrumb">
                        <a href="index.html" class="breadcrumb-item"><i class="icon-home2 mr-2"></i> Home</a>
                        <span class="breadcrumb-item active">Search</span>
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
                        <div class="col-xl-4" style="border: 1px; border-style:none;">
                            <div class="card">
                                <div class="card-header header-elements-inline">
                                    <h5 class="card-title">Search by Transaction Id</h5>

                                </div>
                                <div class="card-body">
                                    <form id="idForm" action="" method="post">
                                        <div class="row">
                                            <input type="text" class="form-control" placeholder="Transaction Id"
                                                   name="search_Transid" id="search_TransId">
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-12 text-center">
                                                <button type="submit"
                                                        class="btn btn-outline-primary btn-lg icon-search4"
                                                        value="searcht" id="searchtid" name="searcht"
                                                        style="font-size: 18px; padding:5px 25px; float: right; ">
                                                    search
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <br>
                            </div>
                        </div>
                        <div class="col-xl-8" style="border: 1px; border-style:none; ">
                            <div class="card">
                                <div class="card-header header-elements-inline">
                                    <h5 class="card-title">Search</h5>

                                </div>
                                <div class="card-body">
                                    <form id="idForm2" action="" method="post">
                                        <div class="row">
                                            <input type="hidden" class="form-control" placeholder="Transaction Id"
                                                   name="search_Transid" id="search_TransId" value="">
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" placeholder="Account No"
                                                       name="search_Accno" id="search_AccnoId">
                                            </div>
                                            <div class="col-sm-4">

                                                <select data-placeholder="--Select Transaction Type--"
                                                        class="form-control select" data-fouc name="search_Transtype"
                                                        id="search_TranstypeId">
                                                    <option></option>
                                                    <option value="cashin">Cash In</option>
                                                    <option value="cashout">Cash Out</option>
                                                    <option value="billpayment">Bill Payment</option>
                                                    <option value="fundtransfer">Fund Transfer</option>
                                                    <option value="topup">Mobile top up</option>
                                                </select>

                                            </div>
                                            <div class="col-sm-4">

                                                <select data-placeholder="--Select Status--" class="form-control select"
                                                        data-fouc name="search_Status" id="search_StatusId">
                                                    <option></option>
                                                    <option value="success">Success</option>
                                                    <option value="fail">Fail</option>
                                                    <option value="timeout">Timeout</option>
                                                </select>
                                            </div>
                                        </div>
                                        <br>

                                        <div class="row">


                                            <div class="col-sm-4">

                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Amount</label>
                                                    <div class="col-sm-4">
                                                        <input type="number" class="form-control" placeholder="Min"
                                                               name="search_Amount_Min" id="search_Amount_MinId">
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <label for="inputPassword"
                                                               class="col-sm-3 col-form-label">-</label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <input type="number" class="form-control" placeholder="Max"
                                                               name="search_Amount_Max" id="search_Amount_MaxId">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">

                                                <input type="button" class="btn btn-light daterange-predefined"
                                                       id="btnSearchByDate" name="btnSearchByDate2"
                                                       style="width:250px;">
                                                <input type="hidden" name="btnSearchByDate" value="sfgjhj,gnb"
                                                       id="hidden">

                                            </div>
                                            <div class="col-sm-4 text-center">
                                                <button type="button" id="btnAlltrans"
                                                        class="btn btn-outline-primary btn-lg"
                                                        style="font-style: icomoon;padding:6px 4px;font-size: 16px;font-family: icomoon;">
                                                    All Transactions
                                                </button>
                                                <button type="submit"
                                                        class="btn btn-outline-primary btn-lg icon-search4"
                                                        value="search" id="searchid" name="search"
                                                        style="padding:5px 25px; font-size: 18px;  float: right;">
                                                    search
                                                </button>
                                            </div>

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="card">
                        <div class="card-header header-elements-inline">
                            <h5 class="card-title">Transactions</h5>
                            <form class="form-inline float-sm-right">
                                <div class="form-group" style="">
                                    <!-- <label>Report Type:</label>

                                        <select data-placeholder="--Select Report Type--" class="form-control select" data-fouc name="report_Type" id="report_Type">
                                        <option></option>
                                        <option value="allTrans">All Transactions</option>
                                        <option value="transbyId">Transaction By Id</option>
                                        <option value="customized">Customized</option>
                                    </select> -->
                                    <button type="button" id="reportType1" class="btn btn-danger btn-sm"
                                            style="position: relative;" onclick="getDownloadPdf()">Download PDF <i
                                            class="fa fa-file-pdf"></i></button>
                                    </a>
                                    <button type="button" id="reportType2" class="btn btn-success btn-sm"
                                            style="position: relative;" onclick="getDownloadExcel()">Download Excel <i
                                            class="fa fa-file-pdf"></i></button>
                                    </a>
                                </div>

                            </form>
                        </div>

                        <div class="card-body">

                            <table class="table datatable-basic">
                                <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Transaction ID</th>
                                    <th>Date</th>
                                    <th>Account From</th>
                                    <th>Account To</th>
                                    <th>Transaction Type</th>
                                    <th>Entry</th>
                                    <th>Amount</th>
                                    <th>Status</th>

                                </tr>
                                </thead>

                                <tbody id="mytbody">
                                <% for (int j = 0; j < allTransactionListDisplay.size(); j++) {
                                    String acccombine = allTransactionListDisplay.get(j).getUserAccNo();

                                    String[] accnoArr = acccombine.split(",");
                                    String accto = "";
                                    String accfrom = "";
                                    if (accnoArr.length == 2) {
                                        accto = accnoArr[0];
                                        accfrom = accnoArr[1];
                                    }

                                    if (accnoArr.length == 1) {
                                        accto = accnoArr[0];
                                        accfrom = accnoArr[0];
                                    }


                                %>
                                <tr>
                                    <td><%=allTransactionListDisplay.get(j).getId()%>
                                    </td>
                                    <td><%=allTransactionListDisplay.get(j).gettId()%>
                                    </td>
                                    <td><%=allTransactionListDisplay.get(j).getDate()%>
                                    </td>
                                    <td><%=accfrom %>
                                    </td>
                                    <td><%=accto%>
                                    </td>
                                    <td><%=allTransactionListDisplay.get(j).getDescription()%>
                                    </td>
                                    <td><%=allTransactionListDisplay.get(j).getEntry()%>
                                    </td>
                                    <td><%=allTransactionListDisplay.get(j).getAmount()%>
                                    </td>
                                    <td><%=allTransactionListDisplay.get(j).getStatus()%>
                                    </td>

                                </tr>
                                <%}%>


                                </tbody>

                            </table>

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
                    <button type="button" class="navbar-toggler dropdown-toggle" data-toggle="collapse"
                            data-target="#navbar-footer">
                        <i class="icon-unfold mr-2"></i>
                        Footer
                    </button>
                </div>

                <div class="navbar-collapse collapse" id="navbar-footer">
					<span class="navbar-text">
						&copy;  <a href="#">EPAY Solutions (BD) Ltd</a>
					</span>

                    <ul class="navbar-nav ml-lg-auto">
                        <li class="nav-item"><a href="https://kopyov.ticksy.com/" class="navbar-nav-link"
                                                target="_blank"><i class="icon-lifebuoy mr-2"></i> Support</a></li>

                    </ul>
                </div>
            </div>
            <!-- /footer -->

        </div>
        <!-- /main content -->
    </div>
</div>
<!-- /page content -->


<script type="text/javascript">

    //var reportType = "";

    $(document).ready(function () {
        $('#btnSearchByDate').val("");
        var dte = $('#btnSearchByDate').val();


        $("#searchid").click(function () {
            var ss = $('#btnSearchByDate').val();
            $('#hidden').val(ss);
            console.log(ss);
        });


    });

    $("#search_AccnoId, #search_StatusId, #btnSearchByDate, #search_TranstypeId ,#search_Amount_MinId , #search_Amount_MaxId").keyup(function () {
        $('#searchtid').attr("disabled", true);

    });

    $("#search_TransId").keyup(function () {
        $('#searchid').attr("disabled", true);
    });


    $('#mytbody tr').each(function () {
        var col_val = $(this).find("td:last").html();
        console.log(col_val);

        if ($.trim(col_val) === 'fail') {
            $(this).css("background-color", "#ffcdd2");
        }
        if ($.trim(col_val) === 'timeout') {
            $(this).css("background-color", "#ffe0b2");
        }
    });


    $("#btnAlltrans").click(function () {
        $("#searchid").trigger("click");

        $("#reportType1").prop("disabled", false);
        $("#reportType2").prop("disabled", false);
        //alert(reportType);
    })

    var searchby_transid = "<%= Var_Searchby_transid%>";
    var searchby_accno = "<%= Var_Searchby_accno%>";
    var search_status = "<%= var_Searchby_status%>";
    var searchby_startdate = "<%= var_Searchby_startdate%>";
    var searchby_enddate = "<%= var_Searchby_enddate%>";
    var searchby_transtype = "<%= var_Searchby_type%>";
    var searchby_amount_min = "<%= Var_Searchby_amount_min%>";
    var searchby_amount_max = "<%= Var_Searchby_amount_max%>";


    /* function checkvalNotNull(){

        if((searchby_transid === "null") && (searchby_accno === "null")  && (searchby_transtype=== "null") && (search_status==="null") && (searchby_startdate==="empt") && (searchby_enddate==="empt") && (searchby_amount_min==="null") && (searchby_amount_max==="null")){
            alert("----------Error---------");
        }
        else{
            getDownloadPdf();
        }
    }	 */


    function getDownloadPdf() {

        alert("1" + searchby_transid + "2" + searchby_accno + "3" + searchby_transtype + "4" + search_status + "5" + searchby_startdate + "6" + searchby_enddate + "7" + searchby_amount_min + "8" + searchby_amount_max);

        $.ajax(
            {
                url: "pdfController.jsp?action=getDownload&transid=" + searchby_transid + "&accno=" + searchby_accno + "&status=" + search_status + "&datestart=" + searchby_startdate + "&dateend=" + searchby_enddate + "&type=" + searchby_transtype + "&min=" + searchby_amount_min + "&max=" + searchby_amount_max,

            }).done(function (response, textStatus, jqXHR) {

            var repon = response.trim().split(",");
            alert(repon);

            if (repon[1] == '201') {
                alert("No data found");
                window.location.href = "Search.jsp";

                $(this).dialog("close");
            } else {
                //document.getElementById('loading').style.display = 'none';
                //document.getElementById("downbtn").style.display = 'block';
                var a = document.getElementById('cusDownload'); // or grab it by
                alert(repon[0].trim());												// tagname etc
                a.href = repon[0].trim();
                window.location.href = repon[0].trim();
                //window.location.href = "reports.jsp";
                // document.getElementById('fileType').value='';
            }
        });

    }


    function getDownloadExcel() {


        //var reportType = document.getElementById('reportType1').value;
        var reportType = "3";
        alert("ddsd" + reportType);

        if (reportType == '') {
            alert("Type field is required.", "Infortell", "OK");
            document.getElementById('reportType').value = '';
            return false;
        }

        $.ajax(
            {

                url: "excelController.jsp?action=getDownload&transid=" + searchby_transid + "&accno=" + searchby_accno + "&status=" + search_status + "&datestart=" + searchby_startdate + "&dateend=" + searchby_enddate + "&type=" + searchby_transtype + "&min=" + searchby_amount_min + "&max=" + searchby_amount_max,

                data: {
                    name: "The name",
                    desc: "The description"
                }
            }).done(function (response, textStatus, jqXHR) {

            var repon = response.trim().split(",");
            alert(repon);
            if (repon[1] == '201') {
                alert("No data found");
                window.location.href = "Search.jsp";

                $(this).dialog("close");
            } else {
                //document.getElementById('loading').style.display = 'none';
                //document.getElementById("downbtn").style.display = 'block';
                var a = document.getElementById('cusDownload'); // or grab it by
                alert(repon[0].trim());												// tagname etc
                a.href = repon[0].trim();
                window.location.href = repon[0].trim();
                //window.location.href = "reports.jsp";
                // document.getElementById('fileType').value='';
            }
        });

    }


</script>
</body>
</html>
