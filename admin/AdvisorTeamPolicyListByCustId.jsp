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
    Connection con=DBConnection.getConnection();
     PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
     ptmt.executeQuery();
     String cuid=request.getParameter("ppcustid");
     String year=request.getParameter("year");
     System.out.println("Cuid "+cuid);
    PreparedStatement pstmt=con.prepareStatement("select * from add_new_policy where Cust_Id=? And finyear=?");
    pstmt.setString(1,cuid );
    pstmt.setString(2,year);
    ResultSet rs=pstmt.executeQuery();
    int count=0;
    while(rs.next())
    {
    	count++;
    %>
      <tr>
        <td><%=count %></td>
        <td><%=rs.getString("Cust_Id") %></td>
        <td><%=rs.getString("Name") %></td>
        
        <td><%=rs.getString("introCode") %></td>
        <td><%=rs.getString("Mobile_No") %></td>
         <td><%=rs.getString("date") %></td>
         <td><%=rs.getString("planAmt") %></td>
         <td><%=rs.getString("month") %></td>
         <td><%=rs.getString("maturityAmount") %></td>
         <td><%=rs.getString("mDate") %></td>
         <td><%=rs.getString("Near_OPC") %></td>
         <td><a href="policystatement.jsp?Cust_Id=<%= rs.getString("Cust_Id")%>">Print</a></td>
          <td><a href="EditPilicy.jsp?pcustid=<%=rs.getString("Cust_Id")%>">Edit</a></td>
           <td><a href="">Act /</a><a href="">Dct</a></td>
      </tr>
     <%} %>
    </tbody>
  </table>
</body>
</html>