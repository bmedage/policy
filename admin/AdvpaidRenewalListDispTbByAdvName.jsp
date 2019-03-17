<%@page import="com.pit.policy.save.GetInstallPay"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.pit.policy.database.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <th>SN</th>
 			<th>Client ID</th>
 			<th>Name</th>
 			<th>Int. Code</th>
 			<th>Mobile</th>
 			<th>Date of Instalment</th>
 			<th>Inst. Amount</th>
 			<th>Payment Mode</th>
 			<th>Install No</th>
 			<th>Paid No</th>
 			<th>Receipt No</th>
 			<th>OPC</th>
 			<th>Print</th>
      </tr>
    </thead>
    
    <tbody>
     <%
    Connection con=DBConnection.getConnection();
     PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
     ptmt.executeQuery();
     int count=0;
     
     String advName=request.getParameter("advName");
    PreparedStatement pstmt=con.prepareStatement("select * from add_new_policy where intro_name=?");
    pstmt.setString(1,advName);
    ResultSet rs=pstmt.executeQuery();
    System.out.println("In Policy Page");
    
   
    
    
    String paymentMode1=null,custID=null,opcName=null;

   
    while(rs.next())
    {
    	custID=rs.getString("Cust_Id");
    	PreparedStatement pstmt1=con.prepareStatement("select * from renewal_master1 where cust_id=?");
        pstmt1.setString(1,custID);
        ResultSet rs1=pstmt1.executeQuery();
        int no=0;
        while(rs1.next())
        {
        	no++;
        	
        }
        int notPay=GetInstallPay.getInstallPay(custID);
        System.out.println("No Pay="+notPay);
        int installPay=no-notPay;
        System.out.println("Install Pay="+installPay);
       for(int j=1;j<=installPay;j++)
       {
       	count++;
    	opcName=rs.getString("Near_OPC");
   
    %>
      <tr>
        <td><%=count %></td>
        <td><%=rs.getString("Cust_Id") %></td>
        <td><%=rs.getString("Name") %></td>
        <td><%=rs.getString("introCode") %></td>
        <td><%=rs.getString("Mobile_No") %></td>
         <td><%=rs.getString("date") %></td>
         <td><%=rs.getString("planAmt") %></td>
         <td><%=rs.getString("paymentMode") %></td>
         
         
       <%
       PreparedStatement pstmt2=con.prepareStatement("select * from renewal_master1 where cust_id=? And Reciept_no!=? And installments=?");
       pstmt2.setString(1, custID);
       pstmt2.setString(2, "payable");
       pstmt2.setString(3,Integer.toString(j));
       ResultSet rs2=pstmt2.executeQuery();
       if(rs2.next())
       {
       %>
         <td><%=rs2.getString("installments") %>/<%=no%></td>
        
         <td><%=rs2.getString("date_of_paymt") %></td>
          <td><%=rs2.getString("Reciept_no") %></td>
         
         <td><%=opcName %></td>
         <td><a href="manninfosoft.jsp?Cust_Id=<%=rs.getString("Cust_Id") %>">Print</a></td>
         
      </tr>
     <%}} }%>
    </tbody>
  </table>
</body>
</html>