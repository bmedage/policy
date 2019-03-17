<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String buffer="<select name='planID' class='form-control' id='planID' onchange='getamount()'><option value='-1'>- - Select - -</option>";
 Connection con=DBConnection.getConnection();
 PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
 ptmt.executeQuery();
PreparedStatement pstmt=con.prepareStatement("SELECT * FROM add_plan where year=? And type=? group by plan_id");
pstmt.setString(1, request.getParameter("year"));
pstmt.setString(2, request.getParameter("planType"));
ResultSet rs=pstmt.executeQuery();			
//Extact result from ResultSet rs
while(rs.next()){	
	buffer=buffer+"<option value='"+rs.getString("plan_id")+"'>"+rs.getString("plan_id")+"</option>";
 
}
buffer=buffer+"</select>";  
response.getWriter().println(buffer); 			
%>

