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
Connection con =DBConnection.getConnection();
PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
ptmt.executeQuery();
int res=0;
int i=0;
String arr[]={"Y","H","Q","M","3","6","12","18","24","30","36","42","48","54","60","66","72","78","84","90","96","102","108","114","120"};
for(i=0;i<arr.length;i++)
{
	String month="mon"+arr[i];

PreparedStatement pstmt=con.prepareStatement("update add_plan set price=? where plan_id=? And year=? And type=? And month=?");
pstmt.setString(1, request.getParameter(month));
pstmt.setString(2, request.getParameter("plan_id"));
pstmt.setString(3, request.getParameter("fyear"));
pstmt.setString(4, request.getParameter("type"));
pstmt.setString(5, arr[i]);
res=pstmt.executeUpdate();
}
if(res>0)	
{
	PreparedStatement pstmt=con.prepareStatement("update add_plan set Yr=?,hlf=?,qtr=?,mnthly=? where plan_id=? And year=? And type=?");
	pstmt.setString(1, request.getParameter("yearly"));
	pstmt.setString(2, request.getParameter("halfly"));
	pstmt.setString(3, request.getParameter("quar"));
	pstmt.setString(4, request.getParameter("mon"));
	pstmt.setString(5, request.getParameter("plan_id"));
	pstmt.setString(6, request.getParameter("fyear"));
	pstmt.setString(7, request.getParameter("type"));
	pstmt.executeUpdate();
%>
<script type="text/javascript">
alert("Plan updated Successfully");
window.location='AddPlan.jsp';
</script>
<%	
}
else  {%>
<script type="text/javascript">
alert("Plan Not updated ");
window.location='errorpage.html';
</script>
<%}
%>
</body>
</html>