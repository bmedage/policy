<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="com.pit.policy.database.DBConnection.*"%>
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
	try{

	Connection con =DBConnection.getConnection();
	PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
	ptmt.executeQuery();
	PreparedStatement pstmt=con.prepareStatement("update advisors set name=?,intro_code=?,intro_name=?,pan_card=?,mobile=?,address=?,near_opc=?,pin_code=?,code=?,pay_method=?,addhar_card=? where pin_no = ? And year=?");
	
		
	pstmt.setString(1, request.getParameter("name"));
	pstmt.setString(2, request.getParameter("intCode"));

	pstmt.setString(3, request.getParameter("itroName"));
	
	pstmt.setString(4, request.getParameter("panCard"));
	pstmt.setString(5, request.getParameter("mobNo"));
	
	pstmt.setString(6, request.getParameter("address"));
	pstmt.setString(7, request.getParameter("nearOpc"));
	pstmt.setString(8, request.getParameter("pinCode"));
	pstmt.setString(9, request.getParameter("code"));
	pstmt.setString(10, request.getParameter("paymethod"));
	pstmt.setString(11, request.getParameter("aadharNo"));
	
	
	pstmt.setString(12, request.getParameter("pin_no"));
	pstmt.setString(13, request.getParameter("year"));
	int res=pstmt.executeUpdate();
	
	if(res>0)
		
	{%>
	<script type="text/javascript">
	alert("Advisor updated Successfully");
	window.location='AdvisorsList.jsp';
	</script>
	<%	
	
	}
	
	
	else  {%>
	
	<script type="text/javascript">
	alert("Advisor Not updated ");
	window.location='errorpage.html';
	</script>
	<%}
	}
	catch(Exception e)
	{
		
		
	}
	%>
		
		
		
	
	

</body>
</html>