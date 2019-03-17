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
         <th><b><center>OPA</center></b></th>
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
 	 System.out.println("year="+year);
 	 String advCode=request.getParameter("advCode");
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
 		pbuss=rss.getFloat("pbuss");
 		System.out.println("pbuss"+pbuss);
 		target=rss.getFloat("target");
 		System.out.println("Target"+target);
 		status=rss.getString("status");
 		
 			if(pbuss>target)
 			{
 				System.out.println("Insite If");
 				System.out.println("Hello");
 			counter++;
 			level=rss.getString("level");
 			pinNo=rss.getString("Pin_no");
 			name=rss.getString("name");
 			intCode=rss.getString("intro_code");
 		 mobile=rss.getString("mobile"); 
 			doj=rss.getString("doj");
 			nearOpc=rss.getString("Near_OPC");
 			System.out.println("Insite If"+pbuss);
 			PreparedStatement pstmt=cn.prepareStatement("select * from opa where finyerar=? And level=? And pbuss>=?");
 			pstmt.setString(1, year);
 			pstmt.setString(2, level);
 			pstmt.setFloat(3, pbuss);
 			ResultSet rs=pstmt.executeQuery();
 			while(rs.next())
 			{
 				System.out.println("Insite While");
 				String opa=rs.getString("price");
 				String amount=rs.getString("pamount");
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
         <td><center><b><%=opa%></b></center></td>
        <td><center><b><%=nearOpc%></b></center></td>
        <td><center><b><%=amount%></b></center></td>
        <td><center><b><a href="letter.jsp?">Print</a></b></center></td>	
        <td><center><b><%="Active"%></b></center></td>
      </tr>
 			<%break;
 			}
 			}
 			else
 			{
 				continue;
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