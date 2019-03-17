<%@page import="java.util.ArrayList"%>
<%@page import="com.pit.policy.save.GetlevelOfAAdvisor"%>
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
        <th><b>Client ID</b></th>
        <th><b>Name</b></th>
        <th><b>Int Code</b></th>
         <th><b>Mobile</b></th>
          <th><b>DOP</b></th>
           <th><b>Amount</b></th>
            <th><b>Period</b></th>
             <th><b>Maturity amount</b></th>
              <th><b>DOM</b></th>
               <th><b>OPC</b></th>
                <th><b>Print Bond</b></th>
                 <th><b>Edit</b></th>
                  <th><b>Act / Dct</b></th>
      </tr>
    </thead>
    
    <tbody>
     <%
     ArrayList<String> introCode1=new ArrayList();
     introCode1.clear();
    Connection con=DBConnection.getConnection();
     PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
     ptmt.executeQuery();
     String introCode=request.getParameter("introCode");
     String year=request.getParameter("year");
     String getlevelOfAAdvisor=GetlevelOfAAdvisor.getlevelOfAAdvisor(request.getParameter("introCode"),year);
	 System.out.println(getlevelOfAAdvisor);

PreparedStatement pstmt=con.prepareStatement("select * from advisordownlinereport where advCode=? And year=? OR "+getlevelOfAAdvisor+"=?");
pstmt.setString(1, introCode);
pstmt.setString(2,year);
pstmt.setString(3, introCode);
int counter=0;

ResultSet rs=pstmt.executeQuery();
while(rs.next())
{
	introCode1.add(rs.getString("advcode"));
	String pinNo=rs.getString("advCode");
    PreparedStatement pstmt1=con.prepareStatement("select * from add_new_policy where introCode=? And finyear=?");
    pstmt1.setString(1,pinNo );
    pstmt1.setString(2,year );
    ResultSet rs1=pstmt1.executeQuery();
    System.out.println("In Cust Id Page");
    int count=0;
    while(rs1.next())
    {
    	count++;
    %>
      <tr>
        <td><%=count %></td>
        <td><%=rs1.getString("Cust_Id") %></td>
        <td><%=rs1.getString("Name") %></td>
        
        <td><%=rs1.getString("introCode") %></td>
        <td><%=rs1.getString("Mobile_No") %></td>
         <td><%=rs1.getString("date") %></td>
         <td><%=rs1.getString("planAmt") %></td>
         <td><%=rs1.getString("month") %></td>
         <td><%=rs1.getString("maturityAmount") %></td>
         <td><%=rs1.getString("mDate") %></td>
         <td><%=rs1.getString("Near_OPC") %></td>
         <td><a href="policystatement.jsp?Cust_Id=<%= rs1.getString("Cust_Id")%>">Print</a></td>
          <td><a href="EditPilicy.jsp?pcustid=<%=rs1.getString("Cust_Id")%>">Edit</a></td>
           <td><a href="">Act /</a><a href="">Dct</a></td>
      </tr>
     <%}} %>
    </tbody>
  </table>
</body>
</html>