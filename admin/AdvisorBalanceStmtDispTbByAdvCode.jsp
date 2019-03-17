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
<!-- tables -->
<link rel="stylesheet" type="text/css" href="css/table-style.css" />
<link rel="stylesheet" type="text/css" href="css/basictable.css" />
<script type="text/javascript" src="js/jquery.basictable.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
      $('#table').basictable();

      $('#table-breakpoint').basictable({
        breakpoint: 768
      });

      $('#table-swap-axis').basictable({
        swapAxis: true
      });

      $('#table-force-off').basictable({
        forceResponsive: false
      });

      $('#table-no-resize').basictable({
        noResize: true
      });

      $('#table-two-axis').basictable();

      $('#table-max-height').basictable({
        tableWrapper: true
      });
    });
</script>
<!-- //tables -->
</head>
<body>
<table  style="border: 3px solid #ddd;" id="table" >
    <thead>
      <tr>
        <th><b>SN</b></th>
        <th><b>Adv Name</b></th>
        <th><b>Adv Code</b></th>
        <th><b>Mobile</b></th>
        <th><b>Credit</b></th>
        <th><b>Debit</b></th>
		<th><b>Balance</b></th>
        <th><b>OPC</b></th>
      </tr>
    </thead>
 <tbody>
   

 <%
    Connection cn=DBConnection.getConnection();
 PreparedStatement ptmt=cn.prepareStatement("set global max_connections=100000000");
 ptmt.executeQuery();
 //	String pin_no=request.getParameter("pin_no");
 	String advCode=request.getParameter("advCode");
    String year=request.getParameter("year");
   
    PreparedStatement pstmt=cn.prepareStatement("select * from wallet where pinNo=? And year=?");
    pstmt.setString(1, advCode);
    pstmt.setString(2, year);
    ResultSet rs=pstmt.executeQuery();
    int count=0;
    while(rs.next())
    {
    	String name=null,mobile=null,opc=null;
    	PreparedStatement pstmt1=cn.prepareStatement("select * from advisors where pin_no=?");
    	pstmt1.setString(1, advCode);
    	ResultSet rs1=pstmt1.executeQuery();
    	while(rs1.next())
    	{
    		name=rs1.getString("name");
    		mobile=rs1.getString("mobile");
    		opc=rs1.getString("near_opc");
    	}
    	count++;
    	
    %>
      <tr>
        <td><%=count %></td>
        <td><%=name%></td>
        <td><%=advCode %></td>
        <td><%=mobile %></td>
         <td><%=rs.getString("credit") %></td>
          <td><%=rs.getString("debit") %></td>
          <td><%=rs.getString("balance") %></td>
            <td><%=opc %></td>
             
      </tr>
      <%} %>
      </tbody>
      </table>
</body>
</html>