<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
PrintWriter pw=response.getWriter();
System.out.println(request.getParameter("year"));
System.out.println(request.getParameter("planType"));
System.out.println(request.getParameter("planID"));
session.setAttribute("year", request.getParameter("year"));
session.setAttribute("planType", request.getParameter("planType"));
session.setAttribute("planID", request.getParameter("planID"));
 Connection con=DBConnection.getConnection();
 PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
 ptmt.executeQuery();
PreparedStatement pstmt=con.prepareStatement("SELECT * FROM add_plan where year=? And type=? And plan_id=? And month=?");
pstmt.setString(1, request.getParameter("year"));
pstmt.setString(2, request.getParameter("planType"));
pstmt.setString(3, request.getParameter("planID"));
pstmt.setString(4, request.getParameter("month"));
ResultSet rs=pstmt.executeQuery();			
//Extact result from ResultSet rs
while(rs.next()){
	System.out.println(rs.getString("price"));
	int price=Integer.parseInt(rs.getString("price"));
	pw.println(rs.getString("price"));
}			
%>
