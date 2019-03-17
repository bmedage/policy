<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.*"%>
<%
String year=request.getParameter("year");  
 String buffer="<select class='form-control1' id='opcnameid' placeholder='DD/MM/YYYY' name='opcname' onChange='opcnamecall()'><option value='-1'>- - Select - -</option>";  
 try{
	 Connection con1=DBConnection.getConnection();
	 PreparedStatement ptmt=con1.prepareStatement("set global max_connections=100000000");
	 ptmt.executeQuery();
	 PreparedStatement pstmt=con1.prepareStatement("select * from advisors where year=? group by near_opc");
	 pstmt.setString(1, year);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
   buffer=buffer+"<option value='"+rs.getString("near_opc")+"'>"+rs.getString("near_opc")+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
 
 
 
 

 
	