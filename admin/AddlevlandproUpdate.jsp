<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
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
	PreparedStatement ps=(PreparedStatement) cn.prepareStatement("update level set finyerar=?,pbuss=? where level=?");
	ps.setString(1, request.getParameter("finyear"));
	ps.setString(2, request.getParameter("pbuss"));
	ps.setString(3, request.getParameter("level"));

	res=ps.executeUpdate();
	if(res>0)
	{%>
	<script type="text/javascript">
	alert("Level & Promotion Updated Sucesssfully");
	window.location='AddLevelandPromotion.jsp';
	</script>
	<%}
	else{%>
	<script type="text/javascript">
	alert("Level & Promotion not Updated");
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