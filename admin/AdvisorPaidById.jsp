<%@page import="com.pit.policy.save.GetSumForAdvisorPayIdYear"%>
<%@page import="com.pit.policy.save.GetInstallPay"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table id="table" style="border: 3px solid #ddd;">
 				    <thead>
 				      <tr>
 				        <th><b>SN</b></th>
 				         <th><b>Date</b></th>
 				        <th><b>Bussiness</b></th>
 				        <th><b>Pro. Bussiness</b></th>
 				         <th><b>Credit</b></th>
 				          <th><b>TDS</b></th>
 				           <th><b>Admin</b></th>
 				            <th><b>Debit</b></th>
 				        <th><b>Withdrawal</b></th>
 				        <th><b>Payable</b></th>
 				        <th><b>View</b></th>
 				      </tr>
 				    </thead>
<% 
 	try
 	{
 		String year=request.getParameter("year");
 		String pinNo=request.getParameter("pinNo");
 	Connection cn=DBConnection.getConnection();
 	PreparedStatement ptmt=cn.prepareStatement("set global max_connections=100000000");
 	ptmt.executeQuery();
 	String yr[]={"2014-15","2015-16","2016-17","2017-18"};
 	
 		if(request.getParameter("year").equals("2014-15"))
 		{
 			String start[]={"2014-01-31","2014-02-31","2014-03-31","2014-04-31","2014-05-31","2014-06-31","2014-07-31","2014-08-31","2014-09-31","2014-10-31","2014-11-31","2014-12-31"};
 			String end[]={"01","02","03","04","05","06","07","08","09","10","11","12"};
 			String month[]={"01-31","02-31","03-31","04-31","05-31","06-31","07-31","08-31","09-31","10-31","11-31","12-31"};
 			for(int i=0;i<start.length;i++)
 			{
 				for(int j=i;j<end.length;j++)
 				{
 					
 						%>
 				    <tbody>
 				      <tr>
 				        <td><%=j+1%></td>
 				        <%
 				        float bussiness=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearBId(year, start[j], end[j],"bussiness",pinNo);
 				       float pbussiness=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearPId(year, start[j], end[j],"bussiness",pinNo);
 				      float credit=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearCId(year, start[j], end[j],"bussiness",pinNo);
 				     float TDS=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearTId(year, start[j], end[j],"bussiness",pinNo);
 				    float admin=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearAId(year, start[j], end[j],"bussiness",pinNo);
 				   float debit=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearDId(year, start[j], end[j],"bussiness",pinNo);
 				  float withdraw=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearWId(year, start[j], end[j],"bussiness",pinNo);
 				 float balance=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearBalId(year, start[j], end[j],"bussiness",pinNo);
 				  
 				        %>
 				        <td><%=start[j]+"-"+month[j]%></td>
 				        <td><%=bussiness%></td>
 				        <td><%=pbussiness%></td>
 				        <td><%=credit%></td>
 				        <td><%=TDS%></td>
 				        <td><%=admin%></td>
 				        <td><%=debit%></td>
 				        <td><%=withdraw%></td>
 				        <td><%=balance%></td>
 				        <td><a href="#">View</a></td>
 				      </tr>
 				     
 				   
 				<%
 				break;
 				}
 			}
 		}
 		
 		else if(request.getParameter("year").equals("2015-16"))
 		{
 			String start[]={"2015-01-01","2015-02-01","2015-03-01","2015-04-01","2015-05-01","2015-06-01","2015-07-01","2015-08-01","2015-09-01","2015-10-01","2015-11-01","2015-12-01"};
 			String end[]={"01","02","03","04","05","06","07","08","09","10","11","12"};
 			String month[]={"01-31","02-31","03-31","04-31","05-31","06-31","07-31","08-31","09-31","10-31","11-31","12-31"};
 			for(int i=0;i<start.length;i++)
 			{
 				for(int j=i;j<end.length;j++)
 				{
 					
 						%>
 				    <tbody>
 				      <tr>
 				        <td><%=j+1%></td>
 				        <%
 				        float bussiness=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearBId(year, start[j], end[j],"bussiness",pinNo);
 				       float pbussiness=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearPId(year, start[j], end[j],"bussiness",pinNo);
 				      float credit=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearCId(year, start[j], end[j],"bussiness",pinNo);
 				     float TDS=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearTId(year, start[j], end[j],"bussiness",pinNo);
 				    float admin=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearAId(year, start[j], end[j],"bussiness",pinNo);
 				   float debit=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearDId(year, start[j], end[j],"bussiness",pinNo);
 				  float withdraw=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearWId(year, start[j], end[j],"bussiness",pinNo);
 				 float balance=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearBalId(year, start[j], end[j],"bussiness",pinNo);
 				  
 				        %>
 				        <td><%=start[j]+"-"+month[j]%></td>
 				        <td><%=bussiness%></td>
 				        <td><%=pbussiness%></td>
 				        <td><%=credit%></td>
 				        <td><%=TDS%></td>
 				        <td><%=admin%></td>
 				        <td><%=debit%></td>
 				        <td><%=withdraw%></td>
 				        <td><%=balance%></td>
 				        <td><a href="#">View</a></td>
 				      </tr>
 				     
 				   
 				<%
 				break;
 				}
 			}
 		}
 		
 		else if(request.getParameter("year").equals("2016-17"))
 		{
 			String start[]={"2016-01-01","2016-02-01","2016-03-01","2016-04-01","2016-05-01","2016-06-01","2016-07-01","2016-08-01","2016-09-01","2016-10-01","2016-11-01","2016-12-01"};
 			String end[]={"01","02","03","04","05","06","07","08","09","10","11","12"};
 			String month[]={"01-31","02-31","03-31","04-31","05-31","06-31","07-31","08-31","09-31","10-31","11-31","12-31"};
 			for(int i=0;i<start.length;i++)
 			{
 				for(int j=i;j<end.length;j++)
 				{
 					
 						%>
 				    <tbody>
 				      <tr>
 				        <td><%=j+1%></td>
 				        <%
 				       float bussiness=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearBId(year, start[j], end[j],"bussiness",pinNo);
 				       float pbussiness=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearPId(year, start[j], end[j],"bussiness",pinNo);
 				      float credit=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearCId(year, start[j], end[j],"bussiness",pinNo);
 				     float TDS=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearTId(year, start[j], end[j],"bussiness",pinNo);
 				    float admin=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearAId(year, start[j], end[j],"bussiness",pinNo);
 				   float debit=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearDId(year, start[j], end[j],"bussiness",pinNo);
 				  float withdraw=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearWId(year, start[j], end[j],"bussiness",pinNo);
 				 float balance=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearBalId(year, start[j], end[j],"bussiness",pinNo);
 				  
 				        %>
 				        <td><%=start[j]+"-"+month[j]%></td>
 				        <td><%=bussiness%></td>
 				        <td><%=pbussiness%></td>
 				        <td><%=credit%></td>
 				        <td><%=TDS%></td>
 				        <td><%=admin%></td>
 				        <td><%=debit%></td>
 				        <td><%=withdraw%></td>
 				        <td><%=balance%></td>
 				        <td><a href="#">View</a></td>
 				      </tr>
 				     
 				   
 				<%
 				break;
 				}
 			}
 		}
 		else if(request.getParameter("year").equals("2017-18"))
 		{
 			String start[]={"2017-01-01","2017-02-01","2017-03-01","2017-04-01","2017-05-01","2017-06-01","2017-07-01","2017-08-01","2017-09-01","2017-10-01","2017-11-01","2017-12-01"};
 			String end[]={"01","02","03","04","05","06","07","08","09","10","11","12"};
 			String month[]={"01-31","02-31","03-31","04-31","05-31","06-31","07-31","08-31","09-31","10-31","11-31","12-31"};
 			for(int i=0;i<start.length;i++)
 			{
 				for(int j=i;j<end.length;j++)
 				{
 					
 						%>
 				    <tbody>
 				      <tr>
 				        <td><%=j+1%></td>
 				        <%
 				       float bussiness=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearBId(year, start[j], end[j],"bussiness",pinNo);
 				       float pbussiness=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearPId(year, start[j], end[j],"bussiness",pinNo);
 				      float credit=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearCId(year, start[j], end[j],"bussiness",pinNo);
 				     float TDS=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearTId(year, start[j], end[j],"bussiness",pinNo);
 				    float admin=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearAId(year, start[j], end[j],"bussiness",pinNo);
 				   float debit=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearDId(year, start[j], end[j],"bussiness",pinNo);
 				  float withdraw=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearWId(year, start[j], end[j],"bussiness",pinNo);
 				 float balance=GetSumForAdvisorPayIdYear.getSumForAdvisorPayIdYearBalId(year, start[j], end[j],"bussiness",pinNo);
 				  
 				        %>
 				        <td><%=start[j]+"-"+month[j]%></td>
 				        <td><%=bussiness%></td>
 				        <td><%=pbussiness%></td>
 				        <td><%=credit%></td>
 				        <td><%=TDS%></td>
 				        <td><%=admin%></td>
 				        <td><%=debit%></td>
 				        <td><%=withdraw%></td>
 				        <td><%=balance%></td>
 				        <td><a href="#">View</a></td>
 				      </tr>
 				     
 				   
 				<%
 				break;
 				}
 			}
 		}
 	%>
 	 </tbody>
 				  </table><%
 	
/* RequestDispatcher rd=request.getRequestDispatcher("OPCPinAllot.jsp");
rd.forward(request, response); */
// close all the connections.
} 
catch (Exception ex) {
out.println("Unable to connect to database.");
}
%>	
</body>
</html>