
<%@page import="com.pit.policy.save.GetNameForadvACStmt"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
Connection con=DBConnection.getConnection();
PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
ptmt.executeQuery();
%>
<table border = "1" id="table" style = "width : 100%;margin:0 auto;">
	  					<tr style = "height:40px;background-color:#008DE7;color:#fff;">
	  					<%
	  					PreparedStatement p=con.prepareStatement("select * from wallet where pinNo=? And year=?");
	  					p.setString(1, request.getParameter("advCode"));
	  					p.setString(2, request.getParameter("year"));
	  					ResultSet r=p.executeQuery();
	  					if(r.next())
	  					{
	  						String nm=GetNameForadvACStmt.getNameForadvACStmt(request.getParameter("advCode"));
	  					%>
	  						<th colspan = "3"><center><h4><b><%=nm %></b></h4></center></th>
	  						<th colspan = "3"><center><h4><b><%=request.getParameter("advCode") %></b></h4></center></th>
	  						<th colspan = "3"><center><h4><b style = "color:yellow;"><%=r.getString("balance") %></b></h4></center></th>
	  						<%} %>
	  					</tr>
	  					<tr style = "height:40px;background-color:#008DE7;color:#fff;">
	  						<th><center><b>SN</b></center></th>
	  						<th><center><b>Date</b></center></th>
	  						<th><center><b>Transaction Type</b></center></th>
	  						<th><center><b>Remarks</b></center></th>
	  						<th><center><b>Admin</b></center></th>
	  						<th><center><b>TDS</b></center></th>
	  						<th><center><b>Debit</b></center></th>
	  						<th><center><b>Credit</b></center></th>
	  						<th><center><b>Balance</b></center></th>
	 					</tr>
	 					
	 					<tr style = "height:40px;">
	  						<th colspan="2"><center><b>Total</b></center></th>
	  						<th><center><b></b></center></th>
	  						<th><center><b></b></center></th>
	  						<th><center><b><%
	  						int name5 = 0;
	  						PreparedStatement pstmt5=con.prepareStatement("SELECT SUM(Admin) FROM transaction where pinNo=? And year=?");
	  						pstmt5.setString(1,request.getParameter("advCode") );
	  						pstmt5.setString(2,request.getParameter("year") );
	  						ResultSet res5 = pstmt5.executeQuery();
	  						while (res5.next()) 
	  						{
	  							name5 = res5.getInt(1);
	  							System.out.println(name5);
	  						}				
						%>
						<%=name5 %>	
	  						<th><center><b><%
	  						int name4 = 0;
	  						PreparedStatement pstmt4=con.prepareStatement("SELECT SUM(TDS) FROM transaction where pinNo=? And year=?");
	  						pstmt4.setString(1,request.getParameter("advCode") );
	  						pstmt4.setString(2,request.getParameter("year") );
	  						ResultSet res6 = pstmt4.executeQuery();
	  						while (res6.next()) 
	  						{
	  							name4 = res6.getInt(1);
	  							System.out.println(name4);
	  						}				
						%>
						<%=name4 %>	
	  						<th><center><b><%
	  						int name = 0;
	  						PreparedStatement pstmt1=con.prepareStatement("SELECT SUM(debit) FROM transaction where pinNo=? And year=?");
	  						pstmt1.setString(1,request.getParameter("advCode") );
	  						pstmt1.setString(2,request.getParameter("year") );
	  						ResultSet res2 = pstmt1.executeQuery();
	  						while (res2.next()) 
	  						{
	  							name = res2.getInt(1);
	  							System.out.println(name);
	  						}				
						%>
						<%=name %>	
						</b></center></th>
	  						<th><center><b>
	  						<%
	  						int name1 = 0;
	  						PreparedStatement pstmt2=con.prepareStatement("SELECT SUM(credit) FROM transaction where pinNo=? And year=?");
	  						pstmt2.setString(1, request.getParameter("advCode"));
	  						pstmt2.setString(2, request.getParameter("year"));
	  						ResultSet res3 = pstmt2.executeQuery();
	  						while (res3.next()) 
	  						{
	  							name1 = res3.getInt(1);
	  							System.out.println(name1);
	  						}							
						%>
						<%=name1 %>	
	  						</b></center></th>
	  						<th><center><b>
	  						<%
	  						int name2 = 0;
	  						PreparedStatement pstmt3=con.prepareStatement("SELECT SUM(balance) FROM transaction where pinNo=? And year=?");
	  						pstmt3.setString(1, request.getParameter("advCode"));
	  						pstmt3.setString(2, request.getParameter("year"));
	  						ResultSet res4 = pstmt3.executeQuery();
	  						while (res4.next()) 
	  						{
	  							name2 = res4.getInt(1);
	  							System.out.println(name2);
	  						}							
						%>
						<%=name2 %>	
	  						</b></center></th>
	 					</tr>
	 					
	 					<%
	 					
	 					PreparedStatement pstm=con.prepareStatement("select * from transaction where pinNo=? And year=?");
	 					pstm.setString(1, request.getParameter("advCode"));
	 					pstm.setString(2, request.getParameter("year"));
	 					ResultSet rs1=pstm.executeQuery();
	 					int count=0;
	 					while(rs1.next())
	 					{
	 						count++;
	 						if(rs1.getString("credit").equals("0.0"))
	 				    	{
	 				    		
	 				    	}
	 				    	else
	 				    	{
	 					%>
						<tr style = "height:40px;">
	  						<th><center><b><%=count %></b></center></th>
	  						<th><center><b><%=rs1.getString("date") %></b></center></th>
	  						<th><center><b><%=rs1.getString("tranType") %></b></center></th>
	  						<th><center><b><%=rs1.getString("remark") %></b></center></th>
	  						
	  							<th><center><b><%=rs1.getString("Admin") %></b></center></th>
	  						
	  						
	  							<th><center><b><%=rs1.getString("TDS") %></b></center></th>
	  						
	  						
	  							<th><center><b><%=rs1.getString("debit") %></b></center></th>
	  						
	  						
	  							<th><center><b><%=rs1.getString("credit") %></b></center></th>
	  						
	  							<th><center><b><%=rs1.getString("balance") %></b></center></th>
	  						
	  						
	 					</tr>
	 					<%}} %>
	 					
	 					<tr style = "height:40px;">
	  						<th colspan = "2"><center><b></b></center></th>
	  						<th><center><b></b></center></th>
	  						<th><center><b></b></center></th>
	  						<th><center><b></b></center></th>
	  						<th><center><b></b></center></th>
	  						<th><center><b></b></center></th>
	  						<th><center><b></b></center></th>
	  						<th><center><b></b></center></th>
	 					</tr>
	  				</table>
