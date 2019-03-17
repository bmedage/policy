<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
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

int res=0;
try{
	Connection cn=DBConnection.getConnection();
	PreparedStatement ptmt=cn.prepareStatement("set global max_connections=100000000");
	ptmt.executeQuery();
	
	response.setContentType("text/html");
	
	String insert="insert into opa(finyerar,pbuss,level,price,period,pamount,date)values(?,?,?,?,?,?,?)";
	Calendar calendar = Calendar.getInstance();
    java.sql.Date ourdate = new java.sql.Date(calendar.getTime().getTime());
	
	PreparedStatement ps=(PreparedStatement) cn.prepareStatement(insert);
	ps.setString(1, request.getParameter("finyear"));
	ps.setString(2, request.getParameter("pbuss"));
	ps.setString(3, request.getParameter("level"));
	ps.setString(4, request.getParameter("prize"));
	ps.setString(5, request.getParameter("period"));
	ps.setString(6, request.getParameter("pAmount"));
	ps.setDate(7, ourdate);
	res=ps.executeUpdate();
	if(res>0)
	{%>
	<script type="text/javascript">
	alert("OPA  Added Sucesssfully");
	window.location='AddEditOPAList.jsp';
	</script>
	<%}
	else{%>
	<script type="text/javascript">
	alert("OPA not Added");
	window.location='errorpage.html';
	</script>
	<%}
}
catch(Exception e)
	{
	e.printStackTrace();
	}
 	%>
</body>
</html>