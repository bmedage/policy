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
int res=0;
int i=0;
String arr[]={"3","6","12","18","24","30","36","42","48","54","60","66","72","78","84","90","96","102","108","114","120"};
for(i=0;i<arr.length;i++)
{
	String month="mon"+arr[i];
Connection con =DBConnection.getConnection();
PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
ptmt.executeQuery();
PreparedStatement pstmt=con.prepareStatement("update prom_buss_structure set price=? where year=? And type=? And month=?");
pstmt.setString(1, request.getParameter(month));
pstmt.setString(2, request.getParameter("fyear"));
pstmt.setString(3, request.getParameter("type"));
pstmt.setString(4, arr[i]);
res=pstmt.executeUpdate();
}
if(res>0)
	
{%>
<script type="text/javascript">
alert("Promotional Bussiness updated Successfully");
window.location='addPromotiveBusinessCalc.jsp';
</script>
<%	
}
else  {%>
<script type="text/javascript">
alert("Promotional Bussiness Not updated ");
window.location='errorpage.html';
</script>
<%}
%>
</body>
</html>