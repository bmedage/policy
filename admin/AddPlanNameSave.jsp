<%@page import="com.pit.policy.save.AddPlanForMonths"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
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
<%
System.out.println("Hello"+request.getParameter("planid"));
System.out.println("Hello"+request.getParameter("fyear"));
System.out.println("Hello"+request.getParameter("type"));
System.out.println("Hello"+request.getParameter("amount"));
Connection con=DBConnection.getConnection();
PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
ptmt.executeQuery();
PreparedStatement pstmt=con.prepareStatement("insert into addplan(planid,year,type,amount) values(?,?,?,?)");
pstmt.setString(1, request.getParameter("planid"));
pstmt.setString(2, request.getParameter("fyear"));
pstmt.setString(3, request.getParameter("type"));
pstmt.setString(4, request.getParameter("amount"));
int res=pstmt.executeUpdate();
if(res>0)
{
	System.out.println("result "+res);	
int val=AddPlanForMonths.addPlanForMonths(request.getParameter("type"), request.getParameter("amount"), request.getParameter("planid"), request.getParameter("fyear"));


%>
<script type="text/javascript">
alert("Plan Name Added successfully");
window.location='AddPlanId.jsp';
</script>
<%}else{%>
<script type="text/javascript">
alert("plan Name Added unsuccessfully");
window.location='errorpage.html';
</script>	
<%}%>
</body>
</html>