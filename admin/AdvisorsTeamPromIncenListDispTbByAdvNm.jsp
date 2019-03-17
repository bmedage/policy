<%@page import="com.pit.policy.save.GetlevelOfAAdvisor"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
       <th><b><center>Sn</center></b></th>
        <th><b><center>Code</center></b></th>
        <th><b><center>Name</center></b></th>
		<th><b><center>Int Code</center></b></th>
        <th><b><center>Mobile</center></b></th>
        <th><b><center>DOJ</center></b></th>
         <th><b><center>Level</center></b></th>
        <th><b><center>Pro.Buss</center></b></th>
         <th><b><center>Promt</center></b></th>
          <th><b><center>Pro</center></b></th>
         <th><b><center>OPC</center></b></th>
          <th><b><center>Amount</center></b></th>
          <th><b><center>Print</center></b></th>
           <th><b><center>Act/Dct</center></b></th>
      </tr>
    </thead>
     <tbody>
    <%
 	Connection cn=DBConnection.getConnection();
    PreparedStatement ptmt=cn.prepareStatement("set global max_connections=100000000");
    ptmt.executeQuery();
 	 
 	 String year=request.getParameter("year");
 	 String advCode=request.getParameter("advCode");
 	 System.out.println("year="+year);
 	 try
 	 {
 	float pbuss=0,target=0; 
 	String level=null,pinNo=null,name=null,intCode=null,doj=null,mobile=null,nearOpc=null,status=null;
 	 PreparedStatement pst=cn.prepareStatement("select * from advisors where year=? And pin_no=?");
 	pst.setString(1, year);
 	pst.setString(2, advCode);
 	ResultSet rss=pst.executeQuery();
 	int counter=0;
	while(rss.next())
 	{
		counter++;
 		pbuss=rss.getFloat("pbuss");
 		pinNo=rss.getString("Pin_no");
 		
 		System.out.println("pbuss"+pbuss);
 		target=rss.getFloat("target");
 		System.out.println("Target"+target);
 		status=rss.getString("status");
 		
 			level=rss.getString("level");
 			
 			name=rss.getString("name");
 			intCode=rss.getString("intro_code");
 		 mobile=rss.getString("mobile"); 
 			doj=rss.getString("doj");
 			nearOpc=rss.getString("Near_OPC");
 			int cnt=0;
 			ArrayList<String> advpin=new ArrayList();
 	 		advpin.clear();
 	 		String getlevelOfAAdvisor=GetlevelOfAAdvisor.getlevelOfAAdvisor(request.getParameter("advCode"),year);
   		 System.out.println(getlevelOfAAdvisor);
   
   PreparedStatement pstmt=cn.prepareStatement("select * from advisordownlinereport where advCode=? And year=? OR "+getlevelOfAAdvisor+"=?");
   pstmt.setString(1, advCode);
   pstmt.setString(2,year);
   pstmt.setString(3, advCode);
   int counter1=0;

   ResultSet rs=pstmt.executeQuery();
   while(rs.next())
   {
	   advpin.add(rs.getString("advCode"));
  
 			PreparedStatement pstmt3=cn.prepareStatement("select * from advisors where Pin_no=? And year=?");
 			pstmt3.setString(1, pinNo);
 			pstmt3.setString(2, year);
 			ResultSet rs2=pstmt3.executeQuery();
 			
 			while(rs2.next())
 			{
 				System.out.println("Second While");
 				float pbuss1=rs2.getFloat("pbuss");
 				float target1=rs2.getFloat("target");
 		 		
 		 		
 		 			if(pbuss>=target)
 		 			{
 		 			cnt++;
 		 			}
 			}
 			float pr=0;
 			PreparedStatement pstmt1=cn.prepareStatement("select * from promotive_incentive where fyear=? And level=?");
 			pstmt1.setString(1, year);
 			pstmt1.setString(2, level);
 			ResultSet rs1=pstmt1.executeQuery();
 			while(rs1.next())
 			{
 				System.out.println("Third While");
 				int firstMax=rs1.getInt("firstminfo");
 				int firstMin=rs1.getInt("firstmaxfo");
 				int secondMax=rs1.getInt("sceondmaxfo");
 				int secondMin=rs1.getInt("secondminfo");
 				int thirdMax=rs1.getInt("thirdmaxfo");
 				int thirdMin=rs1.getInt("thirdminfo");
 				if(cnt>=firstMin&&cnt<=firstMax)
 				{
 				pr=rs1.getFloat("firstper");
 				}
 				else if(cnt>=secondMin&&cnt<=secondMax)
 				{
 				pr=rs1.getFloat("secondper");
 				}
 				else if(cnt>=thirdMin&&cnt<=thirdMax)
 				{
 				pr=rs1.getFloat("thirdper");
 				}
 			}
 			float amount=pbuss/100*pr;
 			%>
 				 <tr>
        <td><center><b><%=counter%></b></center></td>
        <td><center><b><%=pinNo%></center></b></td>
        <td><b style = "float:left;"><%=name%></b></td>
        <td><b style = "float:left;"><%=intCode%></b></td>
         <td><center><b><%=mobile%></b></center></td>
          <td><center><b><%=doj%></b></center></td>
        <td><center><b><%=level%></b></center></td>
        <td><center><b><%=pbuss%></b></center></td>
         <td><center><b><%=cnt%></b></center></td>
        <td><center><b><%=pr%></b></center></td>
        <td><center><b><%=nearOpc%></b></center></td>
        <td><center><b><%=amount%></b></center></td>
        <td><center><b><a href="">Print</a></b></center></td>	
        <td><center><b><%="Active"%></b></center></td>
      </tr>
 			<%
 			
 			
   }	
 		}
 	
 	
 	
 	
		%>
   
     
   
		
    </tbody>
  </table>
<%
/* RequestDispatcher rd=request.getRequestDispatcher("OPCPinAllot.jsp");
rd.forward(request, response); */
// close all the connections.
 
 	 }
catch (Exception ex) {
	ex.printStackTrace();
}
%>
</body>
</html>