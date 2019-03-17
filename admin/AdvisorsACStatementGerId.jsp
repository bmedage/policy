<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.*"%>
<%
String year=request.getParameter("year");  
 String buffer="<select class='form-control1' id='advCode' placeholder='DD/MM/YYYY' onchange='getACStmtByADVCOde()'><option value='-1'>- - Select - -</option>";  
 try{
	 Connection con1=DBConnection.getConnection();
	 PreparedStatement ptmt=con1.prepareStatement("set global max_connections=100000000");
		ptmt.executeQuery();
	 PreparedStatement pstmt=con1.prepareStatement("select * from advisors where year=?");
	 pstmt.setString(1, year);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
   buffer=buffer+"<option value='"+rs.getString("pin_no")+"'>"+rs.getString("pin_no")+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
 
 

 
	