<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<html>
<head>
<title>Add Edit New Policy</title>
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
									<form action="#" method="post">
										<input type="text" placeholder="Search..." required="">	
										<input type="submit" value="">					
									</form>
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
	 <li class="breadcrumb-item"><a href="index.html">Home</a><i class="fa fa-angle-right"></i>Add Edit</a><i class="fa fa-angle-right"></i>Add Edit New Policy</li>
               
            </ol>
		<!--grid-->
 	<div class="grid-form">
 		




  <div class="grid-form1">
  	      <center> <h3>Add Edit New Policy</h3></center>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
							<form class="form-horizontal" action="addNewPolicySave.jsp" method="post">
							
								<div class="form-group">
								<div class="col-md-6">
								<%
								SecureRandom random = new SecureRandom();
								 int num = random.nextInt(100000);
								 String formatted = String.format("%05d", num);
								%>
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;" style = "font-size:18px;text-align:left;" >Form No</label>
									<div class="col-sm-8">
										<input type="text"  name="formNo" value="<%=formatted %>" class="form-control" id="inputPassword" placeholder="0056" disabled="disabled">
										<input type="hidden"  name="formNo" value="<%=formatted %>" class="form-control1" id="inputPassword" placeholder="0056" >
									</div>
								</div>
									
									<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Name</label>
									<div class="col-sm-8">
										<input type="text" name="name" class="form-control1" id="inputPassword" placeholder="Mr.XYZ" required>
									</div>
								</div>
								
								</div>
								
								
								
								<div class="form-group">
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Pan card</label>
									<div class="col-sm-8">
										<input type="text" name="panCard" class="form-control1" id="inputPassword" placeholder="" required>
									</div>
								</div>
									
									<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Mobile Number</label>
									<div class="col-sm-8">
										<input type="text" name="mobNo" class="form-control1" id="inputPassword" placeholder="" required>
									</div>
								</div>
								
								</div>
								
								<div class="form-group">
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Aadhar no</label>
									<div class="col-sm-8">
										<input type="text" name="aadharNo" class="form-control1" id="inputPassword" placeholder="" required>
									</div>
								</div>
									
									<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Near OPC</label>
									<div class="col-sm-8">
									<select name="near" id="near" class="form-control">
									<option>--Select--</option>
									<%
								Connection con1=DBConnection.getConnection();
								Statement stmt1 = con1.createStatement();
								String query1 = "SELECT * FROM opc_master";
								ResultSet rs1=stmt1.executeQuery(query1);			
								//Extact result from ResultSet rs
								while(rs1.next()){
								 %>
									<option value="<%=rs1.getString("opc_name") %>"><%=rs1.getString("opc_name") %></option>
									<%} %>
									</select>
									</div>
								</div>
								
								</div>
								
								<div class="form-group">
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Date Of Birth</label>
									<div class="col-sm-8">
										<input type="date" name="dob" class="form-control1" id="inputPassword" placeholder="" required>
									</div>
								</div>
									
									<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Address</label>
									<div class="col-sm-8">
										<input type="text" name="address" class="form-control1" id="inputPassword" placeholder="Ahmedabad" required>
									</div>
								</div>
								
								</div>
								
								
								<div class="form-group">
								<div class="col-md-6">
								
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Cust ID</label>
									<div class="col-sm-8">
										<input type="text" name="custId" value="<%=formatted %>" class="form-control" id="inputPassword" placeholder="" disabled="disabled">
										<input type="hidden" name="custId" value="<%=formatted %>" class="form-control1" id="inputPassword" placeholder="">
									</div>
								</div>
									
									<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Pin code</label>
									<div class="col-sm-8">
										<input type="text" name="pinCode" class="form-control1" id="inputPassword" placeholder="413109" required>
									</div>
								</div>
								
								</div>
								
								<div class="form-group">
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Fin. Year</label>
									<div class="col-sm-8">
										<select name = "finYear" id="year" class="form-control" id="finYear" required>
											<option>--Select--</option>
											<option value="2014-15">2014-15</option>
											<option value="2015-16">2015-16</option>
											<option value="2016-17">2016-17</option>
											<option value="2017-18">2017-18</option>
											<option value="2018-19">2018-19</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Plan Type</label>
									<div class="col-sm-8">
										<select name = "planType" id="planType" class="form-control" id="planType" onchange="getPlanId(this.value)">
											<option value = "select">--Select</option>
											<option value = "RD">RD</option>
											<option value = "FD">FD</option>
											<option value = "MIS">MIS</option>
										</select>
									</div>
									<script type="text/javascript">
									var xmlHttp  
								      var xmlHttp
								      function getPlanId(str){
								      if (typeof XMLHttpRequest != "undefined"){
								      xmlHttp= new XMLHttpRequest();
								      }
								      else if (window.ActiveXObject){
								      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
								      }
								      if (xmlHttp==null){
								      alert("Browser does not support XMLHTTP Request")
								      return;
								      } 
								      var year=document.getElementById("year").value;
								      
								      var url="addNewpolicyGetPlanId.jsp";
								      url +="?planType="+str+"&year="+year;
								      xmlHttp.onreadystatechange = stateChange;
								      xmlHttp.open("GET", url, true);
								      xmlHttp.send(null);
								      }

								      function stateChange(){   
								      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
								      document.getElementById("addpin").innerHTML=xmlHttp.responseText   
								      }   
								      }
								      
									/* function getPlanId()
									{
										var xmlhttp;
										var planType=document.getElementById("planType").value;
										var year=document.getElementById("year").value;
										var urls="addNewpolicyGetPlanId.jsp?planType="+planType+"&year="+year;
										if (window.XMLHttpRequest){
										  xmlhttp=new XMLHttpRequest();
										  }
										else{
										  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
										  }
										xmlhttp.onreadystatechange=function(){
										  if (xmlhttp.readyState==4){
										        var result=xmlhttp.responseText;
										        document.getElementById("addpin").innerHTML = result;
										    }
										};
										xmlhttp.open("GET",urls,true);
										xmlhttp.send();
										} */
									</script>
								</div>
									
								
								</div>
								
								<div class="form-group">
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Plan ID</label>
									<div class="col-sm-8" id="addpin">
									<select class="form-control">
									<option>--select--</option>
									</select>
								
								<input type="hidden" name="period" id="period">
									</div>
									<script type="text/javascript">
									function getamount()
									{
										
										var planType=document.getElementById("planType").value;
										var year=document.getElementById("year").value;
										var planID=document.getElementById("planID").value;
										
										 	var urls="addNewpolicyGetAmount.jsp?planType="+planType+"&year="+year+"&planID="+planID;    
										 	if (window.XMLHttpRequest){
										 		  xmlhttp=new XMLHttpRequest();
										 		  }
										 		else{
										 		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
										 		  }
										 		xmlhttp.onreadystatechange=function(){
										 		  if (xmlhttp.readyState==4){
										 		        var result=xmlhttp.responseText;
										 		       
										 		        document.getElementById("pAmount").value = result;
										 		       document.getElementById("p1Amount").value = result;
										 		       getYHQMAmount();
										 		    }
										 		};
										 		xmlhttp.open("GET",urls,true);	
										 		xmlhttp.send();
									}
									
									function getYHQMAmount()
									{
										
										var planType=document.getElementById("planType").value;
										var year=document.getElementById("year").value;
										var planID=document.getElementById("planID").value;
										var y="Y";
										 	var urls="addNewpolicyGetYHQMAmount.jsp?planType="+planType+"&year="+year+"&planID="+planID+"&y="+y;    
										 	if (window.XMLHttpRequest){
										 		  xmlhttp=new XMLHttpRequest();
										 		  }
										 		else{
										 		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
										 		  }
										 		xmlhttp.onreadystatechange=function(){
										 		  if (xmlhttp.readyState==4){
										 		        var result=xmlhttp.responseText;
										 		        document.getElementById("yearly").value = result;
										 		       getHAmount();
										 		      
										 		    }
										 		};
										 		xmlhttp.open("GET",urls,true);	
										 		xmlhttp.send();
									}
									function getHAmount()
									{
										
										var planType=document.getElementById("planType").value;
										var year=document.getElementById("year").value;
										var planID=document.getElementById("planID").value;
										var y="H";
										 	var urls="addNewpolicyGetYHQMAmount.jsp?planType="+planType+"&year="+year+"&planID="+planID+"&y="+y;    
										 	if (window.XMLHttpRequest){
										 		  xmlhttp=new XMLHttpRequest();
										 		  }
										 		else{
										 		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
										 		  }
										 		xmlhttp.onreadystatechange=function(){
										 		  if (xmlhttp.readyState==4){
										 		        var result=xmlhttp.responseText;
										 		        document.getElementById("halfly").value = result;
										 		       getQAmount();
										 		      
										 		    }
										 		};
										 		xmlhttp.open("GET",urls,true);	
										 		xmlhttp.send();
									}
									function getQAmount()
									{
										
										var planType=document.getElementById("planType").value;
										var year=document.getElementById("year").value;
										var planID=document.getElementById("planID").value;
										var y="Q";
										 	var urls="addNewpolicyGetYHQMAmount.jsp?planType="+planType+"&year="+year+"&planID="+planID+"&y="+y;    
										 	if (window.XMLHttpRequest){
										 		  xmlhttp=new XMLHttpRequest();
										 		  }
										 		else{
										 		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
										 		  }
										 		xmlhttp.onreadystatechange=function(){
										 		  if (xmlhttp.readyState==4){
										 		        var result=xmlhttp.responseText;
										 		        document.getElementById("quartly").value = result;
										 		       getMAmount();
										 		      
										 		    }
										 		};
										 		xmlhttp.open("GET",urls,true);	
										 		xmlhttp.send();
									}
									function getMAmount()
									{
										
										var planType=document.getElementById("planType").value;
										var year=document.getElementById("year").value;
										var planID=document.getElementById("planID").value;
										var y="M";
										 	var urls="addNewpolicyGetYHQMAmount.jsp?planType="+planType+"&year="+year+"&planID="+planID+"&y="+y;    
										 	if (window.XMLHttpRequest){
										 		  xmlhttp=new XMLHttpRequest();
										 		  }
										 		else{
										 		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
										 		  }
										 		xmlhttp.onreadystatechange=function(){
										 		  if (xmlhttp.readyState==4){
										 		        var result=xmlhttp.responseText;
										 		        document.getElementById("monthly").value = result;
										 		    }
										 		};
										 		xmlhttp.open("GET",urls,true);	
										 		xmlhttp.send();
									}
									</script>
									
								</div>
									
									
									<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Months</label>
									<div class="col-sm-8" id="mahesh">
									<select name="month" class="form-control" id="month" onchange="getmon();">
									 <option value="3">3</option>
									  
									 <option value="6">6</option>
									  
									 <option value="12">12</option>
									  
									 <option value="18">18</option>
									  
									 <option value="24">24</option>
									  
									 <option value="30">30</option>
									  
									 <option value="36">36</option>
									  
									 <option value="42">42</option>
									  
									 <option value="48">48</option>
									  
									 <option value="54">54</option>
									  
									 <option value="60">60</option>
									  
									 <option value="66">66</option>
									  
									 <option value="72">72</option>
									  
									 <option value="78">78</option>
									  
									 <option value="84">84</option>
									  
									 <option value="90">90</option>
									  
									 <option value="96">96</option>
									  
									 <option value="102">102</option>
									  
									 <option value="108">108</option>
									  
									 <option value="114">114</option>
									  
									 <option value="120">120</option>

									</select>
									<script type="text/javascript">
function getmon()
{
	var planType=document.getElementById("planType").value;
	var year=document.getElementById("year").value;
	var planID=document.getElementById("planID").value;
	var month=document.getElementById("month").value;
	
	 	var urls="addNewpolicyGetMonths.jsp?planType="+planType+"&year="+year+"&planID="+planID+"&month="+month;    
	 	if (window.XMLHttpRequest){
	 		  xmlhttp=new XMLHttpRequest();
	 		  }
	 		else{
	 		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	 		  }
	 		xmlhttp.onreadystatechange=function(){
	 		  if (xmlhttp.readyState==4){
	 		        var result=xmlhttp.responseText;
	 		      if(parseInt(result)==0)
	 		    	  {
	 		    	  alert("plan not Available Please select another Month");
	 		    	  }
	 		      else
	 		    	  {
	 		    	  
	 		    	 var pType=document.getElementById("planType").value;
	 		    	 if(pType=="RD")
	 		    		 {
	 		    		var value=document.getElementById("yearly").value;
						   document.getElementById("p1Amount").value=value;
						   document.getElementById("pAmount").value=value;
						   document.getElementById("mAmount").value = result;
	 		    		 }
	 		    	 else if(pType=="MIS")
 		    		 {
	 		    		 document.getElementById("yearly").value =  parseInt(result)*12;
	 		    		 document.getElementById("halfly").value = parseInt(result)*6;
	 		    		 document.getElementById("quartly").value = parseInt(result)*3;
	 		    		 document.getElementById("monthly").value = parseInt(result)*1;
		 		    		var pAmt=document.getElementById("p1Amount").value;
							   document.getElementById("mAmount").value = pAmt;
		 		    		 }
	 		    	 else
	 		    		 {
	 		    		 document.getElementById("mAmount").value = result;
	 		    		 }
	 		    	 
	 		       
	 		       getMatDate();
	 		    	  }
	 		    }
	 		};
	 		xmlhttp.open("GET",urls,true);	
	 		xmlhttp.send();
}

function getMatDate()
{
	var month=document.getElementById("month").value;
	
	 	var urls="addNewpolicyGetMatDate.jsp?month="+month;    
	 	if (window.XMLHttpRequest){
	 		  xmlhttp=new XMLHttpRequest();
	 		  }
	 		else{
	 		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	 		  }
	 		xmlhttp.onreadystatechange=function(){
	 		  if (xmlhttp.readyState==4){
	 		        var result=xmlhttp.responseText;
	 		      
	 		    	  
	 		    	  
	 		        document.getElementById("mDate").value = result;
	 		    	  
	 		    }
	 		};
	 		xmlhttp.open("GET",urls,true);	
	 		xmlhttp.send();
}

</script>
									</div>
									
									
								</div>
								
								</div>
								
								<div class="form-group">	
									<script type="text/javascript">
									$(function () {
									     $('#row_dim').hide();
									     $('#planType').change(function () {
									         $('#row_dim').hide();
									         if (this.options[this.selectedIndex].value == 'RD'||this.options[this.selectedIndex].value == 'MIS') {
									             $('#row_dim').show();
									         }
									     });
									 });
									</script>
									
									<div style = "margin-left:16px;width:0px;" id="row_dim">
									<b for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Payment Mode</b>
									
									<table style = "background-color: white;margin-left:100px;">
									<tr>
										<td><input type = "checkbox" checked="checked" id="y" name = "y"></td><td><label class="col-sm-4 control-label" style = "font-size:18px;text-align:left;"><b>Y:</b></label></td><td><input name="yearly" id="yearly" type = "text" disabled="disabled"><input name="yearly" id="yearly" type = "hidden"></td>
										<td><input type = "checkbox" id="h" name = "h"></td><td><label class="col-sm-4 control-label" style = "font-size:18px;text-align:left;"><b>H:</b></label></td><td><input name="halfly" id="halfly" type = "text" disabled="disabled"><input name="halfly" id="halfly" type = "hidden"></td>
									</tr>
									<tr style = "background-color: white">
										<td><input type = "checkbox" id="q" name = "q"></td><td><label class="col-sm-4 control-label" style = "font-size:18px;text-align:left;"><b>Q:</b></label></td><td><input name="quartly" id="quartly" type = "text" disabled="disabled"><input name="quartly" id="quartly" type = "hidden"></td>
										<td><input type = "checkbox" id="m" name = "m"></td><td><label class="col-sm-4 control-label" style = "font-size:18px;text-align:left;"><b>M:</b></label></td><td><input name="monthly" id="monthly" type = "text" disabled="disabled"><input name="monthly" id="monthly" type = "hidden"></td>
									</tr>
									</table>
									</div>	
								<script>
								$('#y').click(function(){
									  if ($(this).is(':checked')){
									    var plantype=document.getElementById("planType").value;
									    if(plantype=="RD")
										   {
									   var value=document.getElementById("yearly").value;
									   document.getElementById("p1Amount").value=value;
									   document.getElementById("pAmount").value=value;
									   
									   }else if(plantype=="MIS"){
										   var pamount=document.getElementById("p1Amount").value;
										   document.getElementById("mAmount").value=pamount;
											  document.getElementById("h").checked = false;
											   document.getElementById("q").checked = false;
											   document.getElementById("m").checked = false;
									   }
									  }
									  else {
									  }
									});
								$('#h').click(function(){
									  if ($(this).is(':checked')){
									    
									    var plantype=document.getElementById("planType").value;
									    if(plantype=="RD")
										   {
									   var value=document.getElementById("halfly").value;
									   document.getElementById("p1Amount").value=value;
									   document.getElementById("pAmount").value=value;
									   
									   }else if(plantype=="MIS"){
										   var pamount=document.getElementById("p1Amount").value;
										   document.getElementById("mAmount").value=pamount;
											  document.getElementById("y").checked = false;
											   document.getElementById("q").checked = false;
											   document.getElementById("m").checked = false;
									   }
									  }
									  else { 
									  }
									});
								$('#q').click(function(){
									  if ($(this).is(':checked')){
									    
									    var plantype=document.getElementById("planType").value;
									    if(plantype=="RD")
										   {
									   var value=document.getElementById("quartly").value;
									   document.getElementById("p1Amount").value=value;
									   document.getElementById("pAmount").value=value;
									   
									   }else if(plantype=="MIS"){
										   var pamount=document.getElementById("p1Amount").value;
										   document.getElementById("mAmount").value=pamount;
											  document.getElementById("y").checked = false;
											   document.getElementById("h").checked = false;
											   document.getElementById("m").checked = false;
									   }
									  }
									  else {
									  }
									});
								$('#m').click(function(){
									  if ($(this).is(':checked')){
									    
									    var plantype=document.getElementById("planType").value;
									    if(plantype=="RD")
										   {
									   var value=document.getElementById("monthly").value;
									   document.getElementById("p1Amount").value=value;
									   document.getElementById("pAmount").value=value;
									   
									   }else if(plantype=="MIS"){
										   var pamount=document.getElementById("p1Amount").value;
										   document.getElementById("mAmount").value=pamount;
											  document.getElementById("y").checked = false;
											   document.getElementById("h").checked = false;
											   document.getElementById("q").checked = false;
									   }
									  }
									  else {
									  }
									});
								</script>
								</div>
								
								<div class="form-group">
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Plan Amount</label>
									<div class="col-sm-8">
									<input type="text" name="" id="p1Amount" class="form-control" id="inputPassword" placeholder="" required disabled="disabled">
									<input type="hidden" name="" id="p1Amount" class="form-control1" id="inputPassword" placeholder="" required>
									</div>
								</div>	
								<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Maturity Amount</label>
										<div class="col-sm-8">
											<input type="text" name="mAmount" id="mAmount" class="form-control" id="inputPassword" placeholder="" required disabled="disabled">
											<input type="hidden" name="mAmount" id="mAmount" class="form-control1" id="inputPassword" placeholder="" required>
										</div>
									</div>
								
															
								</div>
								
								
								<div class ="form-group">
									<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Policy Payment Method</label>
									<div class="col-sm-8">
									<select class="form-control" id="ppayMethod" name="ppayMethod" onchange="policyPay()">
									<option>Select</option>
									<option value="Cash">Cash</option>
									<option value="DD">DD</option>
									</select>
									<script type="text/javascript">
									$(function () {
									     $('#dispPayMethodForpolicy').hide();
									     $('#ppayMethod').change(function () {
									         $('#dispPayMethodForpolicy').hide();
									         if (this.options[this.selectedIndex].value == 'DD') {
									             $('#dispPayMethodForpolicy').show();
									         }
									     });
									 });
									</script>
									
									<script type="text/javascript">
									function policyPay()
									{
										var ppayMethod=document.getElementById("ppayMethod").value;
										if(String(ppayMethod)=="DD")
											{
											var urls="addNewPolicyDispcustPayM.jsp";    
											if (window.XMLHttpRequest){
												  xmlhttp=new XMLHttpRequest();
												  }
												else{
												  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
												  }
												xmlhttp.onreadystatechange=function(){
												  if (xmlhttp.readyState==4){
												        var result=xmlhttp.responseText;
												        document.getElementById("dispPayMethodForpolicy").innerHTML = result;
												    }
												};
												xmlhttp.open("GET",urls,true);
												xmlhttp.send();
											}
										else
											{
											var urls="addNewPolicyDispcustPayM.jsp";    
											if (window.XMLHttpRequest){
												  xmlhttp=new XMLHttpRequest();
												  }
												else{
												  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
												  }
												xmlhttp.onreadystatechange=function(){
												  if (xmlhttp.readyState==4){
												        var result=xmlhttp.responseText;
												        document.getElementById("dispPayMethodForpolicy").innerHTML = result;
												        document.getElementById("ddNo").value="0";
														document.getElementById("bankName").value="0";
														document.getElementById("bName").value="0";
												    }
												};
												xmlhttp.open("GET",urls,true);
												xmlhttp.send();
											
											}
										
									}
									</script>
									</div>
								</div>
										
										<div class="col-md-6">
									<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Maturity Date</label>
										<div class="col-sm-8">
											<input type="text" name="mDate" id="mDate" class="form-control" id="inputPassword" placeholder="" required disabled="disabled">
											<input type="hidden" name="mDate" id="mDate" class="form-control1" id="inputPassword" placeholder="" required>
										</div>
									</div>
								</div>
								<div id="dispPayMethodForpolicy">
								
								</div>
								
								<div class="form-group">
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Introducer Code</label>
									<div class="col-sm-8">
										<input type="text" name="introCode" id="introCode" class="form-control1" id="inputPassword" placeholder="" onchange="s()"/ required>
									</div>
								</div>
									<script type="text/javascript">
									function s()
									{
											var year=document.getElementById("year").value;
										 	var introCode=document.getElementById("introCode").value;
										 	var urls="getIntoName.jsp?introId="+introCode+"&year="+year;    
										 	if (window.XMLHttpRequest){
										 		  xmlhttp=new XMLHttpRequest();
										 		  }
										 		else{
										 		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
										 		  }
										 		xmlhttp.onreadystatechange=function(){
										 		  if (xmlhttp.readyState==4){
										 		        var result=xmlhttp.responseText;
										 		        document.getElementById("introName").value = result;
										 		       getIntroLevel();
										 		    }
										 		};
										 		xmlhttp.open("GET",urls,true);	
										 		xmlhttp.send();
									}
									
									function getIntroLevel()
									{
										 	var introCode=document.getElementById("introCode").value;
										 	var level="Level";
										 	var urls="addNewpolicyGetIntroLevel.jsp?introId="+introCode+"&level="+level;    
										 	if (window.XMLHttpRequest){
										 		  xmlhttp=new XMLHttpRequest();
										 		  }
										 		else{
										 		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
										 		  }
										 		xmlhttp.onreadystatechange=function(){
										 		  if (xmlhttp.readyState==4){
										 		        var result=xmlhttp.responseText;
										 		        
										 		        document.getElementById("introLevel").value = result;
										 		       getIntroSpot();
										 		    }
										 		};
										 		xmlhttp.open("GET",urls,true);	
										 		xmlhttp.send();
									}
									function getIntroSpot()
									{
											var planType=document.getElementById("planType").value;
											var year=document.getElementById("year").value;
											var month=document.getElementById("month").value;
											var introLevel=document.getElementById("introLevel").value;
										 	var level="Level11";
										 	var spot="spot";
										 	var urls="addNewpolicyGetIntroSpot.jsp?introLevel="+introLevel+"&year="+year+"&planType="+planType+"&month="+month+"&=level"+level+"";    
										 	if (window.XMLHttpRequest){
										 		  xmlhttp=new XMLHttpRequest();
										 		  }
										 		else{
										 		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
										 		  }
										 		xmlhttp.onreadystatechange=function(){
										 		  if (xmlhttp.readyState==4){
										 		        var result=xmlhttp.responseText;
										 		        document.getElementById("sIncentive").value = result;
										 		       
										 		       var sAmount=(document.getElementById("pAmount").value/100)*result;
										 		       var admin=parseInt(sAmount)/100*5;
										 		       var TDS=parseInt(sAmount)/100*20;
										 		       var finalspot=parseInt(sAmount)-admin-TDS;
										 		      	document.getElementById("sAmount").value = finalspot;
										 		      	
										 		      	var netPay=document.getElementById("pAmount").value-sAmount;
										 		        document.getElementById("netPay").value = netPay;
										 		        	
										 		    	 
										 		    }
										 		};
										 		xmlhttp.open("GET",urls,true);	
										 		xmlhttp.send();
									}
									</script>
								
									<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Intro Name</label>
									<div class="col-sm-8">
										<input type="text" name="introName" id="introName" class="form-control" id="inputPassword" placeholder="" disabled="disabled">
										<input type="hidden" name="introName" id="introName" class="form-control1" id="inputPassword" placeholder="">
									</div>
								</div>
								
								</div>
								
								<div class="form-group">
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Intro Level</label>
									<div class="col-sm-8">
									<input type="text" name="introLevel" id="introLevel" class="form-control" id="inputPassword" placeholder="" disabled="disabled">
									<input type="hidden" name="introLevel" id="introLevel" class="form-control1" id="inputPassword" placeholder="">
									<%-- <select name="introlevel" id="introLevel" class="form-control" onchange="sel1()">
									
									<%
									Connection con2=DBConnection.getConnection();
								Statement stmt2 = con2.createStatement();
								String query2 = "SELECT * FROM level";
								ResultSet rs2=stmt2.executeQuery(query2);			
								while(rs2.next()){
								 %>
									<option value="<%=rs2.getString("level") %>"><%=rs2.getString("level") %></option>
									<%} %>
									</select> --%>
									
									</div>
								</div>
									
									<script>
									function sel1()
									{
										
										var period=document.getElementById("period").value;
										var introLevel=document.getElementById("introLevel").value;
										var urls="getPerByLevel.jsp?introLevel="+introLevel+"&period="+period;    
									 	if (window.XMLHttpRequest){
									 		  xmlhttp=new XMLHttpRequest();
									 		  }
									 		else{
									 		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
									 		  }
									 		xmlhttp.onreadystatechange=function(){
									 		  if (xmlhttp.readyState==4){
									 		        var sIncentive=xmlhttp.responseText;
									 		       document.getElementById("sIncentive").value = sIncentive;
									 		       
									 		      	var sAmount=(document.getElementById("amount").value/100)*sIncentive;
									 		      	document.getElementById("sAmount").value = sAmount;
									 		      	
									 		      	var netPay=document.getElementById("amount").value-sAmount;
									 		        document.getElementById("netPay").value = netPay;
									 		    }
									 		};
									 		xmlhttp.open("GET",urls,true);	
									 		xmlhttp.send();
									}
									</script>
									<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Spot incentive</label>
									<div class="col-sm-8">
										<input type="text" id="sIncentive" name="sIncentive" class="form-control" id="inputPassword" placeholder="" disabled="disabled">
										<input type="hidden" id="sIncentive" name="sIncentive" class="form-control1" id="inputPassword" placeholder="">
									</div>
								</div>
								
								</div>
								
								
								<div class="form-group">
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Spot Amount</label>
									<div class="col-sm-8">
										<input type="text" name="sAmount" id="sAmount" class="form-control" id="inputPassword" placeholder="" disabled="disabled">
										<input type="hidden" name="sAmount" id="sAmount" class="form-control1" id="inputPassword" placeholder="">
									</div>
								</div>
									
									<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Net Payable</label>
									<div class="col-sm-8">
										<input type="text" name="netPay" id="netPay" class="form-control" id="inputPassword" placeholder="" disabled="disabled">
										<input type="hidden" name="netPay" id="netPay" class="form-control1" id="inputPassword" placeholder="">
									</div>
								</div>
								
								</div>
								
								
								<div class="form-group">
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Payment Method</label>
									<div class="col-sm-8">
									<select class="form-control" id="payMethod" name="payMethod" onchange="getMethod()">
									<option>Select</option>
									<option value="Cash">Cash</option>
									<option value="Net Banking">Credit</option>
									</select>
									<script>
									function getMethod()
									{
										var payMethod=document.getElementById("payMethod").value;
										if(payMethod=="Cash")
											{
											var planAmount=document.getElementById("pAmount").value;
											var sAmount=document.getElementById("sAmount").value;
											var amount=parseInt(planAmount)-parseInt(sAmount);
											document.getElementById("netPay").value = amount;
											}
										else
											{
											var planAmount=document.getElementById("pAmount").value;
											document.getElementById("netPay").value = planAmount;
											}
										
									}
									</script>
									</div>
								</div>
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;">Plan Amount</label>
									<div class="col-sm-8">
									<input type="text" name="planAmount" id="pAmount" class="form-control" id="inputPassword" placeholder="" disabled="disabled">
									<input type="hidden" name="planAmount" id="pAmount" class="form-control1" id="inputPassword" placeholder="">
									</div>
								</div>								
								</div>
								
								<div class="form-group">
								<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;"></label>
									<div class="col-sm-8">
										
									</div>
								</div>
									
									<div class="col-md-6">
								<label for="inputPassword" class="col-sm-4 control-label" style = "font-size:18px;text-align:left;"></label>
									<div class="col-sm-8">
										<button style="float: right;" class="btn-primary btn">Confirm And Print</button>
									</div>
								</div>
								
								</div>
							</form>
						</div>
					</div>
					
					

     
     
     
  
  </div>
 	</div>
 
 
<div id="dispmonthss" >

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