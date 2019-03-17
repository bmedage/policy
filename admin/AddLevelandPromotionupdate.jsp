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
if(session.getAttribute("userName")==null)
{%>
	<script type="text/javascript">
	alert("Please LogIn First");
	window.location='adminlogin.jsp';
	</script>
<%}
%>

<%


Connection con =DBConnection.getConnection();
PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
ptmt.executeQuery();
PreparedStatement pstmt=con.prepareStatement("update level set finyerar=?,pbuss=?,incentive=?,minFO=?,maxFO=? where level=?");
pstmt.setString(1, request.getParameter("finyear1"));
pstmt.setString(2, request.getParameter("pbuss"));
pstmt.setString(3, request.getParameter("incentive"));
pstmt.setString(4, request.getParameter("minFO"));
pstmt.setString(5, request.getParameter("maxFO"));

pstmt.setString(6, request.getParameter("level"));
int res=pstmt.executeUpdate();

if(res>0)
	
{%>
<script type="text/javascript">
alert(" Level and Promotion updated Successfully");
window.location='AddLevelandPromotion.jsp';
</script>
<%	

}


else  {%>

<script type="text/javascript">
alert("Level and Promotion Not updated ");
window.location='errorpage.html';
</script>
<%}
%>
	
	
	



</body>
</html>