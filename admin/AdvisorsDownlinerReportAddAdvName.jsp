<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.*"%>
<%
String year=request.getParameter("year");  
 String buffer="<select class='form-control1' id='name' name='name' placeholder='' onchange='callByOPCName()'><option value='-1'>- - Select - -</option>";  
 try{
	 Connection con1=DBConnection.getConnection();
	 PreparedStatement ptmt=con1.prepareStatement("set global max_connections=100000000");
	 ptmt.executeQuery();
		PreparedStatement pst=con1.prepareStatement("select * from advisordownlinereport where year=? group by name");
		pst.setString(1, request.getParameter("year"));
		ResultSet r=pst.executeQuery();
		while(r.next())
		{
   buffer=buffer+"<option value='"+r.getString("name")+"'>"+r.getString("name")+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
 
 


										