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
        <th><b>Code</b></th>
        <th><b>Name</b></th>
        <th><b>Int. Code</b></th>
        <th><b>Mobile</b></th>
        <th><b>DOJ</b></th>
        <th><b>Password</b></th>
		<th><b>Level</b></th>
        <th><b>OPC</b></th>
        <th><b>Print WC</b></th>
        <th><b>Edit</b></th>
        <th><b>Act/Dct</b></th>
      </tr>
    </thead>
 <tbody>
   

 <%
    Connection cn=DBConnection.getConnection();
 PreparedStatement ptmt=cn.prepareStatement("set global max_connections=100000000");
 ptmt.executeQuery();
 //	String pin_no=request.getParameter("pin_no");
 //	String level=request.getParameter("level");
    String year=request.getParameter("year");
   
    PreparedStatement pstmt=cn.prepareStatement("select * from advisors where year=?");
    pstmt.setString(1, year);
    ResultSet rs=pstmt.executeQuery();
    int count=0;
    while(rs.next())
    {
    	count++;
    	System.out.println("Date Code Inside");
    %>
      <tr>
        <td><%=count %></td>
        <td><%int pin_no=rs.getInt("pin_no");%><%= pin_no %></td>
        <td><%=rs.getString("name") %></td>
        <td><%=rs.getString("intro_code") %></td>
         <td><%=rs.getString("mobile") %></td>
          <td><%=rs.getString("doj") %></td>
          <td><%=rs.getString("code") %></td>
          <td><%String level=rs.getString("level");%><%= level %></td>
            <td><%=rs.getString("near_opc") %></td>
             <td><a href="letter.jsp?pin_no=<%= pin_no%>&level=<%= level%>">Print</a></td>
            <td><center><a class="forprint" href="AdvisorListEdit.jsp?pin_no=<%=rs.getInt("pin_no")%>&year=<%=rs.getString("year")%>"><i class="fa fa-pencil forprint" ></i></a></center></td>
             <td><a href="AdvisorsListStausUpdate.jsp?pin_no=<%=rs.getInt("pin_no")%>&year=<%=rs.getString("year")%>&status=<%="Active"%>">Act</a> <a href="AdvisorsListStausUpdate.jsp?pin_no=<%=rs.getInt("pin_no")%>&year=<%=rs.getString("year")%>&status=<%="Dea-Active"%>">Dct</a></td>
      </tr>
      <%} %>
      </tbody>
      </table>
</body>
</html>