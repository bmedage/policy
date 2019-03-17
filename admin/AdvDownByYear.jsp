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
<div class = "col-md-12" style = "overflow-x: auto">   
   <table id="table" style=" width:auto">
    <thead>
       <tr>
        <th><b>Sn</b></th>
        <th><b>Name</b></th>
        <th><b>Ad Code</b></th>
        <th><b>Int. Code</b></th>
        <th><b>Mobile</b></th>
        <th><b>DOJ</b></th>
        <th><b>Level</b></th>
        <th><b>Sales Executive</b></th>
        <th><b>Field Officer</b></th>
        <th><b>Organizer</b></th>
        <th><b>Team Leader</b></th>
        <th><b>Inspector</b></th>
        <th><b>SR. Inspector</b></th>
        <th><b>Developement Officer</b></th>
        <th><b>SR Developement Officer</b></th>
        <th><b>Rezonal Officer</b></th>
        <th><b>Zonal Officer</b></th>
        <th><b>SR Zonal Officer</b></th>
        <th><b>Executiive Manager</b></th>
        <th><b>Pro. Buss</b></th>
        <th><b>Pending</b></th>
         <th><b>Team</b></th>
          <th><b>Promotion</b></th>
      </tr>
    </thead>
    <tbody >
    <%
    String year=request.getParameter("year");
    Connection con=DBConnection.getConnection();
    PreparedStatement ptmt=con.prepareStatement("set global max_connections=100000000");
    ptmt.executeQuery();
    PreparedStatement pstmt=con.prepareStatement("select * from advisordownlinereport where year=?");
    pstmt.setString(1, year);
    int counter=0;
  
    ResultSet rs=pstmt.executeQuery();
    while(rs.next())
    {
    	counter++;
    %>
      <tr>
        <td><%=counter %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><%=rs.getString(4) %></td>
        <td><%=rs.getString(5) %></td>
        <td><%=rs.getString(6) %></td>
        <td><%=rs.getString(7) %></td>
        <td><%String res = "";if(rs.getString(8) == null){res="-";}else{res=rs.getString(8);}%><%= res %></td>
        <td><%res = "";if(rs.getString(9) == null){res="-";}else{res=rs.getString(9);}%><%= res %></td>
        <td><%res = "";if(rs.getString(10) == null){res="-";}else{res=rs.getString(10);}%><%= res %></td>
        <td><%res = "";if(rs.getString(11) == null){res="-";}else{res=rs.getString(11);}%><%= res %></td>
        <td><%res = "";if(rs.getString(12) == null){res="-";}else{res=rs.getString(12);}%><%= res %></td>
        <td><%res = "";if(rs.getString(13) == null){res="-";}else{res=rs.getString(13);}%><%= res %></td>
        <td><%res = "";if(rs.getString(14) == null){res="-";}else{res=rs.getString(14);}%><%= res %></td>
        <td><%res = "";if(rs.getString(15) == null){res="-";}else{res=rs.getString(15);}%><%= res %></td>
        <td><%res = "";if(rs.getString(16) == null){res="-";}else{res=rs.getString(16);}%><%= res %></td>
        <td><%res = "";if(rs.getString(17) == null){res="-";}else{res=rs.getString(17);}%><%= res %></td>
        <td><%res = "";if(rs.getString(18) == null){res="-";}else{res=rs.getString(18);}%><%= res %></td>
        <td><%res = "";if(rs.getString(19) == null){res="-";}else{res=rs.getString(19);}%><%= res %></td>
        <td><%res = "";if(rs.getString(20) == null){res="-";}else{res=rs.getString(20);}%><%= res %></td>
        <td><%res = "";if(rs.getString(21) == null){res="-";}else{res=rs.getString(21);}%><%= res %></td>
        <td><%res = "";if(rs.getString(22) == null){res="-";}else{res=rs.getString(22);}%><%= res %></td>
        <td><%res = "";if(rs.getString(23) == null){res="-";}else{res=rs.getString(23);}%><%= res %></td>
      
      </tr>
      <%} %>
    </tbody>
  </table>  
  
  </div>	
</body>
</html>