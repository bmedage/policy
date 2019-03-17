<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
String buffer="<select class='form-control1' id='pcustid' placeholder='DD/MM/YYYY' name='pcustname' onChange='pcustidcall()'><option value='-1'>- - Select - -</option>";

										
									
									Connection conn2=DBConnection.getConnection();
									PreparedStatement ptmt=conn2.prepareStatement("set global max_connections=100000000");
									ptmt.executeQuery();
									PreparedStatement pstmt2=conn2.prepareStatement("select * from add_new_policy where finyear=? ");
									pstmt2.setString(1, request.getParameter("year"));
									ResultSet rs2=pstmt2.executeQuery();
									while(rs2.next())
									{
										buffer=buffer+"<option value='"+rs2.getString("Cust_id")+"'>"+rs2.getString("Cust_id")+"</option>";
								}
									 buffer=buffer+"</select>";  
									 response.getWriter().println(buffer); 
%>