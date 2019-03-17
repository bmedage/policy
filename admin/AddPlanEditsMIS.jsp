<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.pit.policy.dbconnection.Conn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add Plan ID</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/morris.css" type="text/css"/>
<!-- Graph CSS -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="js/jquery-2.1.4.min.js"></script>
<!-- //jQuery -->
<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
<!-- //lined-icons -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
   <!-- tables -->
<link rel="stylesheet" type="text/css" href="css/table-style.css" />
<link rel="stylesheet" type="text/css" href="css/basictable.css" />
<script type="text/javascript" src="js/jquery.basictable.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
      $('#table').basictable();

      $('#table-breakpoint').basictable({
        breakpoint: 768
      });

      $('#table-swap-axis').basictable({
        swapAxis: true
      });

      $('#table-force-off').basictable({
        forceResponsive: false
      });

      $('#table-no-resize').basictable({
        noResize: true
      });

      $('#table-two-axis').basictable();

      $('#table-max-height').basictable({
        tableWrapper: true
      });
    });
</script>
<!-- //tables -->
</head> 
<style>
.form-horizontal .control-label {
    padding-top: 7px;
    margin-bottom: 0;
    text-align: left;
}

.btn-primary {
    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
}
buttons.less:14
.btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}
.btn {
    border-radius: 0px;
    outline: none;
}
.btn-primary {
    color: #fff;
    background-color: #00bcd4;
}

/*This style if for disble button  */
input[type=text]:disabled {
    background: #dddddd;
}
</style>
<body>
<%
if(session.getAttribute("userName")==null)
{%>
	<script type="text/javascript">
	alert("Please LogIn First");
	window.location='adminlogin.jsp';
	</script>
<%}
%>


   <div class="page-container">
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner">
              <!--header start here-->
				<div class="header-main">
					<div class="logo-w3-agile">
								<h1><a href="index.html">Pooled</a></h1>
							</div>
					<div class="w3layouts-left">
							
							<!--search-box-->
								<div class="w3-search-box">
								
										<input type="text" placeholder="Search...">	
										<input type="submit" value="">					
									
								</div><!--//end-search-box-->
							<div class="clearfix"> </div>
						 </div>
						 <div class="w3layouts-right">
							<div class="profile_details_left"><!--notifications of menu start -->
								<ul class="nofitications-dropdown">
									<li class="dropdown head-dpdn">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-envelope"></i><span class="badge">3</span></a>
										<ul class="dropdown-menu">
											<li>
												<div class="notification_header">
													<h3>You have 3 new messages</h3>
												</div>
											</li>
											<li><a href="#">
											   <div class="user_img"><img src="images/in11.jpg" alt=""></div>
											   <div class="notification_desc">
												<p>Lorem ipsum dolor</p>
												<p><span>1 hour ago</span></p>
												</div>
											   <div class="clearfix"></div>	
											</a></li>
											<li class="odd"><a href="#">
												<div class="user_img"><img src="images/in10.jpg" alt=""></div>
											   <div class="notification_desc">
												<p>Lorem ipsum dolor </p>
												<p><span>1 hour ago</span></p>
												</div>
											  <div class="clearfix"></div>	
											</a></li>
											<li><a href="#">
											   <div class="user_img"><img src="images/in9.jpg" alt=""></div>
											   <div class="notification_desc">
												<p>Lorem ipsum dolor</p>
												<p><span>1 hour ago</span></p>
												</div>
											   <div class="clearfix"></div>	
											</a></li>
											<li>
												<div class="notification_bottom">
													<a href="#">See all messages</a>
												</div> 
											</li>
										</ul>
									</li>
									<li class="dropdown head-dpdn">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-bell"></i><span class="badge blue">3</span></a>
										<ul class="dropdown-menu">
											<li>
												<div class="notification_header">
													<h3>You have 3 new notification</h3>
												</div>
											</li>
											<li><a href="#">
												<div class="user_img"><img src="images/in8.jpg" alt=""></div>
											   <div class="notification_desc">
												<p>Lorem ipsum dolor</p>
												<p><span>1 hour ago</span></p>
												</div>
											  <div class="clearfix"></div>	
											 </a></li>
											 <li class="odd"><a href="#">
												<div class="user_img"><img src="images/in6.jpg" alt=""></div>
											   <div class="notification_desc">
												<p>Lorem ipsum dolor</p>
												<p><span>1 hour ago</span></p>
												</div>
											   <div class="clearfix"></div>	
											 </a></li>
											 <li><a href="#">
												<div class="user_img"><img src="images/in7.jpg" alt=""></div>
											   <div class="notification_desc">
												<p>Lorem ipsum dolor</p>
												<p><span>1 hour ago</span></p>
												</div>
											   <div class="clearfix"></div>	
											 </a></li>
											 <li>
												<div class="notification_bottom">
													<a href="#">See all notifications</a>
												</div> 
											</li>
										</ul>
									</li>	
									<li class="dropdown head-dpdn">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-tasks"></i><span class="badge blue1">9</span></a>
										<ul class="dropdown-menu">
											<li>
												<div class="notification_header">
													<h3>You have 8 pending task</h3>
												</div>
											</li>
											<li><a href="#">
												<div class="task-info">
													<span class="task-desc">Database update</span><span class="percentage">40%</span>
													<div class="clearfix"></div>	
												</div>
												<div class="progress progress-striped active">
													<div class="bar yellow" style="width:40%;"></div>
												</div>
											</a></li>
											<li><a href="#">
												<div class="task-info">
													<span class="task-desc">Dashboard done</span><span class="percentage">90%</span>
												   <div class="clearfix"></div>	
												</div>
												<div class="progress progress-striped active">
													 <div class="bar green" style="width:90%;"></div>
												</div>
											</a></li>
											<li><a href="#">
												<div class="task-info">
													<span class="task-desc">Mobile App</span><span class="percentage">33%</span>
													<div class="clearfix"></div>	
												</div>
											   <div class="progress progress-striped active">
													 <div class="bar red" style="width: 33%;"></div>
												</div>
											</a></li>
											<li><a href="#">
												<div class="task-info">
													<span class="task-desc">Issues fixed</span><span class="percentage">80%</span>
												   <div class="clearfix"></div>	
												</div>
												<div class="progress progress-striped active">
													 <div class="bar  blue" style="width: 80%;"></div>
												</div>
											</a></li>
											<li>
												<div class="notification_bottom">
													<a href="#">See all pending tasks</a>
												</div> 
											</li>
										</ul>
									</li>	
									<div class="clearfix"> </div>
								</ul>
								<div class="clearfix"> </div>
							</div>
							<!--notification menu end -->
							
							<div class="clearfix"> </div>				
						</div>
						<div class="profile_details w3l">		
								<ul>
									<li class="dropdown profile_details_drop">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<div class="profile_img">	
												<span class="prfil-img"><img src="images/in4.jpg" alt=""> </span> 
												<div class="user-name">
													<p>Malorum</p>
													<span>Administrator</span>
												</div>
												<i class="fa fa-angle-down"></i>
												<i class="fa fa-angle-up"></i>
												<div class="clearfix"></div>	
											</div>	
										</a>
										<ul class="dropdown-menu drp-mnu">
											<li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
											<li> <a href="#"><i class="fa fa-user"></i> Profile</a> </li> 
											<li> <a href="#"><i class="fa fa-sign-out"></i> Logout</a> </li>
										</ul>
									</li>
								</ul>
							</div>
							
				     <div class="clearfix"> </div>	
				</div>
<!--heder end here-->
	<ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a><i class="fa fa-angle-right"></i>Add plan<i class="fa fa-angle-right"></i>Edit plan</li>
            </ol>
		<!--grid-->
 	<div class="grid-form">
  <div class="grid-form1">
  <div class="container-fluid">
 
  <div class="col-md-10">
  <center><h3 style=" margin-left: 5%;"><b>Plan Price Edits</b></h3></center>
  </div>
 
  	  
  	      
							</div>
							
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" action="AddplanupdateMIS.jsp" method="post">
						<%
						Connection con=DBConnection.getConnection();
						PreparedStatement pstmt1=con.prepareStatement("select * from add_plan where plan_id=? And year=? And type=?");
						pstmt1.setString(1, request.getParameter("id"));
						pstmt1.setString(2, request.getParameter("year"));
						pstmt1.setString(3, request.getParameter("type"));
						ResultSet rs1=pstmt1.executeQuery();
						if(rs1.next()){
						%>
						<input type="hidden" name="plan_id" value="<%=rs1.getString("plan_id")%>">
						<input type="hidden" name="year" value="<%=rs1.getString("year")%>">
						<input type="hidden" name="type" value="<%=rs1.getString("type")%>">
						<input type="hidden" value="<%=rs1.getString("year")%>" id="fyear" name="fyear" class="form-control" >	
								<div class="form-group">
								<label for="inputPassword" class="col-sm-2 control-label">Financial year </label>
									<div class="col-sm-6">
									<select id="fyear" name="fyear" class="form-control" disabled="disabled">
									<option value="<%=rs1.getString("year")%>"><%=rs1.getString("year")%></option>
									<option value="2014-15">2014-15</option>
									<option value="2014-15">2014-15</option>
									<option value="2015-16">2015-16</option>
									<option value="2016-17">2016-17</option>
									<option value="2017-18">2017-18</option>
									<option value="2018-19">2018-19</option>
									</select>
									</div>
									
								
									</div>
									<div class="form-group">
									<label for="inputPassword" class="col-sm-2 control-label">Plan Id</label>
									<div class="col-sm-6">
									<input type="Text" class="form-control1" value="<%=rs1.getString("plan_id")%>" id="fyear" name="planId" disabled="disabled">
									<input type="hidden" class="form-control1" value="<%=rs1.getString("plan_id")%>" id="fyear" name="planId">
								</div>
									</div>
									
									
								<%
								int i=0,j=0;
								String yr[]={"Y","H","Q","M"};
								System.out.println("Length"+yr.length);
								String arr[]={"Y","H","Q","M","3","6","12","18","24","30","36","42","48","54","60","66","72","78","84","90","96","102","108","114","120"};
								for(i=0;i<arr.length;i++)
								{
									for(j=0;j<yr.length;j++)
									{
										if(yr[j]=="Y"||yr[j]=="H"||yr[j]=="Q"||yr[j]=="M")
										{
											%>
											<div class="form-group">
												<label for="inputPassword" class="col-sm-2 control-label"><%=arr[i] %> </label>
												<div class="col-sm-6">
												<input type="Text" class="form-control1" id="fyear" name="mon<%=arr[i] %>">
											</div>
												</div>
											<%
										}
										else
										{
											%>
											<div class="form-group">
												<label for="inputPassword" class="col-sm-2 control-label"><%=arr[i] %> Month</label>
												<div class="col-sm-6">
												<input type="Text" class="form-control1" id="fyear" name="mon<%=arr[i] %>">
											</div>
												</div>
											<%
										}
										break;
									}
								}
						
								%>
								
								<div class="form-group">
								
									
								<label for="inputPassword" class="col-sm-2 control-label"></label>
									<div class="col-sm-6">
									<button style="float: right;" class="btn-primary btn">Update Plan</button>
									
									</div>
								</div>
								<%} %>
							</form>
						</div>
					</div>
  </div>
 	</div>
 	
 	
 	<!--//grid-->

<!-- script-for sticky-nav -->
		<script>
		$(document).ready(function() {
			 var navoffeset=$(".header-main").offset().top;
			 $(window).scroll(function(){
				var scrollpos=$(window).scrollTop(); 
				if(scrollpos >=navoffeset){
					$(".header-main").addClass("fixed");
				}else{
					$(".header-main").removeClass("fixed");
				}
			 });
			 
		});
		</script>
		<!-- /script-for sticky-nav -->
<!--inner block start here-->
<div class="inner-block">

</div>
<!--inner block end here-->
<!--copy rights start here-->
<div class="copyrights">
	<p>© 2018 Muskan Credit. All Rights Reserved | Design by  <a href="" target="_blank">Mann Infosoft</a> </p>
</div>	
<!--COPY rights end here-->
</div>
</div>
  <!--//content-inner-->
			<!--/sidebar-menu-->
			<div class="sidebar-menu">
					<header class="logo1">
						<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> 
					</header>
						<div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
                           <div class="menu">
									
														<ul id="menu" >
										<li><a href="index.html"><i class="fa fa-tachometer"></i> <span>Dashboard</span><div class="clearfix"></div></a></li>
										
										<li id="menu-academico" ><a href="#"><i class="fa fa-gear" aria-hidden="true"></i><span> Set Up</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
										   <ul id="menu-academico-sub" >
										   <li id="menu-academico-avaliacoes" ><a href="changepassword.html">Change Password</a></li>
										   <li id="menu-academico-avaliacoes" ><a href="EditAdminDetails.jsp">Edit Admin Detail</a></li>
											
										  </ul>
										</li>
										
										 <li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span> Plan Master</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
										   <ul id="menu-academico-sub" >
										   <li id="menu-academico-avaliacoes" ><a href="AddPlanId.jsp">Add Plan ID</a></li>
										   <li id="menu-academico-avaliacoes" ><a href="AddPlan.jsp">Add Plan Maturity</a></li>
											<li id="menu-academico-avaliacoes" ><a href="AddLevelandPromotion.jsp">Add Level And Promotion</a></li>
											<li id="menu-academico-avaliacoes" ><a href="PromotiveIncentive.jsp">Add Promotive Intensive</a></li>
											<li id="menu-academico-avaliacoes" ><a href="addPromotiveBusinessCalc.jsp">Add Promotive Business Calculation</a></li>
											<li id="menu-academico-avaliacoes" ><a href="AddEditOPAList.jsp">Add OPA List</a></li>
											<li id="menu-academico-avaliacoes" ><a href="OurIncentive.jsp">Add Intensive Structure</a></li>
										  </ul>
										</li>
										
										<li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span>PIN Master</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
										   <ul id="menu-academico-sub" >
										   <li id="menu-academico-avaliacoes" ><a href="CreatePin.jsp">Create Pin</a></li>
										   <li id="menu-academico-avaliacoes" ><a href="OPCPinAllot.jsp">Allot Pin To OPC</a></li>
										   <li id="menu-academico-avaliacoes" ><a href="OPCPinSummary.jsp">Allot PIN Summary</a></li>
										   <li id="menu-academico-avaliacoes" ><a href="UseandUnusePinSummary.jsp">Use/unused PIN</a></li>
											<li id="menu-academico-avaliacoes" ><a href="opcpinamin.jsp">Allot Requested Pin</a></li>
											</ul>
										</li>
										<li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span>Add - Edit</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
											<ul id="menu-academico-sub" >
											<li><a href="addNewPolicy.jsp">Add Edit New Policy</a><div class="clearfix"></div></a></li>
											<li><a href="addnewadvicer.jsp">Add Edit New Advisor</a><div class="clearfix"></div></a></li>
											<li><a href="Renewal&MISMaster.jsp">Renewal and MIS master</a><div class="clearfix"></div></a></li>
											<li><a href="addPolicyMaturity.jsp">Add Policy Maturity</a><div class="clearfix"></div></a></li>
											</ul>
										</li>
										<li id="menu-academico"><a href="paymentmaster.jsp"><i class="fa fa-list-ul" aria-hidden="true"></i><span>Payment Master</span><div class="clearfix"></div></a></li>		
										<li id="menu-academico"><a href=""><i class="fa fa-list-ul" aria-hidden="true"></i><span>Change Master</span><span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
												<ul id="menu-academico-sub" >
													<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="ChangeAdvisorIntroducer.jsp">Change Advisor Introducer<div class="clearfix"></div></a></li>
													<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="ChangeAdvisorMemberOPC.jsp">Change Advisor/Client OPC<div class="clearfix"></div></a></li>
													<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="ChangePolicyIntroducer.jsp">Change Policy Introducer<div class="clearfix"></div></a></li>
										    		
												</ul>
										</li>
											
										<li id="menu-academico"><a href="MaturitySectionForm.jsp"><i class="fa fa-list-ul" aria-hidden="true"></i><span>Advisor Maturity Section Form</span><div class="clearfix"></div></a></li>
										<li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span>Advisor Report</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
										   <ul id="menu-academico-sub" >
										   <li id="menu-academico-avaliacoes" ><a href="AdvisorTeamPolicyList.jsp">Advisor Team Policy List</a></li>
											<li id="menu-academico-avaliacoes" ><a href="AdvisorsTeamList.jsp">Advisor Team List</a></li>
											<li id="menu-academico-avaliacoes" ><a href="AdvisorsACStatement.jsp">Advisor Account statement</a></li>
											<li id="menu-academico-avaliacoes" ><a href="AdvisorsDownlinerReport.jsp">Advisor Down line Reports</a></li>
											<li id="menu-academico-avaliacoes" ><a href="AdvisorsPayIDList.jsp">Advisor Pay ID List</a></li>
											<li id="menu-academico-avaliacoes" ><a href="BusinessReportList.jsp">Advisor Business Report</a></li>
											<li id="menu-academico-avaliacoes" ><a href="#">Advisor Renewal List</a>
											<ul id="menu-academico-sub" >
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="paidRenewalList.jsp">Advisor Paid Renewal List</a></li>
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="PendingRenewealList.jsp">Advisor Pending Renewal List</a></li>
											</ul>
											</li>
											<li id="menu-academico-avaliacoes" ><a href="#">Advisor MIS List</a>
											<ul id="menu-academico-sub" >
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="paidMISList.jsp">Advisor Paid MIS List</a></li>
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="PendingMISList.jsp">Advisor Pending MIS List</a></li>
											</ul>
											</li>
											
											<li id="menu-academico-avaliacoes" ><a href="#">Advisor Maturity List</a>
											<ul id="menu-academico-sub" >
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="Maturity List.jsp">Advisor Maturity List</a></li>
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="Maturity Section List.jsp">Advisor Maturity Section List</a></li>
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="Maturity Section ListPaidPending.jsp">Advisor  Maturity Report(Paid/Pending)</a></li>
											</ul>
											</li>
											
										  </ul>
										</li>
										<li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span>Yearly Advisor Reports</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
										  	<ul id="menu-academico-sub" >										    
										    <li id="menu-academico-avaliacoes" ><a href="ADVToppersList.jsp">Advisor Team Toppers List</a></li>
											<li ID="MENU-ACADEMICO-AVALIACOES" ><A HREF="AdvisorsTeamOPAList .jsp">Advisor Team OPA Winner List</A></LI>
											<li id="menu-academico-avaliacoes" ><a href="AdvisorsTeamPromIncenList.jsp">Advisor Promotive Intensive List</a></li>
											<li id="menu-academico-avaliacoes" ><a href="AdvisorsTeamPromotionList.jsp">Advisor Promotion List</a></li>
											</ul>
											</li>
										
											<li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span>OPC Report</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
										   <ul id="menu-academico-sub" >
										   <li id="menu-academico-avaliacoes" ><a href="OPCTeamPolicyList.jsp">OPC Team Policy List</a></li>
											<li id="menu-academico-avaliacoes" ><a href="OPCTeamList.jsp">OPC Team List</a></li>
											<li id="menu-academico-avaliacoes" ><a href="OOPCACStatement.jsp">OPC Account statement</a></li>
											<li id="menu-academico-avaliacoes" ><a href="OPCPayIDList.jsp">OPC Pay ID List</a></li>
											<li id="menu-academico-avaliacoes" ><a href="OPCBusinessReportList.jsp">OPC Business Report</a></li>
											<li id="menu-academico-avaliacoes" ><a href="">OPC Renewal List</a>
											<ul id="menu-academico-sub" >
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="OPCpaidRenewalList.jsp">OPC Paid Renewal List</a></li>
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="OPCPendingRenewealList.jsp">OPC Pending Renewal List</a></li>
											</ul>
											</li>
											
											<li id="menu-academico-avaliacoes" ><a href="#">OPC Maturity List</a>
											<ul id="menu-academico-sub" >
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="OPCMaturity List.jsp">OPC Maturity List</a></li>
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="OPCMaturity Section List.jsp">OPC Maturity Section List</a></li>
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="OPCMaturity Section ListPaidPending.jsp"">OPC Maturity Report(Paid/Pending)</a></li>
											</ul>
											</li>
											
											<li id="menu-academico-avaliacoes" ><a href="Maturity Section List.jsp">OPC MIS List</a>
											<ul id="menu-academico-sub" >
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="OPCpaidMISList.jsp">OPC  Paid MIS List</a></li>
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="OPCPendingMISList.jsp">OPC  Pending MIS List</a></li>
											</ul>
											</li>
											
											<li id="menu-academico-avaliacoes" ><a href="Maturity Section List.jsp">OPC Advisor Balance List</a></li>
											
										  </ul>
										</li>
										<li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span></span>Yearly OPC Reports<span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
										  	<ul id="menu-academico-sub" >										    
										    <li id="menu-academico-avaliacoes" ><a href="OPCToppersList.jsp">OPC Toppers List</a></li>
											<li ID="MENU-ACADEMICO-AVALIACOES" ><A HREF="OPCTeamOPAList .jsp">OPC Team OPA Winner List</A></LI>
											<li id="menu-academico-avaliacoes" ><a href="OPCTeamPromIncenList.jsp">OPC Promotive Intensive List</a></li>
											<li id="menu-academico-avaliacoes" ><a href="OPCTeamPromotionList.jsp">OPC Promotion List</a></li>
											</ul>
											</li>
										
										<li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span>Coampany Report</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
										   <ul id="menu-academico-sub" >
											    <li id="menu-academico-avaliacoes" ><a href="PolicyList.jsp">Company Team Policy List</a></li>
												<li id="menu-academico-avaliacoes" ><a href="AdvisorsList.jsp">Company Team List</a></li>
												<li id="menu-academico-avaliacoes" ><a href="AdvisorsACStatement.jsp">Company Account Statement</a></li>
												<li id="menu-academico-avaliacoes" ><a href="AdvisorsPayIDList.jsp">Company Pay ID List</a></li>
												<li id="menu-academico-avaliacoes" ><a href="BusinessReportList.jsp">Company Business Report</a></li>
												<li id="menu-academico-avaliacoes" ><a href="">Company Renewal List</a>
											<ul id="menu-academico-sub" >
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="paidRenewalList.jsp">Company Paid Renewal List</a></li>
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="PendingRenewealList.jsp">Company Pending Renewal List</a></li>
											</ul>
											</li>
											
											<li id="menu-academico-avaliacoes" ><a href="#">Company Maturity List</a>
											<ul id="menu-academico-sub" >
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="Maturity List.jsp">Company Maturity List</a></li>
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="Maturity Section List.jsp">Company Maturity Section List</a></li>
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="CompanyMaturity Section ListPaidPending.jsp"">Company Maturity Report(Paid/Pending)</a></li>
											</ul>
											</li>
											
											<li id="menu-academico-avaliacoes" ><a href="Maturity Section List.jsp">Company MIS List</a>
											<ul id="menu-academico-sub" >
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="paidMISList.jsp">Company Paid MIS List</a></li>
											<li style="background-color: #333333;width: 300px;" id="menu-academico-avaliacoes" ><a href="CompanyPendingMISList.jsp">Company Pending MIS List</a></li>
											</ul>
											</li>
												<li id="menu-academico-avaliacoes" ><a href="">Company Advisor Balance List</a></li>														
											</ul>
										</li>
										
										<li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span></span>Yearly Company Report<span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
										  	<ul id="menu-academico-sub" >										    
										    <li id="menu-academico-avaliacoes" ><a href="CompanyToppersList.jsp">Company Toppers List</a></li>
											<li ID="MENU-ACADEMICO-AVALIACOES" ><A HREF="CompanyTeamOPAList .jsp">Company Team OPA Winner List</A></LI>
											<li id="menu-academico-avaliacoes" ><a href="CompanyTeamPromIncenList.jsp">Company Promotive Incentive List</a></li>
											<li id="menu-academico-avaliacoes" ><a href="CompanyTeamPromotionList.jsp">Company Promotion List</a></li>
											</ul>
											</li>
									</ul>
									
								</div>
							  </div>
							  <div class="clearfix"></div>		
							</div>
							<script>
							var toggle = true;
										
							$(".sidebar-icon").click(function() {                
							  if (toggle)
							  {
								$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
								$("#menu span").css({"position":"absolute"});
							  }
							  else
							  {
								$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
								setTimeout(function() {
								  $("#menu span").css({"position":"relative"});
								}, 400);
							  }
											
											toggle = !toggle;
										});
							</script>
<!--js -->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.min.js"></script>
   <!-- /Bootstrap Core JavaScript -->	   
<!-- morris JavaScript -->	
<script src="js/raphael-min.js"></script>
<script src="js/morris.js"></script>
<script>
	$(document).ready(function() {
		//BOX BUTTON SHOW AND CLOSE
	   jQuery('.small-graph-box').hover(function() {
		  jQuery(this).find('.box-button').fadeIn('fast');
	   }, function() {
		  jQuery(this).find('.box-button').fadeOut('fast');
	   });
	   jQuery('.small-graph-box .box-close').click(function() {
		  jQuery(this).closest('.small-graph-box').fadeOut(200);
		  return false;
	   });
	   
	    //CHARTS
	    function gd(year, day, month) {
			return new Date(year, month - 1, day).getTime();
		}
		
		graphArea2 = Morris.Area({
			element: 'hero-area',
			padding: 10,
        behaveLikeLine: true,
        gridEnabled: false,
        gridLineColor: '#dddddd',
        axes: true,
        resize: true,
        smooth:true,
        pointSize: 0,
        lineWidth: 0,
        fillOpacity:0.85,
			data: [
				{period: '2014 Q1', iphone: 2668, ipad: null, itouch: 2649},
				{period: '2014 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
				{period: '2014 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
				{period: '2014 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
				{period: '2015 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
				{period: '2015 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
				{period: '2015 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
				{period: '2015 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
				{period: '2016 Q1', iphone: 10697, ipad: 4470, itouch: 2038},
				{period: '2016 Q2', iphone: 8442, ipad: 5723, itouch: 1801}
			],
			lineColors:['#ff4a43','#a2d200','#22beef'],
			xkey: 'period',
            redraw: true,
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
			pointSize: 2,
			hideHover: 'auto',
			resize: true
		});
		
	   
	});
	</script>   

</body>
</html>