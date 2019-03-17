<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.*"%>
<%
String year=request.getParameter("year");  
 String buffer="<select class='form-control1' name='advCode' id='advCode' placeholder='' onchange='callByAdvId()'><option value='-1'>- - Select - -</option>";  
 try{
	 Connection con1=DBConnection.getConnection();
	 PreparedStatement ptmt=con1.prepareStatement("set global max_connections=100000000");
	 ptmt.executeQuery();
	 PreparedStatement pst1=con1.prepareStatement("select * from advisordownlinereport where year=? group by advCode");
	 pst1.setString(1, request.getParameter("year"));
		ResultSet r1=pst1.executeQuery();
		while(r1.next())
		{
   buffer=buffer+"<option value='"+r1.getString("advCode")+"'>"+r1.getString("advCode")+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
 
 

 
