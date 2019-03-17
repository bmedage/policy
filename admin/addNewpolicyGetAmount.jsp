<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%
PrintWriter pw=response.getWriter();
 Connection con=DBConnection.getConnection();
 PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
 ptmt.executeQuery();
PreparedStatement pstmt=con.prepareStatement("SELECT * FROM add_plan where year=? And type=? And plan_id=?");
pstmt.setString(1, request.getParameter("year"));
pstmt.setString(2, request.getParameter("planType"));
pstmt.setString(3, request.getParameter("planID"));
ResultSet rs=pstmt.executeQuery();			
//Extact result from ResultSet rs
if(rs.next()){
	System.out.println(rs.getString("amount"));
	pw.println(rs.getString("amount"));
}			
%>
