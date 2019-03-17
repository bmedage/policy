<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.*"%>
<%
String year=request.getParameter("year");
System.out.println("year = "+year);
String opcName=request.getParameter("opcName"); 
System.out.println("Opc Name = "+opcName);

 String buffer="<select class='form-control1' id='advcodeid' placeholder='DD/MM/YYYY' name='advcode' onChange='advcodecall()'><option value='-1'>- - Select - -</option>";  
 try{
	 Connection con1=DBConnection.getConnection();
	 PreparedStatement ptmt=con1.prepareStatement("set global max_connections=100000000");
	 ptmt.executeQuery();
	 PreparedStatement pstmt=con1.prepareStatement("select * from advisors where year=? And near_opc=? group by pin_no");
	 pstmt.setString(1, year);
	 pstmt.setString(2, opcName);
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
 
 
 
 

 
	